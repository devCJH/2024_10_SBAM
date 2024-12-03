<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>

<c:set var="pageTitle" value="메인" />

<%@ include file="/WEB-INF/jsp/common/header.jsp" %>

<script>
	$(function() {
		$('#popUpBtn').click(function(){
			let popOption = 'width=500px, height=500px, top=200px, scrollbars=yes';
			let openUrl = '/usr/home/popUp';
			
			window.open(openUrl, 'pop', popOption);
		})
		
		$('#popUpBtn2').click(function(){
			let popOption = 'width=500px, height=500px, top=200px, scrollbars=yes';
			let openUrl = '/usr/home/popUp';
			
			window.open(openUrl, 'pop1', popOption);
		})
		
		$('#modalBtn').click(function() {
			$('#modalLayer-bg').show();
			$('#modalLayer').show();
		})
		
		$('#closeBtn').click(function() {
			$('#modalLayer-bg').hide();
			$('#modalLayer').hide();
		})
		
		$('#modalLayer-bg').click(function() {
			$('#modalLayer-bg').hide();
			$('#modalLayer').hide();
		})
	})
	
</script>

<section class="mt-8">
	<div class="container mx-auto">
		<div>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Perspiciatis laudantium quod expedita quae tenetur maxime modi commodi non esse minus nostrum voluptates necessitatibus ipsum reprehenderit architecto recusandae eligendi mollitia tempore.</div>
		<div>안녕하세요</div>
		<div>
			<div><button class="btn btn-active btn-sm" id="testBtn">ajax 테스트버튼</button></div>
		</div>
		<div id="testDiv"></div>
		
		<div class="flex mt-4">
			<button id="popUpBtn" class="btn btn-active btn-sm mr-10">팝업예시</button>
			<button id="popUpBtn2" class="btn btn-active btn-sm mr-10">팝업예시2</button>
			<button id="modalBtn" class="btn btn-active btn-sm">모달예시</button>
		</div>
		
		<div id="modalLayer-bg"></div>
		<div id="modalLayer">
			<div>Modal</div>
			<div>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Deserunt mollitia ea perspiciatis maxime recusandae consequatur beatae possimus unde ipsa quo cupiditate eum consectetur dolorum non at alias modi in natus.</div>
			<button id="closeBtn">CLOSE</button>
		</div>
		
		<div class="mt-8">
			<div>
				<form action="upload" method="post" enctype="multipart/form-data">
					<input type="file" name="file" />
					<button class="btn btn-active btn-sm">업로드</button>
				</form>
			</div>
			<div class="mt-2">
				<a class="btn btn-active btn-sm" href="view">파일보러가기</a>
			</div>
		</div>
		
		<div class="mt-8">
			<form action="checkboxSubmit">
				<label>
					<input type="checkbox" name="ids" value="1"/>
					테스트1
				</label>
				<label>
					<input type="checkbox" name="ids" value="2"/>
					테스트2
				</label>
				<label>
					<input type="checkbox" name="ids" value="3"/>
					테스트3
				</label>
				<label>
					<input type="checkbox" name="ids" value="4"/>
					테스트4
				</label>
				<button class="btn btn-active btn-sm">체크박스 전송</button>
			</form>
		</div>
	</div>
</section>

<%@ include file="/WEB-INF/jsp/common/footer.jsp" %>