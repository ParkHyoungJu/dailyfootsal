<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
	textarea{
	  	width:100%;
	 	background-color: #cecece;
	}
	.textwrapper
	{
	  border:1px solid #999999;
	  margin:5px 0;
	  padding:1px;
	}
	input#title{
		background-color: #cecece;
	}
</style>
<form action="insert.do" method="post">
	<input type="hidden" name="name" value="${id }"/>
	<label for="title">제목</label>
	<input type="text" id="title" name="title"/>
	<label for="contents">내용</label>
	<div class="textwrapper"><textarea name="contents" id="contents" cols="2" rows="25"></textarea></div>
	<button type="submit" id="insertBtn">저장</button>
</form>