package com.poly.service;

import com.poly.entity.Users;

import jakarta.servlet.ServletContext;

public interface Email_Service { 
	void sendMail(ServletContext context, Users recipitent ,String type);
	void sendMail(ServletContext context, String email,String href,String type);
}
