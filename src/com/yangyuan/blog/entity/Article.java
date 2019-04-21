package com.yangyuan.blog.entity;

import java.io.Serializable;
import java.util.Date;
public class Article implements Serializable{
    /**
	 * 
	 */
	private static final long serialVersionUID = -538152860419395633L;

	private String articleId;

    private String title;

    private String imgUrl;

    private String articleType;
    private Date addTime;

    private Integer likeNum;

    private String userId;
    
    private User user;
    
    private String content;
    
    private String markdown;

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getArticleId() {
		return articleId;
	}

	public void setArticleId(String articleId) {
		this.articleId = articleId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getImgUrl() {
		return imgUrl;
	}

	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}

	public String getArticleType() {
		return articleType;
	}

	public void setArticleType(String articleType) {
		this.articleType = articleType;
	}

	public Date getAddTime() {
		return addTime;
	}

	public void setAddTime(Date addTime) {
		this.addTime = addTime;
	}

	public Integer getLikeNum() {
		return likeNum;
	}

	public void setLikeNum(Integer likeNum) {
		this.likeNum = likeNum;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getMarkdown() {
		return markdown;
	}

	public void setMarkdown(String markdown) {
		this.markdown = markdown;
	}

	@Override
	public String toString() {
		return "Article [articleId=" + articleId + ", title=" + title
				+ ", imgUrl=" + imgUrl + ", articleType=" + articleType
				+ ", addTime=" + addTime + ", likeNum=" + likeNum + ", userId="
				+ userId + ", user=" + user + ", content=" + content
				+ ", markdown=" + markdown + "]";
	}

	
    
    
}