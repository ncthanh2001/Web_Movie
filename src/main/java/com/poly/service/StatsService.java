package com.poly.service;

import java.util.List;

import com.poly.dto.VideoLikedInfo;
import com.poly.entity.Videos;

public interface StatsService {
	List<VideoLikedInfo> findVideoLikedInfor();	
	List<VideoLikedInfo> findVideoLikedInfor(int pageNumber , int pageSize);
}
