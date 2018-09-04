package com.triple.dreamlib.dao;

import java.util.ArrayList;

import com.triple.dreamlib.dto.Pagination;
import com.triple.dreamlib.dto.RentListDto;
import com.triple.dreamlib.dto.UserDto;


public interface UserDao {

	public UserDto loginDao(String user_id);

	public void user_addDao(String user_id, String user_pwd, String user_name, String user_birth,
			String user_addr, String user_tel);	
	
	public ArrayList<RentListDto> myRentListDao(String userId,int maxPageListNum, int minPageListNum);
	
	public Pagination totalListDao(String userId);
	
	public int setStartIndex(int i);
	public int setCntPerPage(int i);
	

}
