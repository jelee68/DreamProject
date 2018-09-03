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
import com.triple.dreamlib.dto.BookDto;
import com.triple.dreamlib.dto.BookSearchDto;
import com.triple.dreamlib.dto.MaxBookIdDto;
import com.triple.dreamlib.dto.Pagination;

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
	
	@RequestMapping("/book_simple_search")
	public String book_simple_search(HttpServletRequest request, Model model) {
		
		String select;
		String input;
		
		BookDao dao = sqlSession.getMapper(BookDao.class);
		
		select = request.getParameter("select1");
		input = request.getParameter("input1");		
		
		model.addAttribute("bookresult",dao.book_result1Dao(select,input));
		
		return "/search_result";
	}
	
	@RequestMapping("/book_search")
	public String book_search() {
		return "/book_search";
	}
	
	@RequestMapping("/book_detail")
	public String book_detail(HttpServletRequest request, Model model) {
		BookDao dao = sqlSession.getMapper(BookDao.class);
		model.addAttribute("selectedBook",dao.selectedBookDao(request.getParameter("book_id")));
		return "/book_detail";
	}	
	
	@RequestMapping("/search_result")
	public String search_result(@RequestParam(defaultValue="1") int curPage, HttpServletRequest request, Model model) {
		
		String select1, select2, select3;
		String input1, input2, input3;
		String cond01, cond02;
		int maxPageListNum, minPageListNum;
		
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


		if(checkInput1) {
			// 전체리스트 개수
	        int listCnt = dao.totalListDao(select1, input1, cond01, select2, input2, cond02, select3, input3).getListCnt();
	        Pagination pagination = new Pagination(listCnt, curPage);
	        maxPageListNum = curPage * pagination.getPageSize();
	        minPageListNum = curPage * pagination.getPageSize() - (pagination.getPageSize()-1);
			//System.out.println("1:"+ checkInput1 +","+ checkInput2 +","+ checkInput3);
			model.addAttribute("bookresult",dao.book_result3Dao(select1, input1, cond01, select2, input2, cond02, select3, input3,maxPageListNum,minPageListNum));
			
			
	        

	        model.addAttribute("listCnt", listCnt);	        
	        model.addAttribute("pagination", pagination);
		
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

		//책이미지 업로드
	    String uploadPath = request.getSession().getServletContext().getRealPath("resources/book_img");	
	    //System.out.println(uploadPath);
		
		int size = 10*1024*1024;	
		String filename="";		
		String book_imgPath="";
			
		try{
		    MultipartRequest multi=new MultipartRequest(request,uploadPath,size,"UTF-8",new DefaultFileRenamePolicy());
							
		    Enumeration files = multi.getFileNames();
		    String file = (String)files.nextElement();
		    filename = multi.getFilesystemName(file);
		    
			book_imgPath="resources/book_img/"+filename;
			
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
		
	    String uploadPath = request.getSession().getServletContext().getRealPath("resources/book_img");	
	
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
		
	/*@RequestMapping("/book_sel")
	public String book_sel(HttpServletRequest request, Model model) {

		BookDao dao = sqlSession.getMapper(BookDao.class);	
		model.addAttribute("booklist", dao.booklistDao());		
		model.addAttribute("book_sel", dao.bookselDao(request.getParameter("book_id")));		
		return "book_manager";	
	}*/
	
	@RequestMapping("/book_sel")
	@ResponseBody
	public String book_sel(@RequestParam("book_id")String id) {
		BookDao dao = sqlSession.getMapper(BookDao.class);	
		Gson gson = new Gson();		
		BookDto bookSel = dao.bookselDao(id);
	
		
		return gson.toJson(bookSel); 
		
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
