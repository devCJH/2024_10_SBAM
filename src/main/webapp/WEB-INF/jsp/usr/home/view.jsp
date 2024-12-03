<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
    
<c:set var="pageTitle" value="파일 뷰어" />
    
<%@ include file="/WEB-INF/jsp/common/header.jsp" %>

<c:forEach var="file" items="${files }">
	<div>
		<img src="/usr/home/file/${file.getId() }" />
	</div>
</c:forEach>

<%@ include file="/WEB-INF/jsp/common/footer.jsp" %>