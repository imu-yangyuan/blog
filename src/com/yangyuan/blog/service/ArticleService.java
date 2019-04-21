package com.yangyuan.blog.service;


import com.yangyuan.blog.entity.Article;

public interface ArticleService extends BaseService<Article> {
	void like(Article article);
}
