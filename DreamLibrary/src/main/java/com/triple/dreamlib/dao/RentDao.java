package com.triple.dreamlib.dao;

import java.util.ArrayList;
import java.util.List;

import com.triple.dreamlib.dto.BookDto;
import com.triple.dreamlib.dto.UserDto;

public interface RentDao {
	public UserDto userInfoDao(String userId);
	public BookDto bookInfoDao(String bookId);
	
	public List<UserDto> userCheckDao(String userId);
}
