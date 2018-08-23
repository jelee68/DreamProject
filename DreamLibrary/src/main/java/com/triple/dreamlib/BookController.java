package com.triple.dreamlib;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.triple.dreamlib.dao.BookDao;

@Controller
public class BookController {
	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private DataSourceTransactionManager transactionManager;

	@RequestMapping("/test")
	public String test() {
		return "/test";
	}	
	
	@RequestMapping("/book_search")
	public String book_search() {
		return "/book_search";
	}
	
	@RequestMapping("/search_result")
	public String search_result(HttpServletRequest request, Model model) {
/*
		select1=book_name
				&input1=spring
				&cond01=AND
				&select2=book_author
				&input2=coding
				&cond02=AND
				&select3=book_pub
				&input3=books
	*/
		
		String select1, select2, select3;
		String input1, input2, input3;
		String cond01, cond02;		
		
		BookDao dao = sqlSession.getMapper(BookDao.class);
		
		select1 = request.getParameter("select1");
		select2 = request.getParameter("select2");
		select3 = request.getParameter("select3");
		input1 = request.getParameter("input1");
		input2 = request.getParameter("input2");
		input3 = request.getParameter("input3");
		cond01 = request.getParameter("cond01");
		cond02 = request.getParameter("cond02");		
		
		// 입력받은 값이 1개이상인경우
		if (!input1.equals(null)) {
			
			// 입력받은 값이 2개이상인경우			
			if (!input2.equals(null)) {
				// 입력받은 값이 3개인경우
				if (!input3.equals(null)) {
					model.addAttribute("bookresult",
					dao.book_result3Dao(select1, input1, cond01, select2, input2, cond02, select3, input3));
				}
				else {
					// 입력받은 값이 2개인경우
					model.addAttribute("bookresult",					
					dao.book_result2Dao(select1,input1,cond01,select2,input2));					
				}
			}
			// 입력받은 값이 1개인경우
			model.addAttribute("bookresult",dao.book_result1Dao(input1));
		}
				
		return "/search_result";
	}
	
	@RequestMapping("/book_manager")
	public String search_result(Model model) {
		BookDao dao = sqlSession.getMapper(BookDao.class);
		model.addAttribute("booklist", dao.booklistDao());
		return "/book_manager";
	}
	
	@RequestMapping("/book_add")
	public String book_add(HttpServletRequest request) {
		BookDao dao = sqlSession.getMapper(BookDao.class);	
		
		dao.book_addDao(request.getParameter("book_id"), request.getParameter("book_code"),
		request.getParameter("book_name"), request.getParameter("book_author"),request.getParameter("book_date"), 
		request.getParameter("book_pub"),request.getParameter("book_imgPath"));
		
		return "redirect:book_manager";
		
	}	
	
	@RequestMapping("/book_sel")
	public String book_sel(HttpServletRequest request, Model model) {
		BookDao dao = sqlSession.getMapper(BookDao.class);	
		model.addAttribute("booklist", dao.booklistDao());		
		model.addAttribute("book_sel", dao.bookselDao(request.getParameter("book_id")));		
		return "book_manager";	
	}

	
	

	/*
	@RequestMapping("/petclinic/vetslistall")
	public String vetslistall(Model model) {
		
		// model : 
		// vetslist - ?��?��?���?(id, first_name, last_name)
		// vetspeslist - ?��?��ID ?? ?��공ID 맵핑?���? (vet_id, specialty_id)
		// specialtieslist - ?��공정�?(id, name)
		
		VetsDao dao = sqlSession.getMapper(VetsDao.class);
		VetspecialtiesDao vsdao = sqlSession.getMapper(VetspecialtiesDao.class);
		SpecialtiesDao sdao = sqlSession.getMapper(SpecialtiesDao.class);
		model.addAttribute("vetslist", dao.vetslistDao());
		model.addAttribute("vetspeslist", vsdao.vetspeslistDao());
		model.addAttribute("specialtieslist", sdao.specialtieslistDao());
		
		return "petclinic/vetslistall";
	}
	*/
		
}
