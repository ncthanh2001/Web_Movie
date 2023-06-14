package com.poly.controller;

import java.io.IOException;

import com.poly.constant.SessionAttr;
import com.poly.entity.Users;
import com.poly.entity.Videos;
import com.poly.service.Email_Service;
import com.poly.service.UserService;
import com.poly.service.impl.Email_ServiceImpl;
import com.poly.service.impl.UserServiceImpl;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet({"/login","/logout","/register","/forgotPass","/changePass","/editProfile"})
public class UserController extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = -5860351843059541642L;
	private Email_Service eServices = new Email_ServiceImpl();
	private UserService userService = new UserServiceImpl();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String path = req.getServletPath();
		HttpSession ss = req.getSession();
		switch(path) {
		case"/login":
			System.out.println("get - login");
			doGetLogin(req, resp);
			break;
		case"/register":
			System.out.println("get - register");
			doGetRegister(req, resp);
			break;
		case"/logout":
			System.out.println("get - logout");
			doGetLogout(ss, req, resp);
			break;
		case"/forgotPass":
			System.out.println("get - getforgot");
			doGetForgotPass(req, resp);
			break;
		case"/editProfile":
			System.out.println("get - login");
			doGetEditProfile(req, resp);
			break;
		}
	}



	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession ss = req.getSession();
		String path = req.getServletPath();
		switch(path) {
		case"/login":
			System.out.println("post - login");
			
			doPostLogin(ss, req, resp);
			break;
		case"/register":
			System.out.println("post - register");
			doPostRegister(ss,req, resp);
			break;
		case"/forgotPass":
			System.out.println("post - getforgot");
			doPostForgotPass(req, resp);
			break;
		case"/changePass":
			System.out.println("post - getforgot");
			doPostChangePass(ss,req, resp);
			break;
		case"/editProfile":
			System.out.println("get - login");
			doPostEditProfile(ss, req, resp);
			break;
		}
	}
	


	private void doGetLogin(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/views_user/Login.jsp").forward(req, resp);
	}
	private void doPostLogin(HttpSession session,HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		session.removeAttribute("log");
		Cookie ck = new Cookie("mess","LogIn_Success");
		ck.setMaxAge(60*60*24);
		req.setAttribute("mess","LoIn Success");
		String username = req.getParameter("username");
		String password = req.getParameter("pswd");
		String remember = req.getParameter("remember");
		Users u =  userService.Login(username, password);
		if(u !=null) {
			if(remember!=null) {
				session.setAttribute("remember", "ghi nho");
			}else {
				session.removeAttribute("remember");
			}
			session.setAttribute(SessionAttr.CURRENT_USER, u);
			session.setMaxInactiveInterval(60*60*24);
			resp.addCookie(ck);
		resp.sendRedirect("index");

		}else {
			req.setAttribute("mess", "Login Thất Bại");
			req.getRequestDispatcher("/views_user/Login.jsp").forward(req, resp);
		}
		
//		call 
//		resp.setContentType("application/json");
//		String username = req.getParameter("username");
//		String password = req.getParameter("pwd");
//		String remember = req.getParameter("remember");
//		Users u =  userService.Login(username, password);
//		
//		if(u != null) {
//			if(remember!=null) {
//				session.setAttribute("remember", "ghi nho");
//			}else {
//				session.removeAttribute("remember");
//			}
//			session.setAttribute(SessionAttr.CURRENT_USER, u);
//			resp.setStatus(204);
//		}else {
//			resp.setStatus(400);
//		}
		
	}
	
	private void doGetRegister(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/views_user/register.jsp").forward(req, resp);
		
	}
	private void doPostRegister(HttpSession session, HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		String username = req.getParameter("username");
		String fullname = req.getParameter("fullname");
		String pass = req.getParameter("pswd");
		String repass= req.getParameter("rspswd");
		String email = req.getParameter("email");
	
		if(pass.equals(repass)) {
			Users u = userService.create(username, pass, email, fullname);
			if(u!=null) {
				eServices.sendMail(getServletContext(), u, "welcom");
				req.setAttribute("messRegister", "Đăng ký thành công - Bạn có thể đăng nhập để xem film");
				req.getRequestDispatcher("/views_user/register.jsp").forward(req, resp);
//				session.setAttribute(SessionAttr.CURRENT_USER, u);
//				resp.sendRedirect("index");
//				req.getRequestDispatcher("/index.jsp").forward(req, resp);
			}
			
		}else {
			req.setAttribute("err", "password không khớp ");
			resp.sendRedirect("register");
		}
		
	}

	
	private void doGetForgotPass(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/views_user/index_view_ForgotPass.jsp").forward(req, resp);
		
	}
	private void doPostForgotPass( HttpServletRequest req, HttpServletResponse resp) throws IOException {
			resp.setContentType("application/json");
			String email = req.getParameter("email");
			Users userNewPass = userService.resetPass(email);
			if(userNewPass !=null) {
				eServices.sendMail(getServletContext(), userNewPass, "forgot"); // nghien sai enum trong constan
				resp.setStatus(204);
			}else {
				resp.setStatus(400);
			}
	}
	
	private void doPostChangePass(HttpSession ss, HttpServletRequest req, HttpServletResponse resp) throws IOException {
		resp.setContentType("application/json");
		String currentPass = req.getParameter("currentPass");
		String pass1 = req.getParameter("password1");
		String pass2 = req.getParameter("password2");
		Users currentUser = (Users) ss.getAttribute(SessionAttr.CURRENT_USER);
		
		if(currentPass.equals(currentUser.getPassword())) {
			currentUser.setPassword(pass1);
			Users updateU = userService.update(currentUser);
			if(updateU !=null) {
				ss.setAttribute(SessionAttr.CURRENT_USER, updateU);
				resp.setStatus(204);
				
			}else {
				resp.setStatus(400);	
			}
		}else {
			resp.setStatus(400);
		}
}
	private void doGetEditProfile(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/views_user/index_view_Edit_Profile.jsp").forward(req, resp);
		
	}
	private void doPostEditProfile(HttpSession ss, HttpServletRequest req, HttpServletResponse resp) throws IOException {
		resp.setContentType("application/json");
		String Username = req.getParameter("username");
		String Fullname = req.getParameter("fullname");
		String Email = req.getParameter("email");
		Users currentUser = (Users) ss.getAttribute(SessionAttr.CURRENT_USER);

		currentUser.setUsername(Username);
		currentUser.setFullname(Fullname);
		currentUser.setEmail(Email);
			Users updateU = userService.update(currentUser);
			if(updateU !=null) {
				ss.setAttribute(SessionAttr.CURRENT_USER, updateU);
				resp.setStatus(204);
				
			}else {
				resp.setStatus(400);	
			}
	
}
	private void doGetLogout(HttpSession ss, HttpServletRequest req, HttpServletResponse resp) throws IOException {
		ss.setAttribute("log", "log");
		if(ss.getAttribute("remember")!=null) {
			resp.sendRedirect("login");
		}else {
			ss.removeAttribute(SessionAttr.CURRENT_USER);
			resp.sendRedirect("index");
		}
	
		
		
	}
}
