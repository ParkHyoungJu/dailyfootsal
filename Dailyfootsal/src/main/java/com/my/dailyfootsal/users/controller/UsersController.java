package com.my.dailyfootsal.users.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.my.dailyfootsal.users.dto.UsersDto;
import com.my.dailyfootsal.users.service.UsersService;

@Controller
public class UsersController {
	@Autowired
	private UsersService usersService;
	
	@RequestMapping("/login")
	@ResponseBody
	public Map<String, Object> login(@ModelAttribute UsersDto dto,HttpSession session){
		boolean success = usersService.exist(dto);
		Map<String, Object> map = new HashMap<String, Object>();
		if(success){
			session.setAttribute("id", dto.getId());
			map.put("msg", true);
		}else{
			map.put("msg", false);
		}
		
	
		
		return map;
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session){
		session.removeAttribute("id");
		
		return "redirect:/home.do";
	}
	
	@RequestMapping("/signup")
	public String signup(@ModelAttribute UsersDto dto){
		usersService.insert(dto);
		
		return "redirect:/home.do";
	}
	
	@RequestMapping("/idCheck")
	@ResponseBody
	public Map<String, Object> idCheck(@ModelAttribute UsersDto dto){
		boolean success = usersService.idCheck(dto);
		Map<String, Object> map = new HashMap<String, Object>();
		if(success){
			map.put("result", true);
		}else{
			map.put("result", false);
		}
	
		return map;
	}
	
}
