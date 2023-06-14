package com.poly.controller;

import java.io.IOException;
import java.util.List;

import com.poly.constant.SessionAttr;
import com.poly.entity.Users;
import com.poly.entity.Videos;
import com.poly.entity.History;
import com.poly.service.Email_Service;
import com.poly.service.HistoryService;
import com.poly.service.VideoService;
import com.poly.service.impl.Email_ServiceImpl;
import com.poly.service.impl.HistoryServiceImpl;
import com.poly.service.impl.VideoServiceImpl;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/video")
public class VideoController extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Email_Service eServices = new Email_ServiceImpl();
	private VideoService videoService =new VideoServiceImpl();
	private HistoryService historyService = new HistoryServiceImpl();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String actionParam = req.getParameter("action");
		String href = req.getParameter("id");
		HttpSession session = req.getSession();
		switch(actionParam) {
		case "watch":
			doGetWatch(session, href, req,resp);
			break;
		case "like":
			doGetLike(session, href, req,resp);
			break;
		}
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String actionParam = req.getParameter("action");
		switch(actionParam) {
		case "share":
			doPostShareVid( req,resp);
			break;
		}
	}
	private void doPostShareVid(HttpServletRequest req, HttpServletResponse resp) {
		resp.setContentType("application/json");
		String email = req.getParameter("email");
		String href = req.getParameter("href");
		if(email !=null) {
			Videos v = videoService.findByHref(href);
			v.setShares(v.getShares()+1);
			videoService.update(v);
			eServices.sendMail(getServletContext(), email,href, "share"); // nghien sai enum trong constan
			resp.setStatus(204);
		}else {
			resp.setStatus(400);
		}
		
	}
	private static final int VIDEO_MAX_PAGE_SIZE = 4;
	protected void doGetWatch(HttpSession session , String href ,HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Videos video = videoService.findByHref(href);
		List<Videos> cound_vid = videoService.findAll();
		int maxPage = (int) Math.ceil(cound_vid.size() / (double) VIDEO_MAX_PAGE_SIZE);
		req.setAttribute("maxPage", maxPage);
		String pageNumber = req.getParameter("page");
		List<Videos> videos = null;
		
		if (pageNumber == null) {
			videos = videoService.findAllNoVideoCurrent(1, VIDEO_MAX_PAGE_SIZE,href);
			req.setAttribute("currentPage", 1);
		} else {
			
			videos = videoService.findAllNoVideoCurrent(Integer.valueOf(pageNumber), VIDEO_MAX_PAGE_SIZE,href);
			req.setAttribute("currentPage", Integer.valueOf(pageNumber));
		}
		for (Videos videos2 : videos) {
			if(videos2.getHref().equals("yjRHZEUamCc")) {
				System.out.println(" views ; "+videos2.getViews());
			}
		}
		req.setAttribute("videos", videos);
		
		req.setAttribute("video", video);
		Users currentUser = (Users) session.getAttribute(SessionAttr.CURRENT_USER);
		  if(currentUser != null) { 
			  History history = historyService.create(currentUser, video); 
				  history.getIsLiked();
				  req.setAttribute("flagLikedBtn", history.getIsLiked()); 
				  req.getRequestDispatcher("/views_user/view_detail_video.jsp").forward(req, resp);
			  }else {
				  req.getRequestDispatcher("/index").forward(req, resp);
				  System.out.println("lỗi");
			  }
		
	}
	
	protected void doGetLike(HttpSession session , String href ,HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("application/json");
		Users currentUser = (Users) session.getAttribute(SessionAttr.CURRENT_USER);
		
		boolean result = historyService.updateLikeorUnlike(currentUser, href);
		if(result == true) {
			resp.setStatus(204);//succed but no data
		}else {
			resp.setStatus(400);
			
		}
	}

}
