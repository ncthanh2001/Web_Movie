package com.poly.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import com.poly.constant.SessionAttr;
import com.poly.entity.History;
import com.poly.entity.Users;
import com.poly.entity.Videos;
import com.poly.service.HistoryService;
import com.poly.service.VideoService;
import com.poly.service.impl.HistoryServiceImpl;
import com.poly.service.impl.VideoServiceImpl;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet({ "/index", "/favorites", "/history" })
public class HomeController extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1517115637537021552L;
	private static final int VIDEO_MAX_PAGE_SIZE = 8;
	private VideoService videoServices = new VideoServiceImpl();
	private HistoryService historyServices = new HistoryServiceImpl();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		String path = req.getServletPath();
		switch (path) {
		case "/index":
			req.setAttribute("index", "index");
			doGetIndex(req, resp);
			break;
		case "/favorites":
			req.setAttribute("favorites", "favorites");
			doGetFavorites(session, req, resp);
			break;
		case "/history":
			req.setAttribute("history", "history");
			doHistory(session, req, resp);
			
		}

	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		String path = req.getServletPath();

		doPostTile(req,resp);
	}
	private void doPostTile(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String title = req.getParameter("title");
		List<Videos> videos = videoServices.findByTitle("%"+title+"%");
		if(videos.size() > 0) {
			req.setAttribute("messSearch","Kết quả tìm kiếm : "+ title);
			req.setAttribute("videos", videos);
			req.getRequestDispatcher("/index.jsp").forward(req, resp);
			System.out.println(""+videos);
		}else {
			req.setAttribute("messSearch","Kết quả tìm kiếm : "+ title);
			req.setAttribute("errSearch","Không Có video Nào Được tìm thấy : "+ title);
			req.getRequestDispatcher("/index.jsp").forward(req, resp);
			System.out.println("null"+videos);
		}
		
	
	}
	private void doGetIndex(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		List<Videos> countVideo = videoServices.findAll();
		int maxPage = (int) Math.ceil(countVideo.size() / (double) VIDEO_MAX_PAGE_SIZE);
		req.setAttribute("maxPage", maxPage);
		String pageNumber = req.getParameter("page");
		List<Videos> videos = null;
		if (pageNumber == null) {
			videos = videoServices.findAll(1, VIDEO_MAX_PAGE_SIZE);
			req.setAttribute("currentPage", 1);
		} else {
			
			videos = videoServices.findAll(Integer.valueOf(pageNumber), VIDEO_MAX_PAGE_SIZE);
			req.setAttribute("currentPage", Integer.valueOf(pageNumber));
		}
		for (Videos videos2 : videos) {
			if(videos2.getHref().equals("yjRHZEUamCc")) {
				System.out.println(" views ; "+videos2.getViews());
			}
		}
		req.setAttribute("videos", videos);
		req.getRequestDispatcher("/index.jsp").forward(req, resp);

	}

	private void doGetFavorites(HttpSession session, HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		Users user = (Users) session.getAttribute(SessionAttr.CURRENT_USER);
		if(user !=null) {
			
			List<History> histories = historyServices.findByUserAndIsLike(user.getUsername());
			List<Videos> videos = new ArrayList<>();
			histories.forEach(item -> videos.add(item.getVideo()));// for each của java 8
			
			req.setAttribute("videos", videos);
			req.getRequestDispatcher("/views_user/index_view_favorite.jsp").forward(req, resp);
		}else {
			req.getRequestDispatcher("/index.jsp").forward(req, resp);
		}

	}

	private void doHistory(HttpSession session, HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		Users user = (Users) session.getAttribute(SessionAttr.CURRENT_USER);
		if(user!=null) {
			
			List<History> histories = historyServices.findByUser(user.getUsername());
			List<Videos> videos = new ArrayList<>();
			histories.forEach(item -> videos.add(item.getVideo()));// for each của java 8
			
			req.setAttribute("videos", videos);
			req.getRequestDispatcher("/views_user/index_view_history.jsp").forward(req, resp);
		}
		else {
			req.getRequestDispatcher("/index.jsp").forward(req, resp);
		}

	}
}
