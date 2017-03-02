package com.my.dailyfootsal.board.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.my.dailyfootsal.board.dao.BoardDao;
import com.my.dailyfootsal.board.dto.BoardDto;

@Component
public class BoardServiceImpl implements BoardService{
	
	//한 페이지에 나타낼 로우의 갯수
	private static final int PAGE_ROW_COUNT=10;
	//하단 디스플레이 페이지 갯수
	private static final int PAGE_DISPLAY_COUNT=5;
	
	@Autowired
	private BoardDao boardDao;

	@Override
	public ModelAndView getList(int pageNum) {
		BoardDto dto = new BoardDto();
		
		//보여줄 페이지 데이터의 시작 ResultSet row 번호
		int startRowNum=1+(pageNum-1)*PAGE_ROW_COUNT;
		//보여줄 페이지 데이터의 끝 ResultSet row 번호
		int endRowNum=pageNum*PAGE_ROW_COUNT;
		//전체 row 의 갯수를 DB 에서 얻어온다.
		int totalRow = boardDao.getCount();
		//전체 페이지의 갯수 구하기
		int totalPageCount=
				(int)Math.ceil(totalRow/(double)PAGE_ROW_COUNT);
		//시작 페이지 번호
		int startPageNum=
			1+((pageNum-1)/PAGE_DISPLAY_COUNT)*PAGE_DISPLAY_COUNT;
		//끝 페이지 번호
		int endPageNum=startPageNum+PAGE_DISPLAY_COUNT-1;
		//끝 페이지 번호가 잘못된 값이라면 
		if(totalPageCount < endPageNum){
			endPageNum=totalPageCount; //보정해준다. 
		}
		
		//시작 row 번호와 끝 row 번호를 CafeDto 에 담는다.
		dto.setStartRowNum(startRowNum);
		dto.setEndRowNum(endRowNum);
		
		
		//Dao 객체를 이용해서 글목록을 얻어온다.
		List<BoardDto> list =boardDao.getList(dto);
		//ModelAndView 객체를 생성해서 글목록을 담는다.
		ModelAndView mView = new ModelAndView();
		mView.addObject("list",list);
		mView.addObject("pageNum",pageNum);
		mView.addObject("startPageNum",startPageNum);
		mView.addObject("endPageNum",endPageNum);
		mView.addObject("totalPageCount",totalPageCount);
		
		mView.addObject("list", list);
		
		return mView;
	}

	@Override
	public void insert(BoardDto dto) {
		boardDao.insert(dto);
		
	}

	@Override
	public ModelAndView getData(int num) {
		BoardDto dto =boardDao.getData(num);
		ModelAndView mView = new ModelAndView();
		mView.addObject("dto", dto);
		
		return mView;
	}
}
