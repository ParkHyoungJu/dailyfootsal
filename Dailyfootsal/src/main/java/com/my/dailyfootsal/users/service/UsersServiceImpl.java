package com.my.dailyfootsal.users.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.my.dailyfootsal.users.dao.UsersDao;
import com.my.dailyfootsal.users.dto.UsersDto;

@Component
public class UsersServiceImpl implements UsersService{
	
	@Autowired
	private UsersDao usersDao;

	@Override
	public void insert(UsersDto dto) {
		usersDao.insert(dto);
		
	}

	@Override
	public boolean exist(UsersDto dto) {
		boolean success =usersDao.exist(dto);
		return success;
	}
}
