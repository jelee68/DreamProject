package com.triple.dreamlib.dao;

import java.util.ArrayList;
import com.triple.dreamlib.dto.BookDto;

public interface BookDao {
	public ArrayList<BookDto> booklistDao();
	public void vet_addDao(String first_name, String last_name);
}
