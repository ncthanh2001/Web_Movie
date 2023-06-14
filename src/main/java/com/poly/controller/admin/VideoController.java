package com.poly.controller.admin;

import java.io.IOException;
import java.util.List;

import com.poly.constant.SessionAttr;
import com.poly.entity.Users;
import com.poly.entity.Videos;
import com.poly.service.VideoService;
import com.poly.service.impl.VideoServiceImpl;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(urlPatterns = {"/admin/video"},name = "VideoControllerAdmin")
public class VideoController extends HttpServlet{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private VideoService videoService = new VideoServiceImpl();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		Users currentUsers = (Users) session.getAttribute(SessionAttr.CURRENT_USER);
		if(currentUsers != null && currentUsers.getIsAdmin() == Boolean.TRUE) {
			String action = req.getParameter("action");
			switch (action) {
			case "view": 
				req.setAttribute("edit_video", "edit");
				doGetOverView(req, resp);
				break;
			case"delete":
				doGetDelete(req,resp);
				break;
			case"add":
				req.setAttribute("isEdit",false);
				doGetAdd(req,resp);
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
			case"add":
				doPostAdd(req,resp);
				break;
			case"edit":
				doPostEdit(req,resp);
				break;
			}
		}else {
			resp.sendRedirect("index");
		}
	}
	private static final int VIDEO_MAX_PAGE_SIZE = 4;
	protected void doGetOverView(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<Videos> countVideo = videoService.findAll();
		int maxPage = (int) Math.ceil(countVideo.size() / (double) VIDEO_MAX_PAGE_SIZE);
		req.setAttribute("maxPage", maxPage);
		String pageNumber = req.getParameter("page");
		List<Videos> videos = null;
		if (pageNumber == null) {
			videos = videoService.findAll(1, VIDEO_MAX_PAGE_SIZE);
			req.setAttribute("currentPage", 1);
		} else {
			
			videos = videoService.findAll(Integer.valueOf(pageNumber), VIDEO_MAX_PAGE_SIZE);
			req.setAttribute("currentPage", Integer.valueOf(pageNumber));
		}

		req.setAttribute("videos", videos);
		req.getRequestDispatcher("/views_staff/video_overview.jsp").forward(req, resp);
		
	}
	protected void doGetDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("application/json");
		String href= req.getParameter("href");
		System.out.println("href --- "+href);
		Videos videoDelete  = videoService.delete(href);
		System.out.println("video --- "+videoDelete.getHref());
		if(videoDelete != null) {
			resp.setStatus(204);
		}else {
			resp.setStatus(400);
		}
	}
	protected void doGetAdd(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		req.getRequestDispatcher("/views_staff/staff_vid.jsp").forward(req, resp);
		
	}
	
	protected void doPostAdd(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("application/json");
		String title= req.getParameter("title");
		String href= req.getParameter("newHref");
		String poster= req.getParameter("poster");
		String description= req.getParameter("description");
		
		Videos video = new Videos();
		video.setTitle(title);
		video.setHref(href);
		video.setPoster(poster);
		video.setDesciption(description);
		
		Videos videoreturn = videoService.create(video);

		if(videoreturn != null) {
			resp.setStatus(204);
		}else {
			resp.setStatus(400);
		}
		
		
	}
	protected void doPostEdit(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("application/json");
		String title= req.getParameter("title");
		String href= req.getParameter("newHref");
		String poster= req.getParameter("poster");
		String description= req.getParameter("description");
		String hrefOrigin = req.getParameter("hrefOrigin");
		
		Videos video = videoService.findByHref(hrefOrigin);
		if(video!= null) {
			System.out.println("id = "+video.getvId());
			video.setTitle(title);
			video.setHref(href);
			video.setPoster(poster);
			video.setDesciption(description);
		}else{
			System.out.println("looxi");
		}
		
		Videos videoreturn = videoService.update(video);

		
		
		
		if(videoreturn != null) {
			
		
			
			resp.setStatus(204);
		}else {
			resp.setStatus(400);
		}
		
		
	}
	protected void doGetEdit(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<Videos> countVideo = videoService.findAll();
		int maxPage = (int) Math.ceil(countVideo.size() / (double) VIDEO_MAX_PAGE_SIZE);
		req.setAttribute("maxPage", maxPage);
		String pageNumber = req.getParameter("page");
		List<Videos> videos = null;
		if (pageNumber == null) {
			videos = videoService.findAll(1, VIDEO_MAX_PAGE_SIZE);
			req.setAttribute("currentPage", 1);
		} else {
			
			videos = videoService.findAll(Integer.valueOf(pageNumber), VIDEO_MAX_PAGE_SIZE);
			req.setAttribute("currentPage", Integer.valueOf(pageNumber));
		}

		req.setAttribute("videos", videos);
		String href = req.getParameter("href");
		Videos video = videoService.findByHref(href);
		req.setAttribute("video", video);
		req.getRequestDispatcher("/views_staff/video_overview.jsp").forward(req, resp);
		
	}
	
}
