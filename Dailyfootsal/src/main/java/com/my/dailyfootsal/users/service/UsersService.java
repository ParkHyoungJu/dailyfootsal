package com.my.dailyfootsal.users.service;

import com.my.dailyfootsal.users.dto.UsersDto;

public interface UsersService {
	public void insert(UsersDto dto);
	public boolean exist(UsersDto dto);
	public boolean idCheck(UsersDto dto);
}
