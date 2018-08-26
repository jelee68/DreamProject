package com.triple.dreamlib.dto;

import java.util.Date;

public class RentListDto {
	private String rent_no;
	private String book_id;
	private String book_name;
	private Date book_rent_date;
	private Date book_re_due_date;
	private String book_status;
	public RentListDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	public RentListDto(String rent_no, String book_id, String book_name, Date book_rent_date, Date book_re_due_date,
			String book_status) {
		super();
		this.rent_no = rent_no;
		this.book_id = book_id;
		this.book_name = book_name;
		this.book_rent_date = book_rent_date;
		this.book_re_due_date = book_re_due_date;
		this.book_status = book_status;
	}
	public String getRent_no() {
		return rent_no;
	}
	public void setRent_no(String rent_no) {
		this.rent_no = rent_no;
	}
	public String getBook_id() {
		return book_id;
	}
	public void setBook_id(String book_id) {
		this.book_id = book_id;
	}
	public String getBook_name() {
		return book_name;
	}
	public void setBook_name(String book_name) {
		this.book_name = book_name;
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
	public String getBook_status() {
		return book_status;
	}
	public void setBook_status(String book_status) {
		this.book_status = book_status;
	}
	
	
}
