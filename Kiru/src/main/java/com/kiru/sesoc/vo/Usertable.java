package com.kiru.sesoc.vo;

import lombok.Data;

@Data
public class Usertable {
	
	private String user_id;
	private String user_body_type;
	private String user_pw;
	private String user_mail;
	private String blacklist;
}
