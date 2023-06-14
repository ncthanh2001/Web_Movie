package com.poly.dao.impl;

import java.util.List;
import java.util.Map;

import com.poly.constant.NamedStored;
import com.poly.dao.AbstractDao;
import com.poly.dao.UserDao;
import com.poly.entity.Users;

public class UserDaoImpl extends AbstractDao<Users> implements UserDao{

	@Override
	public Users findById(Integer id) {	
		return super.findById(Users.class, id);
	}

	@Override
	public Users findByEmail(String email) {
		String sql = "SELECT o FROM  Users o WHERE o.email = ?0";
		return super.findSingle(Users.class, sql, email);
	}

	@Override
	public Users findByUsername(String username) {
		String sql = "SELECT o FROM  Users o WHERE o.username = ?0";
		return super.findSingle(Users.class, sql, username);
	}

	@Override
	public Users findByUsernameAndPassword(String username, String password) {
		String sql = "SELECT o FROM  Users o WHERE o.username = ?0 AND o.password = ?1";
		return super.findSingle(Users.class, sql, username , password);
	}

	@Override
	public List<Users> findAll() {
		return super.findAll(Users.class, true);
	}
	@Override
	public List<Users> findAll(int pageNumber, int pageSize) {
		// TODO Auto-generated method stub
		return super.findAll(Users.class, true, pageNumber, pageSize);
	}
	
	@Override
	public Users create(Users entity) {
		// TODO Auto-generated method stub
		return super.create(entity);
	}

	@Override
	public Users update(Users entity) {
		// TODO Auto-generated method stub
		return super.update(entity);
	}

	@Override
	public Users delete(Users entity) {
		// TODO Auto-generated method stub
		return delete(entity);
	}

	@Override
	public List<Users> findUserLikedByVideohref(Map<String, Object> params) {
		// TODO Auto-generated method stub
		return super.callStored(NamedStored.STORED_FIND_USERS_LIKED_BY_VIDEO_HREF, params);
	}

	

}
