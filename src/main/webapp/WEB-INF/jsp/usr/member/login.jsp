<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>

<c:set var="pageTitle" value="로그인" />

<%@ include file="/WEB-INF/jsp/common/header.jsp" %>

<section class="mt-8">
	<div class="container mx-auto">
		<form action="doLogin" method="post">
			<div class="table-box">
				<table>
					<tr>
						<th>아이디</th>
						<td><input type="text" name="loginId" placeholder="아이디를 입력해주세요" /></td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td><input type="text" name="loginPw" placeholder="비밀번호를 입력해주세요" /></td>
					</tr>
					<tr>
						<td colspan="2"><button>로그인</button></td>
					</tr>
				</table>
			</div>
		</form>
		
		<div class="btns mt-3 text-sm flex justify-between">
			<button onclick="history.back();">뒤로가기</button>
		</div>
	</div>
</section>

<%@ include file="/WEB-INF/jsp/common/footer.jsp" %>