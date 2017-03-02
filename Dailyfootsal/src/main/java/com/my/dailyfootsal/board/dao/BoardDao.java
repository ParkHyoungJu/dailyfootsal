package com.my.dailyfootsal.board.dao;

import java.util.List;

import com.my.dailyfootsal.board.dto.BoardDto;

public interface BoardDao {
	public List<BoardDto> getList(BoardDto dto);
	public void insert(BoardDto dto);
	public BoardDto getData(int num);
	public int getCount();
}
