package com.yangyuan.blog.action;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import com.yangyuan.blog.entity.Article;
import com.yangyuan.blog.entity.Page;
import com.yangyuan.blog.service.ArticleService;
import com.yangyuan.blog.service.PhotoService;
import com.yangyuan.blog.util.IDTools;
import com.yangyuan.blog.util.ReadLineFromFile;
import com.yangyuan.blog.util.WriteLineTofile;

public class IndexAction implements Controller {
	@Resource
	private ArticleService articleService;
	
	public IndexAction() {
	}

	/**
	 * 业务方法
	 */
	public ModelAndView handleRequest(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		System.out.println("HelloAction::handleRequest()");
		/**
		 * ModelAndView表示向视图封装的数据和真实路径
		 */
		String accessTime=null;
		Cookie[] cookies=request.getCookies();
		if (cookies!=null) {
			for (int i = 0; i < cookies.length; i++) {
				if(cookies[i].getName().equals("AccessTime")){
					accessTime=cookies[i].getValue();
				}
			}
		}
		String accessTimePath=request.getSession().getServletContext().getRealPath("/WEB-INF")+"/AccessTime.db";
		int accessTime_int=Integer.parseInt(ReadLineFromFile.execute(accessTimePath));
		if (accessTime==null) {
			accessTime_int+=1;
			WriteLineTofile.execute((accessTime_int)+"", request.getSession().getServletContext().getRealPath("/WEB-INF")+"/AccessTime.db");
			Cookie cookie=new Cookie("AccessTime", IDTools.getId());
			cookie.setMaxAge(-1);
			response.addCookie(cookie);
		}
		ModelAndView modelAndView = new ModelAndView();
		String pageNum_string = request.getParameter("page");
		String articleType = request.getParameter("type");
		String queryString=request.getParameter("query");
		
		if ("".equals(pageNum_string)) {
			pageNum_string=null;
		}
		if ("".equals(articleType)) {
			articleType=null;
		}
		Page<Article> page = new Page<Article>();
		Article article = new Article();
		boolean last_page = false;
		boolean next_page = false;
		Integer pageNum_int=new Integer(1);
		Integer rows=new Integer(2);
		if (pageNum_string == null) {
			page.setPage(1);
		} else {
			page.setPage(Integer.parseInt(pageNum_string));
			pageNum_int=Integer.parseInt(pageNum_string);
		}
		if (articleType != null&&!"".equals(articleType)) {
			System.out.println("artType"+articleType);
			article.setArticleType(articleType);
		}
		if(queryString!=null&&!"".equals(queryString)){
			article.setMarkdown("%"+queryString+"%");
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
		System.out.println(p.getPageMap());
		modelAndView.addObject("articles", p.getPageMap());
		modelAndView.addObject("next_page", next_page);
		modelAndView.addObject("last_page",last_page);
		modelAndView.addObject("page",pageNum_int);
		modelAndView.addObject("type",articleType);
		modelAndView.addObject("accessTime",accessTime_int);
		modelAndView.setViewName("/WEB-INF/index.jsp");
		return modelAndView;
	}

	
}
