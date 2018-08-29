package com.triple.dreamlib;

import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.triple.dreamlib.dao.UserDao;
import com.triple.dreamlib.dto.RentListDto;
import com.triple.dreamlib.dto.UserDto;

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
	
	@RequestMapping("/loginform")
	public String loginform() {
		//UserDao dao = sqlSession.getMapper(UserDao.class);
		
		//dao.loginDao(request.getParameter("user_id"), request.getParameter("user_pwd"));
		
		//model.addAttribute("login", udao.loginDao());
		
		return "loginform";
	}
	
	@RequestMapping("/login")
	public String login() {
		return "login";
	}
	
	@RequestMapping("/my_history")
	public String my_history(HttpServletRequest request, Model model) {
		UserDao dao = sqlSession.getMapper(UserDao.class);
		System.out.println(request.getParameter("user_id"));
		ArrayList<RentListDto> rentList = dao.myRentListDao(request.getParameter("user_id"));
		int i = 0;
		Date now = new Date();
		/*java.util.Date utilDate = new java.util.Date();
	    java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());*/
		
		/*while(i< rentList.size()) {
			if(rentList.get(i).getBook_status().equals("1")) {
				if(rentList.get(i).getBook_re_due_date().compareTo(now) >= 0) {
					rentList.get(i).setBook_status("대출중");
				}else {
					rentList.get(i).setBook_status("연체중");
				}
			}else {
				rentList.get(i).setBook_status("반납완료");
			}
			i++;
		}*/
		model.addAttribute("my_list",dao.myRentListDao(request.getParameter("user_id")));
		return "my_history";
	}



	

}
