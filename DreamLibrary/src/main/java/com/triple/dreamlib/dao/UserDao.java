package com.triple.dreamlib.dao;

import java.util.ArrayList;

import com.triple.dreamlib.dto.RentListDto;


public interface UserDao {

	public void loginDao(String user_id, String user_pwd);

	public void user_addDao(String user_id, String user_pwd, String user_name, String user_birth,
			String user_addr, String user_tel);	
	
	public ArrayList<RentListDto> myRentListDao(String userId);
	

}
