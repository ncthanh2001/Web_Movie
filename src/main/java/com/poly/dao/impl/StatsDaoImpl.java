package com.poly.dao.impl;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.TypedQuery;

import com.poly.dao.AbstractDao;
import com.poly.dao.StatsDao;
import com.poly.dto.VideoLikedInfo;
import com.poly.entity.Users;

public class StatsDaoImpl extends AbstractDao<Object[]> implements StatsDao{

	@Override
	public List<VideoLikedInfo> findVideoLikedInfor() {
		String sql = "SELECT v.id ,v.title,v.href , SUM(CAST(h.isLiked AS INT)) AS totallike "
				+ "FROM dbo.video v LEFT JOIN dbo.history h ON v.id = h.videoId WHERE v.isActive = 1 GROUP BY v.id , v.title , v.href "
				+ "  ORDER BY SUM(CAST(h.isLiked AS int))  DESC"
				;
		List<Object[]> objects = super.findListByNativeQuery( sql);
		List<VideoLikedInfo> result =  new ArrayList<>();
		objects.forEach(object ->{
			VideoLikedInfo likeInfor = setDataVideoLikedInfor(object);
		
			result.add(likeInfor);
			
		});
		return result;
	}
	private VideoLikedInfo setDataVideoLikedInfor(Object[] object) {
		VideoLikedInfo likeInfor = new VideoLikedInfo();
		likeInfor.setVideoId((Integer)object[0]);
		likeInfor.setTitle((String) object[1]);
		likeInfor.setHref((String) object[2]);
		likeInfor.setTotalLike((Integer)object[3] == null ? 0 : (Integer) object[3]);
		return likeInfor;
		
		
	}
	@Override
	public List<VideoLikedInfo> findVideoLikedInfor(int pageNumber, int pageSize) {
		String sql = "SELECT v.id ,v.title,v.href , SUM(CAST(h.isLiked AS INT)) AS totallike "
				+ "FROM dbo.video v LEFT JOIN dbo.history h ON v.id = h.videoId WHERE v.isActive = 1 GROUP BY v.id , v.title , v.href "
				+ "  ORDER BY SUM(CAST(h.isLiked AS int))  DESC"
				;
		List<Object[]> objects = super.findListByNativeQueryPage( sql , pageNumber , pageSize );
		List<VideoLikedInfo> result =  new ArrayList<>();
		objects.forEach(object ->{
			VideoLikedInfo likeInfor = setDataVideoLikedInfor(object);
		
			result.add(likeInfor);
			
		});
		return result;
	}

}
