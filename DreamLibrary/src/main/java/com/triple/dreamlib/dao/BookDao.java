package com.triple.dreamlib.dao;

import java.util.ArrayList;
import com.triple.dreamlib.dto.BookDto;
import com.triple.dreamlib.dto.BookSearchDto;

public interface BookDao {
	public ArrayList<BookDto> booklistDao();
	public ArrayList<BookSearchDto> book_result1Dao(String select1, String input1);
	public ArrayList<BookSearchDto> book_result2Dao(String select1, String input1, String cond01,String select2, String input2);	
	public ArrayList<BookSearchDto> book_result3Dao(String select1, String input1, String cond01,String select2, String input2, String cond02,String select3, String input3);
	
}
