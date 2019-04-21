package com.yangyuan.blog.entity;

import java.io.Serializable;

public class UseQueryParam implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -6679501549299244555L;
	private String ArticleType;
	private String ArticleTitle;
	private String ArticleContent;
	
	public String getArticleType() {
		return ArticleType;
	}

	public void setArticleType(String articleType) {
		ArticleType = articleType;
	}

	public String getArticleTitle() {
		return ArticleTitle;
	}

	public void setArticleTitle(String articleTitle) {
		ArticleTitle = articleTitle;
	}

	public String getArticleContent() {
		return ArticleContent;
	}

	public void setArticleContent(String articleContent) {
		ArticleContent = articleContent;
	}

	@Override
	public String toString() {
		return "UseQueryParam [ArticleType=" + ArticleType + ", ArticleTitle="
				+ ArticleTitle + ", ArticleContent=" + ArticleContent + "]";
	}
	

}
