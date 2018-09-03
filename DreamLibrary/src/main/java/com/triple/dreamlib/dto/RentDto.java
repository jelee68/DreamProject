package com.triple.dreamlib.dto;

import java.util.Date;

public class RentDto {
	private String rent_no;
	private String user_id;
	private String book_id;
	private Date book_rent_date;
	private Date book_re_due_date;
	private Date book_re_date;
	private String rent_status;
	public RentDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	public RentDto(String rent_no, String user_id, String book_id, Date book_rent_date, Date book_re_due_date,
			Date book_re_date, String rent_status) {
		super();
		this.rent_no = rent_no;
		this.user_id = user_id;
		this.book_id = book_id;
		this.book_rent_date = book_rent_date;
		this.book_re_due_date = book_re_due_date;
		this.book_re_date = book_re_date;
		this.rent_status = rent_status;
	}
	public String getRent_no() {
		return rent_no;
	}
	public void setRent_no(String rent_no) {
		this.rent_no = rent_no;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getBook_id() {
		return book_id;
	}
	public void setBook_id(String book_id) {
		this.book_id = book_id;
	}
	public Date getBook_rent_date() {
		return book_rent_date;
	}
	public void setBook_rent_date(Date book_rent_date) {
		this.book_rent_date = book_rent_date;
	}
	public Date getBook_re_due_date() {
		return book_re_due_date;
	}
	public void setBook_re_due_date(Date book_re_due_date) {
		this.book_re_due_date = book_re_due_date;
	}
	public Date getBook_re_date() {
		return book_re_date;
	}
	public void setBook_re_date(Date book_re_date) {
		this.book_re_date = book_re_date;
	}
	public String getRent_status() {
		return rent_status;
	}
	public void setRent_status(String rent_status) {
		this.rent_status = rent_status;
	}
	
}
