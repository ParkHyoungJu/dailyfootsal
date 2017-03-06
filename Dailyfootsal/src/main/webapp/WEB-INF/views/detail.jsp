<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
	th{
		width: 70px;
	}
</style>
<div id="detailDiv">
	<button style="float: left" onclick="back(${pageNum})">목록보기</button>
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
		<div class="comments">
			<c:forEach var="tmp" items="${commentList }">
				<div class="comment" <c:if test="${tmp.num ne tmp.comment_group}">style="margin-left:100px"</c:if> >
					
					<c:if test="${tmp.num ne tmp.comment_group }"><div class="reply_icon"></div></c:if>
					<div>
						<strong>from ${tmp.writer }</strong>
						${tmp.regdate }<br/>
						<strong>to ${tmp.target_id }</strong>
						<a href="javascript:">답글</a>
					</div>
					<textarea rows="5" disabled>${tmp.content }</textarea><br/>
					<form action="comment_insert.do" method="post">
						<!-- 덧글 작성자 -->
						<input type="hidden" name="writer"  value="${id }"/>
						<!-- 덧글 그룹 -->
						<input type="hidden" name="ref_group" value="${dto.num }"/>
						<!-- 덧글 대상 -->
						<input type="hidden" name="target_id" value="${tmp.writer }" />
						<input type="hidden" name="comment_group" value="${tmp.comment_group }" />
						<textarea name="content"></textarea>
						<button type="submit">등록</button>
					</form>
				</div>
			</c:forEach>
		
			<div class="comment_form">
				<form action="comment_insert.do" method="post">
					<!-- 덧글 작성자 -->
					<input type="hidden" name="writer"  value="${id }"/>
					<!-- 덧글 그룹 -->
					<input type="hidden" name="ref_group" value="${dto.num }"/>
					<!-- 덧글 대상 -->
					<input type="hidden" name="target_id" value="${dto.name }" />
					<textarea name="content" id="content"></textarea>
					<button type="submit">등록</button>
				</form>
			</div>
		</div>
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
	
	//덧글 달기 혹은 취소 버튼을 눌렀을때
	$(".comment a").click(function(){
		if($(this).text()=="답글"){
			$(this)
			.text("취소")
			.parent()
			.parent()
			.find("form")
			.slideToggle();
		}else{
			$(this)
			.text("답글")
			.parent()
			.parent()
			.find("form")
			.slideToggle();
		}
		
	});
</script>