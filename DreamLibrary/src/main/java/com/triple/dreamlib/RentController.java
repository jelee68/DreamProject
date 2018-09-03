package com.triple.dreamlib;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
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
import com.google.gson.GsonBuilder;
import com.triple.dreamlib.dao.RentDao;
import com.triple.dreamlib.dto.BookDto;
import com.triple.dreamlib.dto.RentDto;
import com.triple.dreamlib.dto.RentListDto;
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
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		UserDto userInfo = dao.userInfoDao(id);
		ArrayList<RentListDto> rentList = dao.rentListDao(id);
		int i = 0;
		Date now = new Date();
		/*java.util.Date utilDate = new java.util.Date();
	    java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());*/
		
		while(i< rentList.size()) {
			if(rentList.get(i).getRent_status().equals("1")) {
				if(rentList.get(i).getBook_re_due_date().compareTo(now) >= 0) {
					rentList.get(i).setRent_status("대출중");
				}else {
					rentList.get(i).setRent_status("연체중");
				}
			}else {
				rentList.get(i).setRent_status("반납완료");
			}
			i++;
		}
		
		HashMap returnMap = new HashMap();
		returnMap.put("userInfo", userInfo);
		returnMap.put("rentList", rentList);
		
		if( dao.userCheckDao(id) != null) {
			return gson.toJson(returnMap);
		}else {
			return "아이디가 존재하지 않습니다.";
		}
		
		
	}
	
	@RequestMapping("/rent_book_check")
	@ResponseBody
	public String rent_book_check(@RequestParam("book_id")String id) {
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
		Gson gson = new Gson();
		String ms;
		HashMap msMap = new HashMap();
		if((book_rent_check(book_id) == false) && (user_rent_check(user_id) == false)) {
			add_rent(user_id,book_id);				
			ms = "대출완료";
		}else {
			ms = "대출불가 : 도서 대출  중 : "+(book_rent_check(book_id))+", 회원 연체 중 : "+(user_rent_check(user_id));
		}
		msMap.put("ms", ms);
		return gson.toJson(msMap);
	}
	
	@RequestMapping("/book_return")
	@ResponseBody
	public String book_return(@RequestParam("rent_no")String rent_no,@RequestParam("book_id")String book_id) {	
		
	
		Gson gson = new Gson();
		String ms;
		HashMap msMap = new HashMap();

		if(book_rent_check(book_id) == true) {
			update_return(rent_no,book_id);				
			ms = "반납 완료";
		}else {
			ms = "이미 반납된 도서입니다.";
		}
		msMap.put("ms", ms);
		return gson.toJson(msMap);
	}
	

	
	//////////////////////////////
	public boolean book_rent_check(String book_id) {
		RentDao dao = sqlSession.getMapper(RentDao.class);	
		BookDto dto;	
		dto = dao.bookRentCheckDao(book_id);
		boolean brc;	
		
		brc = (dto.getBook_status().equals("1"))  ? true : false;	
		return brc;
	}
	
	public boolean user_rent_check(String user_id) {
		RentDao dao = sqlSession.getMapper(RentDao.class);	
		ArrayList<RentDto> dto;
		dto = dao.userRentCheckDao(user_id);
		boolean urc = false;	
		int i = 0;
		Date now = new Date();	
		while(i< dto.size()) {			
			if((dto.get(i).getBook_re_date()==null) && (dto.get(i).getBook_re_due_date().compareTo(now) < 0)) {
				urc = true;
				System.out.println(dto.get(i).getBook_re_date());
				break;
			}
			i++;			
		}
		
		return urc;
	}
	
	public void add_rent(String user_id, String book_id) {
		RentDao dao = sqlSession.getMapper(RentDao.class);	
		/*Date now = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		String rent_id = sdf.format(now);*/
		dao.rentAddDao(user_id, book_id);
		dao.bookStatusUpdateDao("1",book_id);
	}

	public void update_return(String rent_no,String book_id) {
		RentDao dao = sqlSession.getMapper(RentDao.class);
		dao.updateReturnDao(rent_no);
		dao.bookStatusUpdateDao("0",book_id);
	}
}
