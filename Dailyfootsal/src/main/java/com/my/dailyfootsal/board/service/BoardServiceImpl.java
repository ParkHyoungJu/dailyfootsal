package com.my.dailyfootsal.board.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.my.dailyfootsal.board.dao.BoardDao;
import com.my.dailyfootsal.board.dto.BoardDto;

@Component
public class BoardServiceImpl implements BoardService{
	
	@Autowired
	private BoardDao boardDao;

	@Override
	public ModelAndView getList() {
		ModelAndView mView = new ModelAndView();
		List<BoardDto> list = boardDao.getList();
		mView.addObject("list", list);
		
		return mView;
	}

	@Override
	public void insert(BoardDto dto) {
		boardDao.insert(dto);
		
	}
}
