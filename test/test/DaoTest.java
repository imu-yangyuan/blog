package test;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.yangyuan.blog.dao.ArticleMapper;
import com.yangyuan.blog.entity.Article;

public class DaoTest {
public static void main(String[] args) {
	ApplicationContext ac = new ClassPathXmlApplicationContext(new String[]{"applicationContext.xml"});
	ArticleMapper articleMapper = (ArticleMapper) ac.getBean("ArticleMapper");
	
	
}
}
