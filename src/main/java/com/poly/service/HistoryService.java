package com.poly.service;

import java.util.List;

import com.poly.entity.Users;
import com.poly.entity.Videos;
import com.poly.entity.History;

public interface HistoryService {
	List<History> findByUser(String username);
	List<History> findByUserAndIsLike(String username);
	History findByUserIdAndVideoId(Integer userId , Integer videoId);
	History create(Users user,  Videos video);
	boolean updateLikeorUnlike(Users user , String videoHref);
//	history delete(history entity);
}
