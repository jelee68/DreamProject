package com.triple.dreamlib;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.triple.dreamlib.dao.BookDao;
import com.triple.dreamlib.dao.UserDao;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping("/")
	public String index(Model model) {
		BookDao dao = sqlSession.getMapper(BookDao.class);
		model.addAttribute("new_book", dao.newBookListDao());
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	    String user_id = auth.getName();

	    if(user_id != "anonymousUser") {
	    	UserDao dao2 = sqlSession.getMapper(UserDao.class);	
			model.addAttribute("userInfo", dao2.loginDao(user_id));
	    }
		return "/index";
	}
	

	

	
}
