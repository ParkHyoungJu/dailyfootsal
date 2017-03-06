<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style type="text/css">
	/* boardcss_list 에서 사용되는 글 등록 버튼 테이블 크기 */
	#boardcss_list_add_button_table { 
		width:100%;
		margin: 0 auto 15px;
	}
	
	/* 화면에 보여지는 글 등록 버튼 */
	#boardcss_list_add_button_table .add_button {
		cursor: pointer; 
		border: 1px solid #bebebe;
		text-align: center;
		font-weight: bold;
	}
	
	/* boardcss_list 에서 사용하는 글 목록 테이블 크기*/
	.boardcss_list_table { 
		width:100%; 
	}
	
	/* 화면에 보여지는 글 목록 테이블 */
	.list_table {
		margin: 0 auto;
		width: 100%;
	}
	.list_table > caption{
		text-align: center;
	}
	/* list_table 에서 사용되는 thead */
	.list_table thead th { 
		border-top: 1px solid #e5e5e5; 
		border-bottom: 1px solid #e5e5e5;
		padding: 5px 0; 
		text-align: center; 
		background: #faf9fa;	
	}
	
	/* list_table 에서 사용되는 tbody */
	.list_table tbody td { 
		 padding: 5px 0; 
		 text-align: center; 
		 border-bottom: 1px solid #e5e5e5;
	}
	
	tbody td p{
		cursor: pointer;
	}
	.page_display a{
		text-decoration: none;
		color: #000;
		cursor: pointer;
	}
	.page_display a.active{
		font-weight: bold;
		color: red;
		text-decoration: underline;
	}
	
	.page_display a.muted{
		color: #cecece;
	}
</style>
<div class="page1" style="display: none;">
	<div id="boardcss_list_add_button_table">
		<c:if test="${not empty id }">
			<p id="newBtn" class="add_button">새글 쓰기</p>
		</c:if>
	</div>
	<div class="board_list_table">
		<table class="list_table">
			<caption>게시판</caption>
			<colgroup>
				<col width="20%"/>
				<col width="30%"/>
				<col width="20%"/>
				<col width="30%"/>
			</colgroup>
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>이름</th>
					<th>등록일자</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="tmp" items="${list }">
				<tr height="1" bgcolor="#e5e5e5"><td colspan="4"></td></tr>
					<tr>
						<td>${tmp.num}</td>
						<td>
							<p id="detailtBtn" onclick="detailPage(${tmp.num},${pageNum })">${tmp.title}</p>
						</td>
						<td>${tmp.name}</td>
						<td>${tmp.regdate}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<!-- 페이지 디스플레이 출력 -->
		<div class="page_display">
			<c:choose>
				<c:when test="${startPageNum ne 1 }">
					<a onclick="paging(${startPageNum-1 })">[ 이전 ]</a>
				</c:when>
				<c:otherwise>
					<a class="muted" href="javascript:">[ 이전 ]</a>
				</c:otherwise>
			</c:choose>
		
			<c:forEach var="i" begin="${startPageNum }" end="${endPageNum }">
				<c:choose>
					<c:when test="${i eq pageNum }">
						<a class="active">${i }</a>
					</c:when>
					<c:otherwise>
						<a onclick="paging(${i })">${i }</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:choose>
				<c:when test="${endPageNum lt totalPageCount }">
					<a onclick="paging(${endPageNum+1})">[ 다음 ]</a>
				</c:when>
				<c:otherwise>
					<a class="muted" href="javascript:">[ 다음 ]</a>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
</div>
<script>

$("#newBtn").click(function(){
	$(this).hide();
	$(".board_list_table").hide();
	$.ajax({
		type : "GET",
		url : "insertForm.do",
		success : function(data){
			$(".page1").html(data);
		}
	});
});

function detailPage(num,pageNum){
	$.ajax({
		url: "detail.do?num="+num+"&pageNum="+pageNum,
		type: "GET",
		success : function(data){
			$(".page1").html(data);
		}
	});
}

function paging(pageNum){
	$.ajax({
		url: "page1.do?pageNum="+pageNum,
		method: "GET",
		success: function(data){
			$("#p1").html(data);
			page1Click();
		}
	})
}

</script>