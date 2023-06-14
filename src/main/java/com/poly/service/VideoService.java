package com.poly.service;

import java.util.List;

import com.poly.entity.Videos;

public interface VideoService {
	Videos findById(Integer id);
	Videos findByHref(String href);
	List<Videos> findByTitle(String title);
	List<Videos> findAll();
	List<Videos> findAll(int pageNumber , int pageSize);
	List<Videos> findAllNoVideoCurrent(int pageNumber , int pageSize,String href);
	Videos create(Videos entity);
	Videos update ( Videos entity);
	Videos delete (String href);
}
