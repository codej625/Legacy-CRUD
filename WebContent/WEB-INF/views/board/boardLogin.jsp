<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Login</title>
</head>
<body>
	<!-- 로그인 실패시 response되는 결과값 -->
	<c:if test="${result eq 'userPw'}">
		<script type="text/javascript">
			alert('비밀번호가 틀렸습니다.')
		</script>
	</c:if>
	<c:if test="${result eq 'userId'}">
		<script type="text/javascript">
			alert('없는 아이디 입니다.')
		</script>
	</c:if>
	<!-- form을 submit할때 checks함수 실행 -->
	<form action="/board/boardLoginAction.do" id="form" onsubmit="return checks()">
		<table align="center" style="margin-top: 100px;">
			<tr>
				<td>
					<table border="1">
						<tr>
							<td align="center" width="90">id</td>
							<td><input type="text" maxlength="15" name="userId" id="id"></td>
						</tr>
						<tr>
							<td align="center">pw</td>
							<td><input type="password" maxlength="12" name="userPw" id="pw"></td>
						</tr>
					</table>
				<td>
			</tr>
			<tr>
				<td align="right">
					<table>
						<tr>
							<td><a style="margin-right: 3px;" href="/board/boardJoin.do">join</a></td>
							<td id="submit">login</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</form>
	<script type="text/javascript">
		// form input
		$j('#submit').click(function() {
			$j('#form').submit();
		});
		// #id에 keyup이 될 때마다 함수 실행
		$j(function() {
			$j("#id").on('keyup', idCheck);
		});
		// 정규식 외에 문자를 입력하지 못하게하는 함수
		function idCheck() {
			// 아이디 영문 + 숫자 정규식
			var getIdCheck = RegExp(/^[a-zA-Z0-9]*$/);

			if (!getIdCheck.test($j("#id").val())) {
				// user가 입력되는 값만 입력 할 수 있도록
				$j("#id").val('');
				$j("#id").focus();
				return false;
			}
			return true;
		}
		// 공백 + 정규식 검사 함수
		function checks() {

			// 아이디 영문 + 숫자 정규식
			var getIdCheck = RegExp(/^[a-zA-Z0-9]*$/);
			// 비밀번호 영문 + 숫자 6~12자 정규식
			var getPwCheck = RegExp(/^[a-zA-Z0-9]{6,12}$/);

			// 아이디 공백 확인
			if ($j("#id").val() == "") {
				alert("아이디를 입력해주세요");
				$j("#id").focus();
				return false;
			}
			// 비밀번호 공백 확인 
			if ($j("#pw").val() == "") {
				alert("패스워드를 입력해주세요");
				$j("#pw").focus();
				return false;
			}
			return true;
		}
	</script>
</body>
</html>