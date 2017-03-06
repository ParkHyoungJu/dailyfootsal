package com.my.dailyfootsal.board.dao;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.my.dailyfootsal.board.dto.BoardCommentDto;


@Repository
public class BoardCommentDaoImpl implements BoardCommentDao{

	@Autowired
	private SqlSession session;

	@Override
	public List<BoardCommentDto> getList(int ref_group) {
		List<BoardCommentDto> list =session.selectList("boardComment.getList",ref_group);
		
		return list;
	}

	@Override
	public void insert(BoardCommentDto dto) {
		session.insert("BoardComment.insert",dto);		
		
	}
	
	
	

}