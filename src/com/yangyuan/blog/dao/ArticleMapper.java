package com.yangyuan.blog.dao;

import java.util.List;
import java.util.Map;

import com.yangyuan.blog.entity.Article;

public interface ArticleMapper extends BaseMapper<Article>{
	List<Map<String, Object>> selectArticle(Map<String, String> paramMap);
	void like(Article article);
}