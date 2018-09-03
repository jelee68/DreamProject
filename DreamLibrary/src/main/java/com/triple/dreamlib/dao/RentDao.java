package com.triple.dreamlib.dao;

import java.util.ArrayList;
import java.util.List;

import com.triple.dreamlib.dto.BookDto;
import com.triple.dreamlib.dto.RentDto;
import com.triple.dreamlib.dto.RentListDto;
import com.triple.dreamlib.dto.UserDto;

public interface RentDao {
	public UserDto userInfoDao(String userId);
	public BookDto bookInfoDao(String bookId);
	
	public UserDto userCheckDao(String userId);
	public BookDto bookCheckDao(String bookId);
	
	public BookDto bookRentCheckDao(String bookId);
	public ArrayList<RentDto> userRentCheckDao(String userId);
	
	public void rentAddDao(String userID, String bookId);
	
	public ArrayList<RentListDto> rentListDao(String userId);
	
	public void updateReturnDao(String rent_no);
	
	public void bookStatusUpdateDao(String book_status,String book_id);
}
