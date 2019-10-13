package com.kiru.sesoc.vo;

import lombok.Data;

@Data
public class BoardVo {
	
	private int board_num;
	private String user_id;
	private String board_name;
	private String board_content;
	private String board_date;
	private int view_date;
	private int like_count;
	private String top_num;
	private String bottom_num;
	private String outer_num;
	private String shoes_num;
	private int board_hit;
}
