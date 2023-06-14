	package com.poly.controller.admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.poly.constant.SessionAttr;
import com.poly.dto.UsersDto;
import com.poly.dto.VideoLikedInfo;
import com.poly.entity.Users;
import com.poly.entity.Videos;
import com.poly.service.StatsService;
import com.poly.service.UserService;
import com.poly.service.impl.StatsServiceImpl;
import com.poly.service.impl.UserServiceImpl;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(urlPatterns = {"/iwelcom","/admin","/admin/favorites"},name = "HomeAdmin")
public class HomeController extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private StatsService statsService = new StatsServiceImpl();
	private UserService userService = new UserServiceImpl();
	private static final int VIDEO_MAX_PAGE_SIZE = 8;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		Users currentUser = (Users) session.getAttribute(SessionAttr.CURRENT_USER);
		
		if(currentUser != null && currentUser.getIsAdmin() == Boolean.TRUE) {
			String path = req.getServletPath();
			switch(path) {
			case "/iwelcom":
				req.setAttribute("welecom", "welcom");
				doIwelcom(req, resp);
				break;
			case "/admin":
				req.setAttribute("report","report");
				doGetHome(req, resp);
				break;
			case"/admin/favorites":
	
				doGetFavorites(req, resp);
				break;
			}
			
		}else {
			resp.sendRedirect("index");
		}
		
	}
	private void doIwelcom(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.getRequestDispatcher("/views_staff/index_welcom.jsp").forward(req, resp);
	}
	private void doGetHome(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<VideoLikedInfo> countVideo = statsService.findVideoLikedInfor();
		int maxPage = (int) Math.ceil(countVideo.size() / (double) VIDEO_MAX_PAGE_SIZE);
		req.setAttribute("maxPage", maxPage);
		String pageNumber = req.getParameter("page");
		List<VideoLikedInfo> listvideos = null;
		if (pageNumber == null) {
			listvideos = statsService.findVideoLikedInfor(1, VIDEO_MAX_PAGE_SIZE);
			req.setAttribute("currentPage", 1);
		} else {
			
			listvideos = statsService.findVideoLikedInfor(Integer.valueOf(pageNumber), VIDEO_MAX_PAGE_SIZE);
			req.setAttribute("currentPage", Integer.valueOf(pageNumber));
		}

		/* List<VideoLikedInfo> videos = statsService.findVideoLikedInfor(); */
		req.setAttribute("video", listvideos);
		req.getRequestDispatcher("/views_staff/index.jsp").forward(req, resp);
	}
	private void doGetFavorites(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//report.jsp
		PrintWriter out = resp.getWriter();
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("application/json");
		String videohref=req.getParameter("href");
		List<UsersDto>users = userService.findUsersLikedByVideoHref(videohref);
		if(users.isEmpty()) {
			resp.setStatus(400);
		}else {
			ObjectMapper mapper =  new ObjectMapper();
			String dataRespone = mapper.writeValueAsString(users);
			resp.setStatus(200);
			out.print(dataRespone);
			out.flush();
		}
	}
}
