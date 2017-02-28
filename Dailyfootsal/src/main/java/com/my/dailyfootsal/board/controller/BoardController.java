package com.my.dailyfootsal.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.my.dailyfootsal.board.dto.BoardDto;
import com.my.dailyfootsal.board.service.BoardService;

@Controller
public class BoardController {
	
	

	@Autowired
	private BoardService boardService;
	
	@RequestMapping("home")
	public ModelAndView home() {
		ModelAndView mView = boardService.getList();
		
		
		mView.setViewName("home");
		
		return mView;
	}
	
	@RequestMapping("insertForm")
	public String insertForm(){
		
		return "insertForm";
	}
	
	@RequestMapping("insert")
	public String insert(@ModelAttribute BoardDto dto){
		boardService.insert(dto);
		
		return "redirect:home.do";
	}
	
	@RequestMapping("detail")
	public String detail(){
		return "detail";
	}
}
