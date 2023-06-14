package com.poly.dao;

import java.util.List;

import com.poly.dto.VideoLikedInfo;
import com.poly.entity.Users;

public interface StatsDao {
	List<VideoLikedInfo> findVideoLikedInfor();
	List<VideoLikedInfo> findVideoLikedInfor(int pageNumber , int pageSize);
	
}
