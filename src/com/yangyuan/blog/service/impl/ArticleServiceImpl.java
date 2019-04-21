package com.yangyuan.blog.service.impl;


import org.springframework.stereotype.Service;

import com.yangyuan.blog.entity.Article;
import com.yangyuan.blog.service.ArticleService;
@Service("articleService")
public class ArticleServiceImpl extends BaseServiceImpl<Article> implements ArticleService{

	@Override
	public void like(Article article) {
		// TODO Auto-generated method stub
		 articleMapper.like(article);
	}


}
