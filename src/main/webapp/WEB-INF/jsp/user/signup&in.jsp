<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메모게시판 - 회원가입</title>

<script
  src="https://code.jquery.com/jquery-3.6.4.min.js"
  integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8="
  crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link rel="stylesheet" href="/static/css/style.css" type="text/css">
</head>
<body>
<div class="login-wrap">
  <div class="login-html">
    <input id="tab-1" type="radio" name="tab" class="sign-in" checked><label for="tab-1" class="tab">로그인</label>
    <input id="tab-2" type="radio" name="tab" class="sign-up"><label for="tab-2" class="tab">회원가입</label>
    <div class="login-form">
      <div class="sign-in-htm">
        <div class="group">
          <label for="user" class="label">로그인 아이디</label>
          <input id="user" id="loginIdInput" type="text" class="input">
        </div>
        <div class="group">
          <label for="pass" class="label">비밀번호</label>
          <input id="pass" id="passwordInput" type="password" class="input" data-type="password">
        </div>
        <div class="group">
          <input type="button" id="loginBtn" class="button" value="로그인하기">
        </div>
        <div class="hr"></div>
        <div class="foot-lnk">
          환영합니다
        </div>
      </div>
      <div class="sign-up-htm">
        <div class="group">
          <label for="joinLoginIdInput" class="label">아이디</label>
          <input id="joinLoginIdInput" type="text" class="input">
        </div>
        <div class="small text-danger d-none" id="duplicateText">중복된 아이디!</div>
        <div class="group">
          <label for="joinPasswordInput" class="label">패스워드</label>
          <input id="joinPasswordInput" type="password" class="input" data-type="password">
        </div>
        <div class="group">
          <label for="joinPasswordConfirmInput" class="label">패스워드 확인</label>
          <input id="joinPasswordConfirmInput" type="password" class="input" data-type="password">
        </div>
        <div class="group">
          <label for="joinEmailInput" class="label">이메일</label>
          <input id="joinEmailInput" type="text" class="input">
        </div>
        <div class="group">
          <input type="button" id="joinBtn" class="button" value="가입하기">
        </div>
        <div class="hr"></div>
        <div class="foot-lnk">
          Copyright @ adorapet 2023
        </div>
      </div>
    </div>
  </div>
</div>	

<script>
	$(document).ready(function() {
		
		$("#joinBtn").on("click", function() {
			let loginId = $("#joinLoginIdInput").val();
			let password = $("#joinPasswordInput").val();
			let passwordConfirm = $("#joinPasswordConfirmInput").val();
			let email = $("#joinEmailInput").val();
			
			if(loginId == "") {
				alert("아이디를 입력해주세요");
				return ;
			}
			
			if(password == "") {
				alert("비밀번호를 입력해주세요");
				return ;
			}
			
			if(password != passwordConfirm) {
				alert("비밀번호가 일치하지 않습니다");
				return ;
			}
			
			
			if(email == "") {
				alert("이메일을 입력하세요");
				return ;
			}
			
			
			$.ajax({
				type:"post"
				, url:"/user/signup"
				, data:{"loginId":loginId, "password":password, "name":name, "email":email}
				, success:function(data) {
					if(data.result == "success") {
						location.href = "/user/signin/view";
					} else {
						alert("회원가입 실패");
					}
				}
				, error:function() {
					alert("회원가입 에러");
				}
			});
			
			
		});
		
		
	});
</script>

</body>
</html>