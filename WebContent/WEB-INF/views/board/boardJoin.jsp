<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Join</title>
</head>
<body>
	<form action="/board/boardUserJoin.do" id="form" method="post" accept-charset="UTF-8" onsubmit="return checks()">
		<table align="center">
			<tr>
				<td align="left"><a href="/board/boardList.do">List</a></td>
			</tr>
			<tr>
				<td>
					<table border="1">
						<tr>
							<td align="center">id</td>
							<td>
								<input type="text" name="userId" id="id" maxlength="15">
								<button type="button" id="btnConfirm">�ߺ�Ȯ��</button>
								<input type="hidden" id="idCheck" value="N">
							</td>
						</tr>
						<tr>
							<td align="center">pw</td>
							<td><input type="password" maxlength="12" name="userPw" id="pw"></td>
						</tr>
						<tr>
							<td align="center">pw check</td>
							<td><input type="password" maxlength="12" id="pwCheck">
								<img id="image" src="/resources/image/check.png" width="20" height="20" style="display:none;">
								<span id="pw_check"></span>
							</td>
						</tr>
						<tr>
							<td align="center">name</td>
							<td><input type="text" name="userName" id="name" maxlength="15"></td>
						</tr>
						<tr>
							<td align="center">phone</td>
							<td>
								<select name="userPhone1" id="phone1" style="width: 48px">
									<c:forEach items="${select}" var="phone">
										<option value="${phone.codeName}">${phone.codeName}</option>
									</c:forEach>
							 	</select>&nbsp; 
								<input type="text" name="userPhone2" id="phone2" maxlength="4" style="width: 42px">&nbsp; 
								<input type="text" name="userPhone3" id="phone3" maxlength="4" style="width: 42px">
							</td>
						</tr>
						
						<tr>
							<td align="center">postNo</td>
							<td><input type="text" name="userAddr1" id="addr1" maxlength="7"></td>
						</tr>
						<tr>
							<td align="center">address</td>
							<td><input type="text" name="userAddr2" id="addr2" maxlength="150"></td>
						</tr>
						<tr>
							<td align="center">company</td>
							<td><input type="text" name="userCompany" id="company" maxlength="60"></td>
						</tr>
					</table>
				<td>
			<tr>
			<tr>
				<td align="right" id="submit">join</td>
			</tr>
		</table>
	</form>
<script type="text/javascript">

	// form onsubmit="return checks()" �۵��Ǹ� check ����
	function checks() {
// 	    // ���̵� ���� + ���� ���Խ�
// 	    var getIdCheck = RegExp(/^[a-zA-Z0-9]*$/);
	    // ��й�ȣ ���� + ���� 6~12�� ���Խ�
	    var getPw = RegExp(/^[a-zA-Z0-9]{6,12}$/);
// 	    // �̸� �����ڵ�� ���� �ѱ� ���Խ�
	    var getName = RegExp(/^[\uac00-\ud7a3+]*$/);
	    // �ڵ�����ȣ ���� 4�ڸ� ���Խ�
	    var getPhoneCheck = RegExp(/[0-9]{4}/);
	    // �����ȣ ���� XXX-XXX���� ���Խ�
	    var getPostNoCheck = RegExp(/[0-9]{3}-[0-9]{3}/);
	
	
	    // ��ȿ�� �˻� + ���� Ȯ��
	    //
	    // ���̵� ���� Ȯ��
	    if ($j("#id").val() == "") {
	        alert("���̵� �Է����ּ���");
	        $j("#id").focus();
	        return false;
	    }
// 	    // ���̵� ��ȿ���˻� (�� �κ��� �ؿ��� keyup �̺�Ʈ�� ó��)
// 	    if (!getIdCheck.test($j("#id").val())) {
// 	        alert("���̵�� ���� Ȥ�� ���ڸ� �Է����ּ���");
// 	        $j("#id").focus();
// 	        return false;
// 	    }
	    // ��й�ȣ ���� Ȯ�� 
	    if ($j("#pw").val() == "") {
	        alert("�н����带 �Է����ּ���");
	        $j("#pw").focus();
	        return false;
	    }
	    // ��й�ȣ ��ȿ���˻� 
	    if (!getPw.test($j("#pw").val())) {
	        alert("���Ŀ� �°� �Է����ּ���");
	        $j("#pw").focus();
	        return false;
	    }
	    // ��й�ȣ Ȯ�ζ� ���� Ȯ��
	    if ($j("#pwCheck").val() == "") {
	        alert("�н����� Ȯ�ζ��� �Է����ּ���");
	        $j("#pwCheck").focus();
	        return false;
	    }
	    // ��й�ȣ Ȯ�ζ� #pw == #pwCheck Ȯ�� 
	    if ($j("#pw").val() != $j("#pwCheck").val()) {
	        alert("��й�ȣ�� �����մϴ�");
	        $j("#pw").focus();
	        return false;
	    }
	    // �̸� ���� �˻� 
	    if ($j("#name").val() == "") {
	        alert("�̸��� �Է����ּ���");
	        $j("#name").focus();
	        return false;
	    }
	    // �̸� ��ȿ�� �˻� (����� �� �̸��� �Է��ϱ� ���� Ȯ��)
	    if (!getName.test($j("#name").val())) {
	        alert("�ùٸ� �̸��� �Է����ּ���")
	        $j("#name").focus();
	        return false;
	    }
	    // phone2 ���� �˻�
	    if ($j("#phone2").val() == "") {
	        alert("��� ��ȣ�� �Է����ּ���")
	        $j("#phone2").focus();
	        return false;
	    }
	    // phone2 ��ȿ�� �˻� 
	    if (!getPhoneCheck.test($j("#phone2").val())) {
	        alert("4�ڸ� ���ڸ� �Է����ּ���")
	        $j("#phone2").focus();
	        return false;
	    }
	    // phone3 ���� �˻�
	    if ($j("#phone3").val() == "") {
	        alert("������ ��ȣ�� �Է����ּ���")
	        $j("#phone3").focus();
	        return false;
	    }
	    // phone3 ��ȿ�� �˻� 
	    if (!getPhoneCheck.test($j("#phone3").val())) {
	        alert("4�ڸ� ���ڸ� �Է����ּ���")
	        $j("#phone3").focus();
	        return false;
	    }
	    // �����ȣ ���� �˻�
	    if ($j("#addr1").val() == "") {
	        alert("�����ȣ�� �Է��ϼ���")
	        $j("#addr1").focus();
	        return false;
	    }
	    // �����ȣ ��ȿ�� �˻�
	    if (!getPostNoCheck.test($j("#addr1").val())) {
	        alert("xxx-xxx�������� �Է����ּ���")
	        $j("#addr1").val("");
	        $j("#addr1").focus();
	        return false;
	    }
// 	    // ���ּ� ���� �˻�
// 	    if ($j("#addr2").val() == "") {
// 	        alert("���ּҸ� �Է����ּ���")
// 	        $j("#addr2").val("");
// 	        $j("#addr2").focus();
// 	        return false;
// 	    }
// 	    // ȸ���ּ� ���� �˻�
// 	    if ($j("#company").val() == "") {
// 	        alert("ȸ���ּҸ� �Է����ּ���")
// 	        $j("#company").val("");
// 	        $j("#company").focus();
// 	        return false;
// 	    }
	    // ���̵� �ߺ�Ȯ��
	    if ($j("#idCheck").val() != "Y") {
	        alert("���̵� �ߺ�Ȯ���� ���ּ���");
	        $j("#id").focus();
	        return false;
	    }
	    alert("ȸ�������� �Ϸ�Ǿ����ϴ�.")
	    return true;
	}
	
	$j(document).ready(function () {
		
	    // ���� ���ϸ� #idCheck �ӿ� ���� �ٲ۴�.
	    $j("#id").change(function () {
	        $j('#idCheck').val('N');
	    });
	
	    // ����ǥ �ڵ� �߰�
	    $j('#addr1').keydown(function (event) {
	        var key = event.charCode || event.keyCode || 0;
	        $text = $j(this);
	        // ()!==, ==!) ���� Ÿ�Ա��� ���ϴ� ������
	        if (key !== 8 && key !== 9) {
	            if ($text.val().length === 3) {
	                $text.val($text.val() + '-');
	            }
	        }
	        return (key == 8 || key == 9 || key == 46 || (key >= 48 && key <= 57) || (key >= 96 && key <= 105));
	        // Key 8�� �齺���̽�, Key 9�� ��, Key 46�� Delete ���� 0 ~ 9����, Key 96 ~ 105���� �ѹ���Ʈ
	        // �Ѹ���� JQuery 0 ~~~ 9 ���� �齺���̽�, ��, Delete Ű �ѹ��е�ܿ��� �Է¸���
	    });
	
	    // form submit
	    $j('#submit').on('click', function () {
	        $j("#form").submit();
	    });
	
	    // ���̵� �ߺ� Ȯ�� Ajax
	    $j('#btnConfirm').on('click', function () {
	        // ���̵� �ƹ��� ���� �ߺ� ��ư�� ��������
	        if ($j("#id").val() == "") {
	            alert("���̵� �Է����ּ���");
	            $j("#id").focus();
	            return false;
	        }
	        var userId = $j('#id').val();
	        var param = { "userId": userId };
	        $j.ajax({
	            url: '/board/boardIdCheck.do',
	            dataType: 'text',
	            type: 'POST',
	            data: param,
	            success: function (data, textStatus, jqXHR) {
	                if (data == 'fail') {
	                    alert("����� �� ���� ���̵��Դϴ�.");
	                    $j('#id').val("");
	                    $j('#id').focus();
	                    $j('#idCheck').val('N');
	                    flag = false;
	                } else {
	                    alert("����� �� �ִ� ���̵��Դϴ�.");
	                    $j('#idCheck').val('Y');
	                    flag = true;
	                }
	            },
	            error: function (jqXHR, textStatus,
	                errorThrown) {
	                alert("����");
	            }
	        });
	    });
	    
	    // #pwCheck�� keyup�� �� ������ �Լ� ����
  		$j(function () { 
  			$j("#pwCheck").on('keyup', pwCheck);
		});
	    // ���ǿ� ���� CSS ����
	    function pwCheck(){
		    if ($j("#pw").val() != $j("#pwCheck").val()) {
	            $j('#pw_check').css('color', 'red')
	            $j('#pw_check').html("��й�ȣ�� �����մϴ�.")
	            // ���ǿ� Ʋ���� �̹����� ����
	            $j('#image').hide();
	            flag = false;
		    } else {
	            $j('#pw_check').css('color', 'blue')
	            $j('#pw_check').html("��й�ȣ�� �����մϴ�.")
	            // ���ǿ� ������ ���ܳ��� �̹����� �����
	            $j('#image').show();
	            flag = true;
	        }	    
	    }
	    
	    // #id�� keyup�� �� ������ �Լ� ����
  		$j(function () { 
  			$j("#id").on('keyup', idCheck);
		});
	    // ���Խ� �ܿ� ���ڸ� �Է����� ���ϰ��ϴ� �Լ�
	    function idCheck(){
		    // ���̵� ���� + ���� ���Խ�
		    var getIdCheck = RegExp(/^[a-zA-Z0-9]*$/);
	    	
		    if (!getIdCheck.test($j("#id").val())) {
		        alert("���̵�� ���� Ȥ�� ���ڷ� �ۼ����ּ���");
		        $j("#id").val('');
		        $j("#id").focus();
		        return false;
		    }
		    return true;
	    }
	    
		// #name�� keyup�� �� ������ �Լ� ����
  		$j(function () { 
  			$j("#name").on('keyup', nameCheck);
		});
	    // ���Խ� �ܿ� ���ڸ� �Է����� ���ϰ��ϴ� �Լ�
	    function nameCheck(){
	    	// �̸� �ѱ� ���Խ�
		    var getName = RegExp(/^[\u3131-\u318E\uAC00-\uD7A3]*$/);
				    	
		    if (!getName.test($j("#name").val())) {
		        alert("�̸��� �ѱ۷� �ۼ����ּ���");
		        $j("#name").val('');
		        $j("#name").focus();
		        return false;
		    }
		    return true;
	    }
	});
// 	    // �̺�Ʈ�� ����Ҷ� �̷� ������ ���� �ؿ� Ajax�� Ȱ�� ����
//		// #email�� keyup�� �� ������ emailcheck �Լ� ���� 'keyup', ''���� ���ڸ��� �Լ� �����ڸ�
// 	    $(function () {
// 	        $("#email").on('keyup', emailcheck);
// 	    })

// 	    function emailcheck() {
// 	        var userPw = $("#pw").val();
// 	        var param = { "userPw": userPw };
// 	        $.ajax({
// 	            url: 'emailCheck',
// // 	            dataType : 'text',
// 	            method: 'POST',
// 	            data: param,
// 	            success: function (data, textStatus, jqXHR) {
// 	                if (resp == 'fail') {
// 	                    $('#pwCheckAjax').css('color', 'red')
// 	                    $('#pwCheckAjax').html("����� �� ���� �̸����Դϴ�.")
// 	                    flag = false;
// 	                } else {
// 	                    $('#pwCheckAjax').css('color', 'blue')
// 	                    $('#pwCheckAjax').html("����� �� �ִ� �̸����Դϴ�.")
// 	                    flag = true;
// 	                }
// 	            },
// 	            error: function (jqXHR, textStatus,
// 	                errorThrown) {
// 	                alert("����");
// 	            }
// 	        });
// 	    }
</script>
</body>
</html>