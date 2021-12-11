<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Login</title>
</head>
<body>
	<!-- �α��� ���н� response�Ǵ� ����� -->
	<c:if test="${result eq 'userPw'}">
		<script type="text/javascript">
			alert('��й�ȣ�� Ʋ�Ƚ��ϴ�.')
		</script>
	</c:if>
	<c:if test="${result eq 'userId'}">
		<script type="text/javascript">
			alert('���� ���̵� �Դϴ�.')
		</script>
	</c:if>
	<!-- form�� submit�Ҷ� checks�Լ� ���� -->
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
		// #id�� keyup�� �� ������ �Լ� ����
		$j(function() {
			$j("#id").on('keyup', idCheck);
		});
		// ���Խ� �ܿ� ���ڸ� �Է����� ���ϰ��ϴ� �Լ�
		function idCheck() {
			// ���̵� ���� + ���� ���Խ�
			var getIdCheck = RegExp(/^[a-zA-Z0-9]*$/);

			if (!getIdCheck.test($j("#id").val())) {
				// user�� �ԷµǴ� ���� �Է� �� �� �ֵ���
				$j("#id").val('');
				$j("#id").focus();
				return false;
			}
			return true;
		}
		// ���� + ���Խ� �˻� �Լ�
		function checks() {

			// ���̵� ���� + ���� ���Խ�
			var getIdCheck = RegExp(/^[a-zA-Z0-9]*$/);
			// ��й�ȣ ���� + ���� 6~12�� ���Խ�
			var getPwCheck = RegExp(/^[a-zA-Z0-9]{6,12}$/);

			// ���̵� ���� Ȯ��
			if ($j("#id").val() == "") {
				alert("���̵� �Է����ּ���");
				$j("#id").focus();
				return false;
			}
			// ��й�ȣ ���� Ȯ�� 
			if ($j("#pw").val() == "") {
				alert("�н����带 �Է����ּ���");
				$j("#pw").focus();
				return false;
			}
			return true;
		}
	</script>
</body>
</html>