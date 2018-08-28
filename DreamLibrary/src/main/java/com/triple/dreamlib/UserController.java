package com.triple.dreamlib;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.triple.dreamlib.dao.UserDao;

@Controller
public class UserController {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private DataSourceTransactionManager transactionManager;
	
	@RequestMapping("/join")
	public String join() {
		return "/join";
	}
	
	@RequestMapping("/index")
	public String index() {
		return "/index";
	}
	
	@RequestMapping("/join_add")
	public String join_add(HttpServletRequest request) {
		UserDao dao = sqlSession.getMapper(UserDao.class);
		
		dao.user_addDao(request.getParameter("user_id"), request.getParameter("user_pwd"), 
				request.getParameter("user_name"), request.getParameter("user_birth"), 
				request.getParameter("user_addr"), request.getParameter("user_tel"));
		
		return "redirect:index";
	}
	
	@RequestMapping("/login")
	public String login(HttpServletRequest request, Model model) {
		UserDao dao = sqlSession.getMapper(UserDao.class);
		
		dao.loginDao(request.getParameter("user_id"), request.getParameter("user_pwd"));
		
		//model.addAttribute("login", udao.loginDao());
		
		return "login";
	}

}
