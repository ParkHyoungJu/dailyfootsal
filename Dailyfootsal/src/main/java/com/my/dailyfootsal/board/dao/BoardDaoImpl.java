package com.my.dailyfootsal.board.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.my.dailyfootsal.board.dto.BoardDto;

@Repository
public class BoardDaoImpl implements BoardDao{

	@Autowired
	private SqlSession session;

	@Override
	public List<BoardDto> getList() {
		List<BoardDto> list = session.selectList("board.getList");
		
		return list;
	}

	@Override
	public void insert(BoardDto dto) {
		session.insert("board.insert",dto);
		
	}
}