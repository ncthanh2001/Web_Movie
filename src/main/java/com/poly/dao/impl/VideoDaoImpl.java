package com.poly.dao.impl;

import java.util.List;

import com.poly.dao.AbstractDao;
import com.poly.dao.VideoDao;
import com.poly.entity.Videos;

public class VideoDaoImpl extends AbstractDao<Videos> implements VideoDao{

	@Override
	public Videos findById(Integer id) {
		
		return super.findById(Videos.class ,id);
	}

	@Override
	public Videos findByHref(String href) {
		String sql = "SELECT o FROM Videos o WHERE o.href = ?0";
		return super.findSingle(Videos.class, sql, href);
	}

	@Override
	public List<Videos> findAll() {
		// TODO Auto-generated method stub
		return super.findAll(Videos.class, true);
	}

	@Override
	public List<Videos> findAll(int pageNumber, int pageSize) {
		// TODO Auto-generated method stub
		return super.findAll(Videos.class, true, pageNumber, pageSize);
	}
//-------------------------------
	@Override
	public List<Videos> findAllNoVideoCurrent(int pageNumber, int pageSize, String href) {
		// TODO Auto-generated method stub
		return super.findAll(Videos.class, true, pageNumber, pageSize, href);
	}
	@Override
	public List<Videos> findByTitle(String title) {
		String sql = "SELECT o FROM Videos o WHERE o.title like  ?0 ";
		return super.findList(Videos.class, sql, title);
	}
	@Override
	public Videos create(Videos entity) {
		// TODO Auto-generated method stub
		return super.create(entity);
	}

	@Override
	public Videos update(Videos entity) {
		// TODO Auto-generated method stub
		return super.update(entity);
	}

	@Override
	public Videos delete(Videos entity) {
		// TODO Auto-generated method stub
		return null;
	}



//	@Override
//	public Videos create(Videos entity) {
//		// TODO Auto-generated method stub
//		return null;
//	}
//
//	@Override
//	public Videos update(Videos entity) {
//		// TODO Auto-generated method stub
//		return null;
//	}
//
//	@Override
//	public Videos delete(Videos entity) {
//		// TODO Auto-generated method stub
//		return null;
//	}

}
