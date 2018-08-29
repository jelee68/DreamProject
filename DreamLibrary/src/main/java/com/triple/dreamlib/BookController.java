package com.triple.dreamlib;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.io.*;
import java.util.*;          
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import com.google.gson.Gson;
import com.triple.dreamlib.dao.BookDao;
import com.triple.dreamlib.dto.BookSearchDto;
import com.triple.dreamlib.dto.MaxBookIdDto;

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
		
		boolean checkInput1 = !input1.equals(null);
		boolean checkInput2 = !input2.equals(null);
		boolean checkInput3 = !input3.equals(null);
		System.out.println(input1+":"+input2+":"+input3+":"+checkInput1 +","+ checkInput2 +","+ checkInput3);
		// 입력받은 값이 1개이상인경우
		if(checkInput1 && !checkInput2 && !checkInput3) {
			System.out.println("1:"+ checkInput1 +","+ checkInput2 +","+ checkInput3);
			model.addAttribute("bookresult",dao.book_result1Dao(select1,input1));
		}else if(checkInput1 && checkInput2 && !checkInput3) {
			System.out.println("1:"+ checkInput1 +","+ checkInput2 +","+ checkInput3);
			model.addAttribute("bookresult",dao.book_result2Dao(select1,input1,cond01,select2,input2));	
		}else if(checkInput1 && checkInput2 && checkInput3) {
			System.out.println("1:"+ checkInput1 +","+ checkInput2 +","+ checkInput3);
			model.addAttribute("bookresult",dao.book_result3Dao(select1, input1, cond01, select2, input2, cond02, select3, input3));
		}
		
		/*if (!input1.equals(null)) {
			System.out.println("input1");
			
			// 입력받은 값이 2개이상인경우			
			if (!input2.equals(null)) {
				System.out.println("input2");
				// 입력받은 값이 3개인경우
				if (!input3.equals(null)) {
					System.out.println("input3");					
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
			model.addAttribute("bookresult",dao.book_result1Dao(select1,input1));
		}*/
		
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
		
		//책이미지 업로드
	    String uploadPath="C:\\dev\\DreamLibrary\\DreamProject\\DreamLibrary\\src\\main\\webapp\\resources\\book_img";		
		int size = 10*1024*1024;	
		String filename="";		
		String book_imgPath="";
			
		try{
		    MultipartRequest multi=new MultipartRequest(request,uploadPath,size,"UTF-8",new DefaultFileRenamePolicy());
							
		    Enumeration files = multi.getFileNames();
		    String file = (String)files.nextElement();
		    filename = multi.getFilesystemName(file);
		    
			book_imgPath=uploadPath+"\\"+filename;
			
			int	book_cnt = Integer.parseInt(multi.getParameter("book_cnt"));
			
			for(int i=1;i<=book_cnt;i++) {
			
				String book_id = multi.getParameter("book_id") + String.format("%02d",i);
				dao.book_addDao(book_id, multi.getParameter("book_code"),
				multi.getParameter("book_name"), multi.getParameter("book_author"),multi.getParameter("book_date"), 
				multi.getParameter("book_pub"),book_imgPath);
			}

		}catch(Exception e){
		    e.printStackTrace();
		}		
		
		return "redirect:book_manager";
		
	}	
	
	@RequestMapping("/book_delete")
	public String book_delete(HttpServletRequest request) {
		BookDao dao = sqlSession.getMapper(BookDao.class);

		dao.book_deleteDao(request.getParameter("book_id"));
		return "redirect:book_manager";
	}
	
	@RequestMapping("/book_modify")
	public String book_modify(HttpServletRequest request) {
		BookDao dao = sqlSession.getMapper(BookDao.class);
		
	    String uploadPath="C:\\dev\\DreamLibrary\\DreamProject\\DreamLibrary\\src\\main\\webapp\\resources\\book_img";		
		int size = 10*1024*1024;
		
		try{
		    MultipartRequest multi=new MultipartRequest(request,uploadPath,size,"UTF-8",new DefaultFileRenamePolicy());
			
			dao.book_modifyDao(multi.getParameter("book_code"),multi.getParameter("book_name"), 
					multi.getParameter("book_author"),multi.getParameter("book_date"), 
					multi.getParameter("book_pub"),multi.getParameter("book_id"));

		}catch(Exception e){
		    e.printStackTrace();
		}				
					
		return "redirect:book_manager";
	}
		
	@RequestMapping("/book_sel")
	public String book_sel(HttpServletRequest request, Model model) {

		BookDao dao = sqlSession.getMapper(BookDao.class);	
		model.addAttribute("booklist", dao.booklistDao());		
		model.addAttribute("book_sel", dao.bookselDao(request.getParameter("book_id")));		
		return "book_manager";	
	}

	
	@RequestMapping("/max_book_id")
	@ResponseBody
	public String max_book_id(@RequestParam("book_code")String book_code) {
		
		BookDao dao = sqlSession.getMapper(BookDao.class);	

		Gson gson = new Gson();
		MaxBookIdDto dto = dao.maxBookIdDao(book_code);	
		
		String book_id = book_code.trim() + dto.getBook_id().trim();	
		dto.setBook_id(book_id);

		return gson.toJson(dto);			
	}
	
		
}
