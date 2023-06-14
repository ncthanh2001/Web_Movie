package com.poly.controller;

import java.sql.Timestamp;
import java.util.List;

import com.poly.entity.History;
import com.poly.entity.Users;
import com.poly.entity.Videos;
import com.poly.service.Email_Service;
import com.poly.service.HistoryService;
import com.poly.service.UserService;
import com.poly.service.VideoService;

import jakarta.servlet.ServletContext;

import com.poly.service.impl.Email_ServiceImpl;
import com.poly.service.impl.HistoryServiceImpl;
import com.poly.service.impl.UserServiceImpl;
import com.poly.service.impl.VideoServiceImpl;

public class testconsole {
	public static void main(String[] args) {
	VideoService service = new VideoServiceImpl();
List<Videos> list = service.findByTitle("%apologiz%");
System.out.println(""+list);
	}
}
