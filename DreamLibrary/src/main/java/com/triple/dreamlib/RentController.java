package com.triple.dreamlib;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.triple.dreamlib.dao.RentDao;
import com.triple.dreamlib.dto.BookDto;
import com.triple.dreamlib.dto.UserDto;



@Controller
public class RentController {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private DataSourceTransactionManager transactionManager;
	
	@RequestMapping("/rent_manager")
	public String rent_main() {
		return "rent_manager";
	}
	
	@RequestMapping("/rent_user_check")
	@ResponseBody
	public String rent_user_check(@RequestParam("user_id")String id, Model model) {
		
		RentDao dao = sqlSession.getMapper(RentDao.class);	
		Gson gson = new Gson();
		UserDto userInfo = dao.userInfoDao(id);
	
		if( dao.userCheckDao(id) != null) {
			return gson.toJson(userInfo);
		}else {
			return "아이디가 존재하지 않습니다.";
		}
		
		
	}
	
	@RequestMapping("/rent_book_check")
	@ResponseBody
	public String rent_book_check(@RequestParam("book_id")String id, Model model) {
		RentDao dao = sqlSession.getMapper(RentDao.class);	
		Gson gson = new Gson();		
		BookDto bookInfo = dao.bookInfoDao(id);
	
		if( dao.bookCheckDao(id) != null) {
			return gson.toJson(bookInfo); 
		}else {
			return "책이 존재하지 않습니다.";
		}
	}
	
	@RequestMapping("/book_rent")
	@ResponseBody
	public String book_rent(@RequestParam("user_id")String user_id,@RequestParam("book_id")String book_id) {		
		add_rent(user_id,book_id);
		Gson gson = new Gson();	
		return gson.toJson("안녕");
	}
	
	
	
	
	//////////////////////////////
	public void add_rent(String user_id, String book_id) {
		RentDao dao = sqlSession.getMapper(RentDao.class);
		System.out.println(user_id+book_id);
		Date now = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		System.out.println(sdf.format(now));
		String rent_id = sdf.format(now);
		
		
		dao.rentAddDao(user_id, book_id);
	}

}
