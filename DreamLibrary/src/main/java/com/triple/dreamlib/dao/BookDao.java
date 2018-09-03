package com.triple.dreamlib.dao;

import java.util.ArrayList;
import com.triple.dreamlib.dto.BookDto;
import com.triple.dreamlib.dto.BookSearchDto;
import com.triple.dreamlib.dto.MaxBookIdDto;
import com.triple.dreamlib.dto.Pagination;

public interface BookDao {
	public ArrayList<BookDto> booklistDao();
	
	public BookDto bookselDao(String book_id);
	public BookSearchDto selectedBookDao(String book_id);
	public MaxBookIdDto maxBookIdDao(String book_code);
	
	public ArrayList<BookSearchDto> book_result1Dao(String select1, String input1);	
	//public ArrayList<BookSearchDto> book_result2Dao(String select1, String input1, String cond01,String select2, String input2);	
	public ArrayList<BookSearchDto> book_result3Dao(String select1, String input1, String cond01,String select2, String input2, String cond02,String select3, String input3,int maxPageListNum, int minPageListNum);
	
	public void book_addDao(String book_id ,String book_code, String book_name, String book_author, 
			String book_date, String book_pub, String book_imgPath);
	
	public void book_modifyDao(String book_code, String book_name, String book_author, 
			String book_date, String book_pub, String book_id);
	
	public void book_deleteDao(String book_id);
	
	public ArrayList<BookDto> newBookListDao();
	
	public Pagination totalListDao(String select1, String input1, String cond01,String select2, String input2, String cond02,String select3, String input3);
	
	public int setStartIndex(int i);
	public int setCntPerPage(int i);
	
}
