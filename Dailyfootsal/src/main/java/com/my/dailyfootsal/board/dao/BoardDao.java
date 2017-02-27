package com.my.dailyfootsal.board.dao;

import java.util.List;

import com.my.dailyfootsal.board.dto.BoardDto;

public interface BoardDao {
	public List<BoardDto> getList();
	public void insert(BoardDto dto);
}
