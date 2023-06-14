 package com.poly.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedStoredProcedureQueries;
import javax.persistence.NamedStoredProcedureQuery;
import javax.persistence.StoredProcedureParameter;
import javax.persistence.Table;

import org.eclipse.persistence.annotations.NamedStoredFunctionQuery;

import com.poly.constant.NamedStored;
@NamedStoredProcedureQueries({
	@NamedStoredProcedureQuery(name=NamedStored.STORED_FIND_USERS_LIKED_BY_VIDEO_HREF ,
				procedureName = "sp_selectUserLikedVideoByHref",
				resultClasses = {Users.class},
				parameters = @StoredProcedureParameter(name = "videoHref",type = String.class))
})
@Entity
@Table(name = "`users`")
public class Users {
	@Id
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer uId;
	@Column(name = "username")
	private String username;
	@Column(name = "passwords")
	private String password;
	@Column(name = "email")
	private String email;
	@Column(name = "isAdmin")
	private Boolean isAdmin;
	@Column(name = "isActive")
	private Boolean isActive;
	@Column(name = "fullname")
	private String fullname;
	public Integer getuId() {
		return uId;
	}

	public void setuId(Integer uId) {
		this.uId = uId;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Boolean getIsAdmin() {
		return isAdmin;
	}

	public void setIsAdmin(Boolean isAdmin) {
		this.isAdmin = isAdmin;
	}

	public Boolean getIsActive() {
		return isActive;
	}

	public void setIsActive(Boolean isActive) {
		this.isActive = isActive;
	}

	public String getFullname() {
		return fullname;
	}

	public void setFullname(String fullname) {
		this.fullname = fullname;
	}
	
	

}
