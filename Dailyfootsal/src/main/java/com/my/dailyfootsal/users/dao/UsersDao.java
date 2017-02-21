package com.my.dailyfootsal.users.dao;

import com.my.dailyfootsal.users.dto.UsersDto;

public interface UsersDao {
	public void insert(UsersDto dto);
	public boolean exist(UsersDto dto);
	public boolean idCheck(UsersDto dto);
}
