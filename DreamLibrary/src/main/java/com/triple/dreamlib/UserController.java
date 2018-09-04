package com.triple.dreamlib;

import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.context.request.RequestContextHolder;

import com.triple.dreamlib.dao.BookDao;
import com.triple.dreamlib.dao.UserDao;
import com.triple.dreamlib.dto.Pagination;
import com.triple.dreamlib.dto.RentListDto;
import com.triple.dreamlib.dto.UserDto;

@Controller
@SessionAttributes("userInfo")
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
	public String index(Model model) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	    String user_id = auth.getName();

	    if(user_id != "anonymousUser") {
	    	UserDao dao = sqlSession.getMapper(UserDao.class);	
			model.addAttribute("userInfo", dao.loginDao(user_id));
	    }
		
		
		BookDao dao2 = sqlSession.getMapper(BookDao.class);
		model.addAttribute("new_book", dao2.newBookListDao());
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
	/*
	@RequestMapping("/login")
	public String login() {
		return "login";
	}
	*/
	@RequestMapping("/my_history")
	public String my_history(@RequestParam(defaultValue="1") int curPage,HttpServletRequest request, Model model) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	    String user_id = auth.getName();
	    UserDao dao = sqlSession.getMapper(UserDao.class);
	    
	    int maxPageListNum, minPageListNum;	    
	    int listCnt = dao.totalListDao(user_id).getListCnt();
        Pagination pagination = new Pagination(listCnt, curPage);
	    maxPageListNum = curPage * pagination.getPageSize();
        minPageListNum = curPage * pagination.getPageSize() - (pagination.getPageSize()-1);	
		ArrayList<RentListDto> myRentList = dao.myRentListDao(user_id, maxPageListNum, minPageListNum);
		
		int i = 0;
		Date now = new Date();
		/*java.util.Date utilDate = new java.util.Date();
	    java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());*/
		
		while(i< myRentList.size()) {
			if(myRentList.get(i).getRent_status().equals("1")) {
				if(myRentList.get(i).getBook_re_due_date().compareTo(now) >= 0) {
					myRentList.get(i).setRent_status("대출중");
				}else {
					myRentList.get(i).setRent_status("연체중");
				}
			}else {
				myRentList.get(i).setRent_status("반납완료");
			}
			i++;
		}
		model.addAttribute("my_list",myRentList);
        model.addAttribute("listCnt", listCnt);	        
        model.addAttribute("pagination", pagination);
		return "my_history";
	}



	

}
