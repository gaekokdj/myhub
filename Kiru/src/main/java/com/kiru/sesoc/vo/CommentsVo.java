package com.kiru.sesoc.vo;

import lombok.Data;

@Data
public class CommentsVo {
	
	private int comment_num;
	private int board_num;
	private String user_id;
	private String comments_content;
	private String comments_date;
}
