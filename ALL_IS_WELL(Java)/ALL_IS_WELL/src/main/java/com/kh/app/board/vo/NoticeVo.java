package com.kh.app.board.vo;

import lombok.Data;

@Data
public class NoticeVo {
	private String no;
	private String writerNo;
	private String title;
	private String content;
	private String enrollDate;
	private String modifyDate;
	private String status;
}
