<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
	th{
		width: 70px;
	}
</style>
<div id="detailDiv">
	<button style="float: left" onclick="back(${pageNum})">뒤로가기</button>
	<div class="board_list_table">
		<table class="list_table">
			<caption>${dto.name }님의 작성글</caption>
			<tr>
				<th>번호</th>
				<td>${dto.num }</td>
			</tr>
			<tr>
				<th>제목</th>
				<td>${dto.title }</td>
			</tr>
			<tr>
				<th>이름</th>
				<td>${dto.name }</td>
			</tr>
			<tr>
				<th>등록일자</th>
				<td>${dto.regdate }</td>
			</tr>
			<tr>
				<th>내용</th>
				<td style="height: 300px">
					<div style="height: 300px; overflow: scroll;">${dto.contents }</div>
				</td>
			</tr>
		</table>
	</div>
</div>

<script>
	function back(pageNum){
		$.ajax({
			url: "page1.do?pageNum="+pageNum,
			method: "GET",
			success : function(data){
				$("#p1").html(data);
				page1Click();
			}
		});
	}
</script>