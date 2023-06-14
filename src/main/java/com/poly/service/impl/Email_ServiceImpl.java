package com.poly.service.impl;

import com.poly.entity.Users;
import com.poly.service.Email_Service;
import com.poly.util.sendEmailUtil;

import jakarta.servlet.ServletContext;

public class Email_ServiceImpl implements Email_Service{
	private static final String EMAIL_WELCOM_SUBJECT = "Welcom to N2C1T_Movies";
	private static final String EMAIL_FORGOT_PASSWORD = "N2C1T_Movies - New Password : ";
	private static final String EMAIL_SHARE_VID = "N2C1T_Movies - Share vid : ";
	@Override
	public void sendMail(ServletContext context, Users recipitent, String type) {
		 String  host = context.getInitParameter("host");
	       String port = context.getInitParameter("port");
	       String  user = context.getInitParameter("user");
	       String  pass = context.getInitParameter("pass");
	    try {
			String content = null;
			String subject = null;
			switch(type) {
			case "welcom":
				subject = EMAIL_WELCOM_SUBJECT;
				content = "Dear"+ recipitent.getFullname();
				System.out.println("send mail welcom success");
				break;
			case"forgot":
				subject = EMAIL_FORGOT_PASSWORD;
				content = "Dear  - "+recipitent.getFullname()  + "your new passs : "+recipitent.getPassword();
				System.out.println("send mail forgot success");
				break;
			default:
				subject =  "N2C1T_Movies";
				content = "helo";
				
			}
			sendEmailUtil.sendEmail(host, port, user, pass, recipitent.getEmail(), subject, content);
		} catch (Exception e) {
			System.out.println("lỗi");
			e.printStackTrace();
		}
		
	}
	@Override
	public void sendMail(ServletContext context, String email,String href, String type) {
		 String  host = context.getInitParameter("host");
	       String port = context.getInitParameter("port");
	       String  user = context.getInitParameter("user");
	       String  pass = context.getInitParameter("pass");
	    try {
			String content = null;
			String subject = null;
			switch(type) {
			case "welcom":
				subject = EMAIL_WELCOM_SUBJECT;
				content = "Dear"+ email;
				System.out.println("send mail welcom success");
				break;
			case"share":
				subject = EMAIL_SHARE_VID;
				content = "Dear  - "+email  + " vid share : https://www.youtube.com/watch?v="+href;
				System.out.println("send mail share success");
				break;
			default:
				subject =  "N2C1T_Movies";
				content = "helo";
				
			}
			sendEmailUtil.sendEmail(host, port, user, pass, email, subject, content);
		} catch (Exception e) {
			System.out.println("lỗi");
			e.printStackTrace();
		}
		
	}
}
