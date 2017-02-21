package com.my.dailyfootsal.users.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.my.dailyfootsal.users.dto.UsersDto;

@Repository
public class UsersDaoImpl implements UsersDao{
	@Autowired
	private SqlSession session;

	@Override
	public void insert(UsersDto dto) {
		session.insert("users.insert",dto);
		
	}

	@Override
	public boolean exist(UsersDto dto) {
		String id = session.selectOne("users.exist",dto);
		boolean success=false;
		if(id!=null){
			success = true;
		}
		return success;
	}

	@Override
	public boolean idCheck(UsersDto dto) {
		UsersDto resultDto = session.selectOne("users.idCheck",dto);
		boolean success=false;
		if(resultDto !=null){
			success = true;
		}
		
		return success;
	}
	
	
}
