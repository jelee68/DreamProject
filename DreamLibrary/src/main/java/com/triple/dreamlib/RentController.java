package com.triple.dreamlib;

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
		
		List<UserDto> userInfo = dao.userCheckDao(id);
		//System.out.println(dao.userCheckDao(id).toString());
		if( dao.userCheckDao(id) != null) {
			//model.addAttribute("userInfo", dao.userInfoDao(id));	
			System.out.println(gson.toJson(userInfo));
			return gson.toJson(userInfo); //JSON 형태
		}else {
			//model.addAttribute("result", "false");
			return "{\"result\":\"" + "false\"}";
		}
		
		
	}
	
	@RequestMapping("/rent_book_check")
	public String rent_book_check(HttpServletRequest request, Model model) {
		RentDao dao = sqlSession.getMapper(RentDao.class);
		model.addAttribute("bookInfo", dao.bookInfoDao(request.getParameter("book_id")));
		return "rent_manager";
	}

}
