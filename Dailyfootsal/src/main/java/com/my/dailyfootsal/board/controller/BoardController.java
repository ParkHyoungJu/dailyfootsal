package com.my.dailyfootsal.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.my.dailyfootsal.board.dto.BoardDto;
import com.my.dailyfootsal.board.service.BoardService;

@Controller
public class BoardController {
	
	

	@Autowired
	private BoardService boardService;
	
	@RequestMapping("home")
	public ModelAndView home(@RequestParam(defaultValue="1") int pageNum) {
		ModelAndView mView = boardService.getList(pageNum);
		
		
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
	public ModelAndView detail(@RequestParam int num){
		ModelAndView mView =boardService.getData(num);
		mView.setViewName("detail");
		
		return mView;
	}
	
	@RequestMapping("page1")
	public ModelAndView page1(@RequestParam(defaultValue="1") int pageNum){
		ModelAndView mView = boardService.getList(pageNum);
		mView.setViewName("page1");
		
		return mView;
	}
}
