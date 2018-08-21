package com.triple.dreamlib.dao;

import java.util.ArrayList;
import java.util.List;

import com.triple.dreamlib.dto.BookDto;
import com.triple.dreamlib.dto.RentDto;
import com.triple.dreamlib.dto.UserDto;

public interface RentDao {
	public UserDto userInfoDao(String userId);
	public BookDto bookInfoDao(String bookId);
	
	public UserDto userCheckDao(String userId);
	public BookDto bookCheckDao(String bookId);
	
	public RentDto bookRentDao(String userID);
}
