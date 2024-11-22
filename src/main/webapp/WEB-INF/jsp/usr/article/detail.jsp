<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>

<c:set var="pageTitle" value="상세보기" />

<%@ include file="/WEB-INF/jsp/common/header.jsp" %>

<section class="mt-8">
	<div class="container mx-auto border-b-2 border-slate-200">
		<div class="w-9/12 mx-auto">
			<table class="table table-lg">
				<tr>
					<th>번호</th>
					<td>${article.getId() }</td>
				</tr>
				<tr>
					<th>작성일</th>
					<td>${article.getRegDate().substring(2, 16) }</td>
				</tr>
				<tr>
					<th>수정일</th>
					<td>${article.getUpdateDate().substring(2, 16) }</td>
				</tr>
				<tr>
					<th>작성자</th>
					<td>${article.getLoginId() }</td>
				</tr>
				<tr>
					<th>제목</th>
					<td>${article.getTitle() }</td>
				</tr>
				<tr>
					<th>내용</th>
					<td>${article.getBody() }</td>
				</tr>
			</table>
		</div>
		
		<div class="w-9/12 mx-auto my-3 text-sm flex justify-between">
			<div>	
				<button class="btn btn-active btn-sm" onclick="history.back();">뒤로가기</button>
			</div>
			<c:if test="${rq.getLoginedMemberId() == article.getMemberId() }">
				<div>
					<a class="btn btn-active btn-sm" href="modify?id=${article.getId() }">수정</a>
					<a class="btn btn-active btn-sm" onclick="if(confirm('정말 삭제하시겠습니까?') == false) return false;" href="doDelete?id=${article.getId() }">삭제</a>
				</div>
			</c:if>
		</div>
	</div>
</section>

<script>
	const replyForm_onSubmit = function(form) {
		form.body.value = form.body.value.trim();
		
		if (form.body.value.length == 0) {
			alert('내용이 없는 댓글은 작성할 수 없습니다');
			form.body.focus();
			return;
		}
		
		form.submit();
	}
</script>

<section class="my-5">
	<div class="container mx-auto px-4 text-base">
		<div class="text-lg">댓글</div>
		
		<c:forEach var="reply" items="${replies }">
			<div class="py-2 border-b-2 border-slate-200 pl-20">
				<div class="font-semibold">${reply.getLoginId() }</div>
				<div class="text-lg my-1 ml-2">${reply.getForPrintBody() }</div>
				<div class="text-xs text-gray-400">${reply.getRegDate() }</div>
			</div>
		</c:forEach>
		
		<c:if test="${rq.getLoginedMemberId() != -1 }">
			<form action="/usr/reply/doWrite" method="post" onsubmit="replyForm_onSubmit(this); return false;">
				<input type="hidden" name="relTypeCode" value="article" />
				<input type="hidden" name="relId" value="${article.getId() }" />
				<div class="border-2 border-slate-200 rounded-xl px-4 mt-2">
					<div class="mt-3 mb-2">작성자</div>
					<textarea style="resize:none;" class="textarea textarea-bordered textarea-md w-full" name="body"></textarea>
					<div class="flex justify-end mb-2">
						<button class="btn btn-active btn-sm">작성</button>
					</div>
				</div>
			</form>
		</c:if>
	</div>
</section>

<%@ include file="/WEB-INF/jsp/common/footer.jsp" %>