package com.poly.controller.admin;

import java.io.IOException;
import java.util.List;

import com.poly.constant.SessionAttr;
import com.poly.entity.Users;
import com.poly.entity.Videos;
import com.poly.service.UserService;
import com.poly.service.impl.UserServiceImpl;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(urlPatterns = {"/admin/user"},name = "UserControllerAdmin")
public class UserController extends HttpServlet{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		Users currentUsers = (Users) session.getAttribute(SessionAttr.CURRENT_USER);
		if(currentUsers != null && currentUsers.getIsAdmin() == Boolean.TRUE) {
			String action = req.getParameter("action");
			switch (action) {
			case "view": 
				req.setAttribute("edit_user","user");
				doGetAllUser(req, resp);
				break;
			case"delete":
				doGetDelete(req,resp);
				break;
			case"edit":
				req.setAttribute("isEdit", true);
				doGetEdit(req,resp);
				break;
				
				
			}
			
		
	}else {
		resp.sendRedirect("index");
	}
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		Users currentUsers = (Users) session.getAttribute(SessionAttr.CURRENT_USER);
		if(currentUsers != null && currentUsers.getIsAdmin() == Boolean.TRUE) {
			String action = req.getParameter("action");
			switch (action) {
			case"edit":
				req.setAttribute("isEdit",true);
				doPostEdit(req,resp);
				break;
			}
		}else {
			resp.sendRedirect("index");
		}
	}
	private static final int VIDEO_MAX_PAGE_SIZE = 4;
	private UserService userService = new UserServiceImpl();
	protected void doGetAllUser(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<Users> countVideo = userService.findAll();
		int maxPage = (int) Math.ceil(countVideo.size() / (double) VIDEO_MAX_PAGE_SIZE);
		req.setAttribute("maxPage", maxPage);
		String pageNumber = req.getParameter("page");
		List<Users> videos = null;
		if (pageNumber == null) {
			videos = userService.findAll(1, VIDEO_MAX_PAGE_SIZE);
			req.setAttribute("currentPage", 1);
		} else {
			
			videos = userService.findAll(Integer.valueOf(pageNumber), VIDEO_MAX_PAGE_SIZE);
			req.setAttribute("currentPage", Integer.valueOf(pageNumber));
		}

		req.setAttribute("videos", videos);
		req.getRequestDispatcher("/views_staff/edit_users.jsp").forward(req, resp);
		
	}
	protected void doGetDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("application/json");
		String username= req.getParameter("username");
		Users videoDelete  = userService.delete(username);
		if(videoDelete != null) {
			resp.setStatus(204);
		}else {
			resp.setStatus(400);
		}
	}

	protected void doPostEdit(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("application/json");
		
		String username= req.getParameter("username");
		String fullname= req.getParameter("fullname");
		String email= req.getParameter("email");
		String usernameOrigin = req.getParameter("usernameOrigin");
		
		Users video = userService.findByUsername(usernameOrigin);
		if(video!= null) {
			video.setUsername(username);
			video.setEmail(email);
			video.setFullname(fullname);
		}else{
			System.out.println("looxi");
		}
		Users videoreturn = userService.update(video);

		if(videoreturn != null) {

			resp.setStatus(204);
		}else {
			resp.setStatus(400);
		}
		
		
	}
	protected void doGetEdit(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<Users> countVideo = userService.findAll();
		int maxPage = (int) Math.ceil(countVideo.size() / (double) VIDEO_MAX_PAGE_SIZE);
		req.setAttribute("maxPage", maxPage);
		String pageNumber = req.getParameter("page");
		List<Users> videos = null;
		if (pageNumber == null) {
			videos = userService.findAll(1, VIDEO_MAX_PAGE_SIZE);
			req.setAttribute("currentPage", 1);
		} else {
			
			videos = userService.findAll(Integer.valueOf(pageNumber), VIDEO_MAX_PAGE_SIZE);
			req.setAttribute("currentPage", Integer.valueOf(pageNumber));
		}

		req.setAttribute("videos", videos);
		String username = req.getParameter("username");
		Users video = userService.findByUsername(username);
		req.setAttribute("video", video);
		req.getRequestDispatcher("/views_staff/edit_users.jsp").forward(req, resp);
		
	}
}
