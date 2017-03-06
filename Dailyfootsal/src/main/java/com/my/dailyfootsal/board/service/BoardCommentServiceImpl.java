package com.my.dailyfootsal.board.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.my.dailyfootsal.board.dao.BoardCommentDao;
import com.my.dailyfootsal.board.dto.BoardCommentDto;

@Component
public class BoardCommentServiceImpl implements BoardCommentService{
	
	@Autowired
	private BoardCommentDao boardCommentDao;

	@Override
	public ModelAndView getList(int ref_group) {
		List<BoardCommentDto> commentList = boardCommentDao.getList(ref_group);
		ModelAndView mView = new ModelAndView();
		mView.addObject("commentList",commentList);
		
		return mView;
	}
	
	

}
