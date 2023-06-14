package com.poly.service;

import java.util.List;

import com.poly.dto.UsersDto;
import com.poly.entity.Users;

public interface UserService {
	Users findById(Integer id);
	Users findByEmail(String email);
	Users findByUsername(String username);
	Users Login(String username , String password);
	Users resetPass(String email);
	List<Users> findAll();
	List<Users> findAll(int pageNumber,int pageSize);
	Users create (String username, String password , String email ,String fullname);
	Users update (Users entity);
	Users delete (String username);
	List<UsersDto> findUsersLikedByVideoHref(String href);
}
