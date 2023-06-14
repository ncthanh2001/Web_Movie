package com.poly.service.impl;

import java.util.List;

import com.poly.dao.VideoDao;
import com.poly.dao.impl.VideoDaoImpl;
import com.poly.entity.Videos;
import com.poly.service.VideoService;

public class VideoServiceImpl implements VideoService{
	private VideoDao dao;
	public VideoServiceImpl() {
		dao = new VideoDaoImpl(); // interface khoong tao duoc object ma phai new class impl
	}
	@Override
	public Videos findById(Integer id) {
	
		return dao.findById(id);
	}

	@Override
	public Videos findByHref(String href) {
		// TODO Auto-generated method stub
		return dao.findByHref(href);
	}

	@Override
	public List<Videos> findAll() {
		// TODO Auto-generated method stub
		return dao.findAll();
	}

	@Override
	public List<Videos> findAll(int pageNumber, int pageSize) {
		// TODO Auto-generated method stub
		return dao.findAll(pageNumber, pageSize);
	}
	@Override
	public List<Videos> findAllNoVideoCurrent(int pageNumber, int pageSize, String href) {
		// TODO Auto-generated method stub
		return dao.findAllNoVideoCurrent(pageNumber, pageSize, href);
	}
	@Override
	public Videos create(Videos entity) {
		// TODO Auto-generated method stub
		entity.setIsActive(Boolean.TRUE);
		entity.setViews(0);
		entity.setShares(0);
		return dao.create(entity);
	}

	@Override
	public Videos update(Videos entity) {
		// TODO Auto-generated method stub
		return dao.update(entity);
	}

	@Override
	public Videos delete(String href) {
		// TODO Auto-generated method stub
		Videos entity = dao.findByHref(href);
		entity.setIsActive(Boolean.FALSE);
		return dao.update(entity);
	}
	@Override
	public List<Videos> findByTitle(String title) {

		
		return dao.findByTitle(title);
	}



}
