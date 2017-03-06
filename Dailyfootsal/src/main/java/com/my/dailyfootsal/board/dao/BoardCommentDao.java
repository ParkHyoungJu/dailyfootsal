package com.my.dailyfootsal.board.dao;

import java.util.List;

import com.my.dailyfootsal.board.dto.BoardCommentDto;

public interface BoardCommentDao {
	public List<BoardCommentDto> getList(int ref_group);
	public void insert(BoardCommentDto dto);
}
