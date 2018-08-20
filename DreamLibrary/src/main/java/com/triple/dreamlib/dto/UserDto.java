package com.triple.dreamlib.dto;

public class UserDto {
	private String user_id;
	private String user_pwd;
	private String user_name;
	private String user_birth;
	private String user_addr;
	private String user_tel;
	private String adm_check;
	public UserDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	public UserDto(String user_id, String user_pwd, String user_name, String user_birth, String user_addr,
			String user_tel, String adm_check) {
		super();
		this.user_id = user_id;
		this.user_pwd = user_pwd;
		this.user_name = user_name;
		this.user_birth = user_birth;
		this.user_addr = user_addr;
		this.user_tel = user_tel;
		this.adm_check = adm_check;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_pwd() {
		return user_pwd;
	}
	public void setUser_pwd(String user_pwd) {
		this.user_pwd = user_pwd;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_birth() {
		return user_birth;
	}
	public void setUser_birth(String user_birth) {
		this.user_birth = user_birth;
	}
	public String getUser_addr() {
		return user_addr;
	}
	public void setUser_addr(String user_addr) {
		this.user_addr = user_addr;
	}
	public String getUser_tel() {
		return user_tel;
	}
	public void setUser_tel(String user_tel) {
		this.user_tel = user_tel;
	}
	public String getAdm_check() {
		return adm_check;
	}
	public void setAdm_check(String adm_check) {
		this.adm_check = adm_check;
	}
	
	

}
