package com.triple.dreamlib.dto;

public class BookDto {

	String  seq;
	String  book_id; 
	String  book_code; 
	String  book_name; 
	String  book_author; 
	String  book_date; 
	String  book_pub; 
	String  book_in_date; 
	String  book_imgPath;
	String  book_del;
	String  book_status;
	public BookDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	public BookDto(String seq, String book_id, String book_code, String book_name, String book_author, String book_date,
			String book_pub, String book_in_date, String book_imgPath, String book_del, String book_status) {
		super();
		this.seq = seq;
		this.book_id = book_id;
		this.book_code = book_code;
		this.book_name = book_name;
		this.book_author = book_author;
		this.book_date = book_date;
		this.book_pub = book_pub;
		this.book_in_date = book_in_date;
		this.book_imgPath = book_imgPath;
		this.book_del = book_del;
		this.book_status = book_status;
	}
	public String getSeq() {
		return seq;
	}
	public void setSeq(String seq) {
		this.seq = seq;
	}
	public String getBook_id() {
		return book_id;
	}
	public void setBook_id(String book_id) {
		this.book_id = book_id;
	}
	public String getBook_code() {
		return book_code;
	}
	public void setBook_code(String book_code) {
		this.book_code = book_code;
	}
	public String getBook_name() {
		return book_name;
	}
	public void setBook_name(String book_name) {
		this.book_name = book_name;
	}
	public String getBook_author() {
		return book_author;
	}
	public void setBook_author(String book_author) {
		this.book_author = book_author;
	}
	public String getBook_date() {
		return book_date;
	}
	public void setBook_date(String book_date) {
		this.book_date = book_date;
	}
	public String getBook_pub() {
		return book_pub;
	}
	public void setBook_pub(String book_pub) {
		this.book_pub = book_pub;
	}
	public String getBook_in_date() {
		return book_in_date;
	}
	public void setBook_in_date(String book_in_date) {
		this.book_in_date = book_in_date;
	}
	public String getBook_imgPath() {
		return book_imgPath;
	}
	public void setBook_imgPath(String book_imgPath) {
		this.book_imgPath = book_imgPath;
	}
	public String getBook_del() {
		return book_del;
	}
	public void setBook_del(String book_del) {
		this.book_del = book_del;
	}
	public String getBook_status() {
		return book_status;
	}
	public void setBook_status(String book_status) {
		this.book_status = book_status;
	}
	
	
	


}