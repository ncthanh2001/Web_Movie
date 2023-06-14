package com.poly.entity;

import java.sql.Timestamp;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.CreationTimestamp;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@Entity
@Table(name = "history")
public class History {
	@Id
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer hId;
	@ManyToOne(cascade = CascadeType.MERGE)
	@JoinColumn(name ="userId",referencedColumnName = "id")
	@JsonIgnoreProperties(value = {"applications","hibernatedLazyInitializer"})
	private Users user;
	
	@ManyToOne(cascade = CascadeType.MERGE)
	@JoinColumn(name ="videoId",referencedColumnName = "id")
	@JsonIgnoreProperties(value = {"applications","hibernatedLazyInitializer"})
	private Videos video;
	@Column(name ="viewDate")
	@CreationTimestamp //  auto lấy time hệ thống ngay thời điểm tạo entity đẩy vào data
	private Timestamp viewedDate;
	@Column(name ="isLiked")
	private Boolean isLiked;
	@Column(name ="likeDate")
	private Timestamp likeDate;

	public Integer gethId() {
		return hId;
	}

	public void sethId(Integer hId) {
		this.hId = hId;
	}

	public Users getUser() {
		return user;
	}

	public void setUser(Users user) {
		this.user = user;
	}

	public Videos getVideo() {
		return video;
	}

	public void setVideo(Videos video) {
		this.video = video;
	}

	public Timestamp getViewedDate() {
		return viewedDate;
	}

	public void setViewedDate(Timestamp viewedDate) {
		this.viewedDate = viewedDate;
	}

	public Boolean getIsLiked() {
		return isLiked;
	}

	public void setIsLiked(Boolean isLiked) {
		this.isLiked = isLiked;
	}

	public Timestamp getLikeDate() {
		return likeDate;
	}

	public void setLikeDate(Timestamp likeDate) {
		this.likeDate = likeDate;
	}

	@Override
	public String toString() {
		return "History [hId=" + hId + ", user=" + user + ", video=" + video + ", viewedDate=" + viewedDate
				+ ", isLiked=" + isLiked + ", likeDate=" + likeDate + "]";
	}
	
	
}
