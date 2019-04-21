package com.yangyuan.blog.action;


import java.io.File;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.disk.DiskFileItem;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.yangyuan.blog.entity.Article;
import com.yangyuan.blog.entity.Page;
import com.yangyuan.blog.entity.Photo;
import com.yangyuan.blog.entity.UseQueryParam;
import com.yangyuan.blog.entity.User;
import com.yangyuan.blog.model.ImgResultModel;
import com.yangyuan.blog.service.ArticleService;
import com.yangyuan.blog.service.PhotoService;
import com.yangyuan.blog.util.IDTools;
import com.yangyuan.blog.util.UpPhoto;

@Controller
@RequestMapping("/article")
public class ArticleAction extends BaseAction {
	@Resource
	private ArticleService articleService;
	@Resource
	private PhotoService photoService;
	@RequestMapping(value = "/insert")
	@ResponseBody
	public Object insert(Article article, HttpServletRequest request,
			HttpSession session) {

		/*
		 * Article article2=new Article(); article2.setAddTime(new Date());
		 * //article2.setArticleId(IDTools.getId());
		 * article2.setArticleId("66"); article2.setTitle("1");
		 * article2.setImgUrl("13"); article2.setArticleType("哈哈");
		 * article2.setContent("1"); article2.setLikeNum(12);
		 * article2.setMarkdown("3"); article2.setUserId("2");
		 * System.out.println(article2); try { articleService.insert(article2);
		 * } catch (Exception e1) { // TODO Auto-generated catch block
		 * e1.printStackTrace(); }
		 */

		/*
		 * User user=(User)session.getAttribute("user"); if(user!=null){
		 * article.setUserId(user.getUserId()); }else{ return
		 * "forward:/login.jsp"; }
		 */
		HashMap<String, Object> resultMap=new HashMap<String, Object>();
		User user = (User) session.getAttribute("user");
		if (user == null) {
			resultMap.put("result", 0);
			return resultMap;
		}else if("至美一拍".equals(article.getArticleType())){
			Photo photo=new Photo();
			photo.setTitle(article.getTitle());
			photo.setPhotoId(IDTools.getId());
			photo.setShowTime(article.getContent());
			photo.setAddTime(new Date());
			photo.setUserId(user.getUserId());
			int temp=0;
			try {
				 temp=photoService.insert(photo);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				resultMap.put("result", 0);
				return resultMap;
			}if (temp!=0) {
				resultMap.put("result", 1);
				return resultMap;
			}else {
				resultMap.put("result", 0);
				return resultMap;
			}
		}
		int result = 0;
		try {
			article.setArticleId(IDTools.getId());
			article.setAddTime(new Date());
			article.setLikeNum(0);
			article.setUserId(user.getUserId());
			result = articleService.insert(article);
		} catch (Exception e) {
			resultMap.put("result", 0);
			return resultMap;
		}
		if (result != 0) {
			if ("至美一拍".equals(article.getArticleType())) {
				resultMap.put("result", 2);
				return resultMap;
			}
			resultMap.put("result", 1);
			return resultMap;
		} else {
			request.setAttribute("msg", "用户名或密码错误！");
			resultMap.put("result", 0);
			return resultMap;
		}
	}

	@RequestMapping("/markdown_upload_image")
	@ResponseBody
	public Object markdown_upload_image(
			@RequestParam("editormd-image-file") CommonsMultipartFile file) {
		if (file == null) {
			return null;
		}
		String fileName = file.getOriginalFilename();
		System.out.println(fileName);
		ImgResultModel imgResultModel = new ImgResultModel();
		final String urlhead = "http://oe1rqbymq.bkt.clouddn.com/";
		String keyString = IDTools.getId()
				+ fileName.substring(fileName.lastIndexOf('.'),
						fileName.length());
		System.out.println(keyString);
		String PhotoUrl = urlhead + keyString;
		UpPhoto upPhoto = new UpPhoto();
		CommonsMultipartFile cf = (CommonsMultipartFile) file;
		DiskFileItem fi = (DiskFileItem) file.getFileItem();
		File f = fi.getStoreLocation();
		if (upPhoto.upload(f, keyString)) {
			imgResultModel.setMessage("上传成功");
			imgResultModel.setSuccess(1);
			imgResultModel.setUrl(PhotoUrl);
			return imgResultModel;
		}
		imgResultModel.setMessage("上传失败");
		imgResultModel.setSuccess(0);
		return imgResultModel;
	}

	// 通过关键字分页查询
	@RequestMapping("/selectPageUseDyc")
	@ResponseBody
	// 如果返回json格式，需要这个注解，这里用来测试环境
	public Object selectPageUseDyc(Page<Article> page, Article article) {
		Article article2 = new Article();
		article2.setArticleId("1");
		article2 = articleService.select(article2);
		// page.setPage(1);
		// page.setRows(2);
		System.out.println(article2);
		Article article3 = new Article();
		// article3.setContent("%we%");
		// article3.setTitle("%ff%");
		// article3.setUserId("3");
		page.setParamEntity(article3);
		// System.out.println("----page:" + page);

		Page p = articleService.selectPageUseDyc(page);
		// supplier.setSupName("supName1");
		/*
		 * Map<String, Object> map =new HashMap<String, Object>();
		 * map.put("total",p.getTotalRecord()); map.put("rows",p.getList());
		 */
		System.out.println(p.getPageMap());
		Map<String, Object> map = p.getPageMap();
		map.put("status", 1);
		map.put("msg", "请求成功！");
		// return p.getPageMap();
		return map;
	}

	@RequestMapping("/detail")
	public String selectArticle(HttpServletRequest request, String articleId) {

		Article article = new Article();
		article.setArticleId(articleId);
		Article article2 = articleService.select(article);
		request.setAttribute("article", article2);
		return "forward:/detail.jsp";
	}

	@RequestMapping("/index")
	public String indexJsp(HttpServletRequest request, HttpServletResponse res) {
		request.setAttribute("msg", "asdfasdfasdfa");

		return "forward:/WEB-INF/index.jsp";
	}

	@RequestMapping("/markdownEdit")
	public String markdownEdit(String articleId, HttpSession session,
			Model model) {
		User user = (User) session.getAttribute("user");
		Article article = new Article();
		article.setArticleId(articleId);
		Article article2 = articleService.select(article);
		if (user == null) {
			return "forward:/login.jsp";
		} else if (article2 == null) {
			return "redirect:/index.action";
		} else if (user.getUserId().equals(article2.getUserId())) {
			model.addAttribute("article", article2);
			return "forward:/WEB-INF/markdownEdit.jsp";
		} else {
			return "redirect:/index.action";
		}
	}

	@RequestMapping("/CreateMarkdown")
	public String CreateMarkdown(HttpSession session, Model model) {
		User user = (User) session.getAttribute("user");
		if (user != null) {
			return "forward:/WEB-INF/CreateMarkdown.jsp";
		}
		return "forward:/login.jsp";
	}

	@RequestMapping(value = "/articleMd", produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String articleMd(String articleId) {
		// System.out.println(articleId);
		Article article = new Article();
		article.setArticleId(articleId);
		Article article2 = articleService.select(article);
		return article2.getMarkdown();
	}

	@RequestMapping("/like")
	@ResponseBody
	public Object like(String articleId,HttpSession session) {
		System.out.println(articleId);
		Map<String, Object> result = new HashMap<String, Object>();
		if (articleId==null) {
			result.put("result", 0);
			return result;
		}
		Article article = new Article();
		article.setArticleId(articleId);
		System.out.println("IDD"+articleId);
		Article article2 = articleService.select(article);
		if(article2==null){
			result.put("result", 0);
			return result;
		}
		List<String> likeArticleidsList=(List<String>)session.getAttribute("likeArticleidsList");
		if (likeArticleidsList==null) {
			article2.setLikeNum(article2.getLikeNum() + 1);
			try {
				articleService.like(article2);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				result.put("result", 0);
				return result;
			}
			likeArticleidsList=new ArrayList<String>();
			likeArticleidsList.add(articleId);
			session.setAttribute("likeArticleidsList", likeArticleidsList);
			result.put("result", 1);
			result.put("like", article2.getLikeNum());
			System.out.println(result);
			return result;
		}else {
			for (int i = 0; i < likeArticleidsList.size(); i++) {
				if (articleId.equals(likeArticleidsList.get(i))) {
					article2.setLikeNum(article2.getLikeNum() - 1);
					try {
						articleService.like(article2);
					} catch (Exception e) {
						// TODO: handle exception
						e.printStackTrace();
						result.put("result", 0);
						return result;
					}
					
					result.put("result", 1);
					result.put("like", article2.getLikeNum());
					likeArticleidsList.remove(i);
					session.removeAttribute("likeArticleidsList");
					session.setAttribute("likeArticleidsList", likeArticleidsList);
					return result;
				}
			}
			article2.setLikeNum(article2.getLikeNum() + 1);
			
			try {
				articleService.like(article2);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				result.put("result", 0);
				return result;
			}
			likeArticleidsList.add(articleId);
			session.setAttribute("likeArticleidsList", likeArticleidsList);
			result.put("result", 1);
			result.put("like", article2.getLikeNum());
			System.out.println(result);
			return result;
		}
		
		
	}

	@RequestMapping(value="/save",method={RequestMethod.POST})
	@ResponseBody
	public Object save(Article article, HttpServletRequest request,
			HttpSession session) {
		System.out.println(article);
		HashMap<String, Object> map=new HashMap<String, Object>();
		User user = (User) session.getAttribute("user");
		if (user == null) {
			map.put("result", 0);
			return map;
		}
		int result = 0;
		try {
			article.setUserId(user.getUserId());
			result = articleService.update(article);
		} catch (Exception e) {
			map.put("result", 0);
			return map;
		}
		if (result != 0) {
			if ("至美一拍".equals(article)) {
				map.put("result", 2);
				return map;
			}else {
				map.put("result", 1);
				return map;
			}
		} else {
			map.put("result", 0);
			return map;
		}
	}

}
