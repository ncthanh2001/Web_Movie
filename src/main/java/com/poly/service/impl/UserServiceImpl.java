package com.poly.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.poly.dao.UserDao;
import com.poly.dao.impl.UserDaoImpl;
import com.poly.dto.UsersDto;
import com.poly.entity.Users;
import com.poly.service.UserService;

public class UserServiceImpl implements UserService{
	private UserDao dao;
	public UserServiceImpl() {
		dao = new UserDaoImpl();
	}
	@Override
	public Users findById(Integer id) {
		return dao.findById(id);
	}

	@Override
	public Users findByEmail(String email) {
		// TODO Auto-generated method stub
		return dao.findByEmail(email);
	}

	@Override
	public Users findByUsername(String username) {
		// TODO Auto-generated method stub
		return dao.findByUsername(username);
	}

	@Override
	public Users Login(String username, String password) {
		// TODO Auto-generated method stub
		return dao.findByUsernameAndPassword(username, password);
	}

	@Override
	public Users resetPass(String email) {
		Users exitsUser = findByEmail(email);
		if(exitsUser!=null ) {
			String newPass = String.valueOf((int)(Math.random()+((99999  - 10000)+1))+10000);
			exitsUser.setPassword(newPass);
			return dao.update(exitsUser);
		}
		return null;
	}

	@Override
	public List<Users> findAll() {
		// TODO Auto-generated method stub
		return dao.findAll();
	}

	@Override
	public List<Users> findAll(int pageNumber, int pageSize) {
		// TODO Auto-generated method stub
		return dao.findAll(pageNumber, pageSize);
	}

	@Override
	public Users create(String username, String password, String email , String fullname) {
			Users u = new Users();
			u.setUsername(username);
			u.setPassword(password); // bcrypt md
			u.setEmail(email);
			u.setFullname(fullname);
			u.setIsAdmin(Boolean.FALSE);
			u.setIsActive(Boolean.TRUE);
		return dao.create(u);
	}

	@Override
	public Users update(Users entity) {
		// TODO Auto-generated method stub
		return dao.update(entity);
	}

	@Override
	public Users delete(String username) {
		// TODO Auto-generated method stub
		Users u = dao.findByUsername(username);
		u.setIsActive(Boolean.FALSE);
		return dao.update(u);
	}
	@Override
	public List<UsersDto> findUsersLikedByVideoHref(String href) {
		Map<String ,Object> param = new HashMap<>();
		param.put("videoHref", href);// dung bien constant để thay the key 
		List<Users> users = dao.findUserLikedByVideohref(param);
		List<UsersDto> result = new ArrayList<>();
		users.forEach(user ->{
			UsersDto dto = new UsersDto();
			dto.setEmail(user.getEmail());
			dto.setUsername(user.getUsername());
			result.add(dto);
		});
		return result;
	}

}
