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
	public List<BoardDto> getList(BoardDto dto) {
		List<BoardDto> list = session.selectList("board.getList",dto);
		
		return list;
	}

	@Override
	public void insert(BoardDto dto) {
		session.insert("board.insert",dto);
		
	}

	@Override
	public BoardDto getData(int num) {
		BoardDto dto =session.selectOne("board.getData", num);
		
		return dto;
	}

	//전체 글 갯수를 리턴하는 메소드
	@Override
	public int getCount() {
		int count = session.selectOne("board.getCount");
		
		return count;
	}
}