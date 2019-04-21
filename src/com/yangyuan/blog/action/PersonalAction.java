package com.yangyuan.blog.action;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yangyuan.blog.entity.Article;
import com.yangyuan.blog.entity.Page;
import com.yangyuan.blog.service.ArticleService;

@Controller
public class PersonalAction{
	@Resource
	private ArticleService articleService;
	@RequestMapping(value = "/personal")
	public String personal(String userId,String pageNum,String query,String articleType,HttpServletRequest request) {
		Page<Article> page = new Page<Article>();
		System.out.println(userId);
		Article article = new Article();
		boolean last_page = false;
		boolean next_page = false;
		Integer pageNum_int=new Integer(1);
		Integer rows=new Integer(5);
		if (pageNum == null) {
			page.setPage(1);
		} else {
			page.setPage(Integer.parseInt(pageNum));
			pageNum_int=Integer.parseInt(pageNum);
		}
		if (articleType != null&&!"".equals(articleType)) {
			article.setArticleType(articleType);
		}
		if (userId!=null&&!"".equals(userId)) {
			article.setUserId(userId);
		}
		if(query!=null&&!"".equals(query)){
			article.setMarkdown("%"+query+"%");
		}
		page.setParamEntity(article);
		page.setRows(rows);
		Page p = articleService.selectPageUseDyc(page);
		if ((pageNum_int * rows) < p.getTotalRecord()){
			next_page=true;
		}
		if(pageNum_int!=1){
			last_page=true;
		}
		request.setAttribute("articles",  p.getPageMap());
		request.setAttribute("next_page", next_page);
		request.setAttribute("last_page", last_page);
		request.setAttribute("page", pageNum_int);
		request.setAttribute("userId", userId);
		request.setAttribute("type", articleType);
		return "forward:/personal.jsp";
	}
}
