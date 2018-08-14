package com.triple.dreamlib.dto;

public class BookDto {

	String  BOOK_ID; 
	String  BOOK_CODE; 
	String  BOOK_NAME; 
	String  BOOK_AUTHOR; 
	String  BOOK_DATE; 
	String  BOOK_PUB; 
	String  BOOK_IN_DATE; 
	String  BOOK_IMGPATH;
	
	public BookDto() {
	}
	
	public BookDto(String bOOK_ID, String bOOK_CODE, String bOOK_NAME, String bOOK_AUTHOR, String bOOK_DATE,
			String bOOK_PUB, String bOOK_IN_DATE, String bOOK_IMGPATH) {
		BOOK_ID = bOOK_ID;
		BOOK_CODE = bOOK_CODE;
		BOOK_NAME = bOOK_NAME;
		BOOK_AUTHOR = bOOK_AUTHOR;
		BOOK_DATE = bOOK_DATE;
		BOOK_PUB = bOOK_PUB;
		BOOK_IN_DATE = bOOK_IN_DATE;
		BOOK_IMGPATH = bOOK_IMGPATH;
	}

	public String getBOOK_ID() {
		return BOOK_ID;
	}

	public String getBOOK_CODE() {
		return BOOK_CODE;
	}

	public String getBOOK_NAME() {
		return BOOK_NAME;
	}

	public String getBOOK_AUTHOR() {
		return BOOK_AUTHOR;
	}

	public String getBOOK_DATE() {
		return BOOK_DATE;
	}

	public String getBOOK_PUB() {
		return BOOK_PUB;
	}

	public String getBOOK_IN_DATE() {
		return BOOK_IN_DATE;
	}

	public String getBOOK_IMGPATH() {
		return BOOK_IMGPATH;
	}

	public void setBOOK_ID(String bOOK_ID) {
		BOOK_ID = bOOK_ID;
	}

	public void setBOOK_CODE(String bOOK_CODE) {
		BOOK_CODE = bOOK_CODE;
	}

	public void setBOOK_NAME(String bOOK_NAME) {
		BOOK_NAME = bOOK_NAME;
	}

	public void setBOOK_AUTHOR(String bOOK_AUTHOR) {
		BOOK_AUTHOR = bOOK_AUTHOR;
	}

	public void setBOOK_DATE(String bOOK_DATE) {
		BOOK_DATE = bOOK_DATE;
	}

	public void setBOOK_PUB(String bOOK_PUB) {
		BOOK_PUB = bOOK_PUB;
	}

	public void setBOOK_IN_DATE(String bOOK_IN_DATE) {
		BOOK_IN_DATE = bOOK_IN_DATE;
	}

	public void setBOOK_IMGPATH(String bOOK_IMGPATH) {
		BOOK_IMGPATH = bOOK_IMGPATH;
	}
	
	
}
