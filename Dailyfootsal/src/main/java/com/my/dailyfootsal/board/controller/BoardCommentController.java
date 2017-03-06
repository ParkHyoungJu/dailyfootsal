package com.my.dailyfootsal.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.my.dailyfootsal.board.service.BoardCommentService;

@Controller
public class BoardCommentController {
	
	@Autowired
	private BoardCommentService boardCommentService;
	
	@RequestMapping("commentList")
	public void commentList(@RequestParam int ref_group){
		boardCommentService.getList(ref_group);
	}
	
}
