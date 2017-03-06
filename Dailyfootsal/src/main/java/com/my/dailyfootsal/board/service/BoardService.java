package com.my.dailyfootsal.board.service;

import org.springframework.web.servlet.ModelAndView;

import com.my.dailyfootsal.board.dto.BoardDto;

public interface BoardService {
	public ModelAndView getList(int pageNum);
	public void insert(BoardDto dto);
	public ModelAndView getData(int num,int pageNum);
}
