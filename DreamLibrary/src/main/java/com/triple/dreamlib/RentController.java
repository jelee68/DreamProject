package com.triple.dreamlib;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class RentController {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private DataSourceTransactionManager transactionManager;
	
	@RequestMapping("/rent_manager")
	public String rent_main() {
		return "rent_manager";
	}
	
	@RequestMapping("/input_user")
	public String input_user() {
		return "rent_manager";
	}
	
	@RequestMapping("/input_book")
	public String input_book() {
		return "rent_manager";
	}

}
