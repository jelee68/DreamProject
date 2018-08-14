package com.triple.dreamlib;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.transaction.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.TransactionDefinition;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class BookController {

	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private DataSourceTransactionManager transactionManager;
	
	@RequestMapping("/book_search")
	public String book_search() {
		return "/book_search";
	}
	
	@RequestMapping("/search_result")
	public String search_result(HttpServletRequest request, Model model) {
		// IDao dao = sqlSession.getMapper(IDao.class);
		//model.addAttribute("search_result", dao.book_resultDao(request.getParameter("book_name")));
		return "/search_result";
	}
	
	@RequestMapping("/book_manager")
	public String search_result(Model model) {
		// IDao dao = sqlSession.getMapper(IDao.class);
		//model.addAttribute("search_result", dao.book_resultDao(request.getParameter("book_name")));
		return "/book_manager";
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
