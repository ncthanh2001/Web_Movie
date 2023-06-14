package com.poly.service.impl;

import java.sql.Timestamp;
import java.util.List;

import com.poly.dao.HistoryDao;
import com.poly.dao.impl.HistoryDaoImpl;
import com.poly.entity.Users;
import com.poly.entity.Videos;
import com.poly.entity.History;
import com.poly.service.HistoryService;
import com.poly.service.VideoService;

public class HistoryServiceImpl implements HistoryService {
	private HistoryDao dao;
	private VideoService  videoService = new VideoServiceImpl();
	public HistoryServiceImpl() {
		dao = new HistoryDaoImpl();
	}
	@Override
	public List<History> findByUser(String username) {
		// TODO Auto-generated method stub
		return dao.findByUser(username);
	}
	@Override
	public List<History> findByUserAndIsLike(String username) {
		// TODO Auto-generated method stub
		return dao.findByUserAndIsLike(username);
	}
	@Override
	public History findByUserIdAndVideoId(Integer userId, Integer videoId) {
		// TODO Auto-generated method stub
		return dao.findByUserIdAndVideoId(userId, videoId);
	}
	@Override
	public History create(Users user, Videos video) {
		History exitsHistory = findByUserIdAndVideoId(user.getuId(), video.getvId());
		
		if(exitsHistory == null && video!= null) {
			video.setViews((video.getViews()+1));
			videoService.update(video);
			System.out.println("joinh ivew : "+video.getViews()	);
			exitsHistory = new History();
			exitsHistory.setUser(user);
			exitsHistory.setVideo(video);
			exitsHistory.setViewedDate(new Timestamp(System.currentTimeMillis()));
			exitsHistory.setIsLiked(Boolean.FALSE);
			return dao.create(exitsHistory);
		}
		video.setViews((video.getViews()+1));
		videoService.update(video);
//		exitsHistory.setViewedDate(new Timestamp(System.currentTimeMillis()));
//		dao.update(exitsHistory);
		return exitsHistory;
	}
	@Override
	public boolean updateLikeorUnlike(Users user, String videoHref) {
		Videos video = videoService.findByHref(videoHref);
		History exitsHistory = findByUserIdAndVideoId(user.getuId(), video.getvId());
		
		if(exitsHistory.getIsLiked() == Boolean.FALSE) {
			exitsHistory.setIsLiked( Boolean.TRUE);
			exitsHistory.setLikeDate(new Timestamp(System.currentTimeMillis()));
		}else {
			exitsHistory.setIsLiked(Boolean.FALSE);
			exitsHistory.setLikeDate(null);
		}
		History updatehiss = dao.update(exitsHistory);
		return updatehiss != null ? true : false;
	
	}
}
