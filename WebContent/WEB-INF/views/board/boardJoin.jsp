<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Join</title>
</head>
<body>
	<form id="form">
		<table align="center">
			<tr>
				<td align="left"><a href="/board/boardList.do">List</a></td>
			</tr>
			<tr>
				<td>
					<table border="1" width="440">
						<tr>
							<td align="center" width="100">id</td>
							<td>
								<input type="text" name="userId" id="id" maxlength="15">
								<button type="button" id="btnConfirm">중복확인</button>
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
								<img id="image" src="/resources/image/check.png" width="23" height="20" style="display:none;">
								<span id="pw_check"></span>
							</td>
						</tr>
						<tr>
							<td align="center">name</td>
							<td><input type="text" name="userName" id="name" maxlength="5"></td>
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

	// form onsubmit="return checks()" 작동되면 check 시작
	function checks() {
	    // 아이디 영문 + 숫자 정규식
	    var getIdCheck = RegExp(/^[a-zA-Z0-9]*$/);
	    // 비밀번호 영문 + 숫자 6~12자 정규식
	    var getPw = RegExp(/^[a-zA-Z0-9]{6,12}$/);
	    // 이름 유니코드로 변경 한글 정규식
	    var getName = RegExp(/^[\uac00-\ud7a3+]*$/);
	    // 핸드폰번호 숫자 4자리 정규식
	    var getPhoneCheck = RegExp(/[0-9]{4}/);
	    // 우편번호 숫자 XXX-XXX형식 정규식
	    var getPostNoCheck = RegExp(/[0-9]{3}-[0-9]{3}/);
	
	    // 유효성 검사 + 공백 확인
	
	    // 아이디 공백 확인
	    if ($j("#id").val() == "") {
	        alert("아이디를 입력해주세요");
	        $j("#id").focus();
	        return false;
	    }
// 	    // 아이디 유효성검사 (이 부분은 밑에서 keyup 이벤트로 처리)
// 	    if (!getIdCheck.test($j("#id").val())) {
// 	   		alert("아이디는 영문 혹은 숫자만 입력해주세요");
// 	    	$j("#id").focus();
// 	    	return false;
// 	    }
	    // 비밀번호 공백 확인 
	    if ($j("#pw").val() == "") {
	        alert("패스워드를 입력해주세요");
	        $j("#pw").focus();
	        return false;
	    }
// 	   	// 비밀번호 유효성검사 
// 	   	if (!getPw.test($j("#pw").val())) {
// 			alert("형식에 맞게 입력해주세요");
// 	   	    $j("#pw").focus();
// 	    	return false;
// 	    }
	    // 비밀번호 확인란 공백 확인
	    if ($j("#pwCheck").val() == "") {
	        alert("패스워드 확인란을 입력해주세요");
	        return false;
	    }
	    // 비밀번호 확인란 #pw == #pwCheck 확인 
	    if ($j("#pw").val() != $j("#pwCheck").val()) {
	        alert("비밀번호가 상이합니다");
	        $j("#pwCheck").focus();
	        return false;
	    }
	    // 이름 공백 검사 
	    if ($j("#name").val() == "") {
	        alert("이름을 입력해주세요");
	        $j("#name").focus();
	        return false;
	    }
		// 이름 유효성 검사 (제대로 된 이름을 입력하기 위한 확인)
		if (!getName.test($j("#name").val())) {
			alert("올바른 이름을 입력해주세요")
	 	    $j("#name").focus();
	   	   	return false;
		}
	    // phone2 공백 검사
	    if ($j("#phone2").val() == "") {
	        alert("가운데 번호를 입력해주세요")
	        $j("#phone2").focus();
	        return false;
	    }
	    // phone2 유효성 검사 
	    if (!getPhoneCheck.test($j("#phone2").val())) {
	        alert("4자리 숫자만 입력해주세요")
	        $j("#phone2").focus();
	        return false;
	    }
	    // phone3 공백 검사
	    if ($j("#phone3").val() == "") {
	        alert("마지막 번호를 입력해주세요")
	        $j("#phone3").focus();
	        return false;
	    }
	    // phone3 유효성 검사 
	    if (!getPhoneCheck.test($j("#phone3").val())) {
	        alert("4자리 숫자만 입력해주세요")
	        $j("#phone3").focus();
	        return false;
	    }
	    // 우편번호 공백 검사
	    if ($j("#addr1").val() == "") {
	        alert("우편번호를 입력하세요")
	        $j("#addr1").focus();
	        return false;
	    }
	    // 우편번호 유효성 검사
	    if (!getPostNoCheck.test($j("#addr1").val())) {
	        alert("xxx-xxx형식으로 입력해주세요")
	        $j("#addr1").focus();
	        return false;
	    }
	    // 아이디 중복확인
	    if ($j("#idCheck").val() != "Y") {
	        alert("아이디 중복확인을 해주세요");
	        $j("#id").focus();
	        return false;
	    }
		var $frm = $j('#form :input');
		// serialize() 직렬화를 시켜주는 함수. 입력받은 여러 데이터를 하나의 쿼리 문자열로 만들어줌
		var param = $frm.serialize();
	    // 회원가입 완료 alert 띄우기
        $j.ajax({
            url: "/board/boardUserJoin.do",
            type: "POST",
            dataType: "json",
            data: param,
            success: function (res, textStatus, jqXHR) {
//             	 	alert(res.success)
                    alert('회원가입 완료')
                    window.location.replace("/board/boardList.do");
            },
            error: function (jqXHR, textStatus, errorThrown) {
                alert("error")
            }
        });
        return true;
	}
    // form input
    $j(function () {
    	$j('#submit').on('click', checks);
    });
    
	// 값이 변하면 #idCheck 속에 값을 바꾼다.
	$j("#id").change(function () {
	    $j('#idCheck').val('N');
	});
	
	// 붙임표 자동 추가
	$j('#addr1').keydown(function (event) {
	    var key = event.charCode || event.keyCode || 0;
	    $text = $j(this);
	    // ()!==, ==!) 값과 타입까지 비교하는 연산자
	    if (key !== 8 && key !== 9) {
	        if ($text.val().length === 3) {
	            $text.val($text.val() + '-');
	        }
	    }
	    return (key == 8 || key == 9 || key == 46 || (key >= 48 && key <= 57) || (key >= 96 && key <= 105));
	    // Key 8번 백스페이스, Key 9번 탭, Key 46번 Delete 부터 0 ~ 9까지, Key 96 ~ 105까지 넘버패트
	    // 한마디로 JQuery 0 ~~~ 9 숫자 백스페이스, 탭, Delete 키 넘버패드외에는 입력 할 수 없음
	});
	
	// 아이디 중복 확인 Ajax
	$j('#btnConfirm').on('click', function () {
	    // 아이디에 아무값 없이 중복 버튼을 눌렀을시
	    if ($j("#id").val() == "") {
	        alert("아이디를 입력해주세요");
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
	                alert("사용할 수 없는 아이디입니다.");
	                $j('#id').focus();
	                $j('#idCheck').val('N');
	                flag = false;
	            } else {
	                alert("사용할 수 있는 아이디입니다.");
	                $j('#idCheck').val('Y');
	                flag = true;
	            }
	        },
	        error: function (jqXHR, textStatus,
	            errorThrown) {
	            alert("실패");
	        }
	    });
	});
	
	// #pw에 keyup이 될 때마다 함수 실행
	$j(function () {
	    $j("#pw").on('keyup', pwCheck);
	});
	function pwCheck() {
	    if ($j("#pw").val() != $j("#pwCheck").val()) {
	        $j('#image').hide();
	        $j('#pw_check').css('color', 'red');
	        $j('#pw_check').html("비밀번호가 상이합니다.");
	    } else if ($j("#pw").val() == "") {
	    	$j('#image').hide();
	    	$j('#pw_check').html('');
	    } else if ($j("#pw").val() == $j("#pwCheck").val()) {
	        $j('#pw_check').html('');
	    	$j('#image').show();
	    }
	    return true;
	}
	
	// #pwCheck에 keyup이 될 때마다 함수 실행
	$j(function () {
	    $j("#pwCheck").on('keyup', pw_Check);
	});
	function pw_Check() {
	    if ($j("#pwCheck").val() != $j("#pw").val()) {
	        $j('#image').hide();
	        $j('#pw_check').css('color', 'red');
	        $j('#pw_check').html("비밀번호가 상이합니다.");
	      // #pw에 아무 값이 없을때 이미지와 글자를 지움
	    } else if ($j("#pw").val() == "") {
	    	$j('#image').hide();
	    	$j('#pw_check').html('');
	    } else if ($j("#pw").val() == $j("#pwCheck").val()) {
	        $j('#pw_check').html('');
	        $j('#image').show();
	    }
	    return true;
	}
	
	// #id에 keyup이 될 때마다 함수 실행
	$j(function () {
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
	
	// #name에 keyup이 될 때마다 함수 실행
	$j(function () {
	    $j("#name").on('keyup', nameCheck);
	});
	// 정규식 외에 문자를 입력하지 못하게하는 함수
	function nameCheck() {
	    // 이름 유니코드로 변경 한글 정규식
	    var getName = RegExp(/^[\u3131-\u318E\uAC00-\uD7A3]*$/);
	
	    if (!getName.test($j("#name").val())) {
	        // user가 입력되는 값만 입력 할 수 있도록
	        $j("#name").val('');
	        $j("#name").focus();
	        return false;
	    }
	    return true;
	}
	
	// #phone2에 keyup이 될 때마다 함수 실행
	$j(function () {
	    $j("#phone2").on('keyup', phone2Check);
	});
	
	// 정규식 외에 문자를 입력하지 못하게하는 함수
	function phone2Check() {
	    // 0-9 숫자 정규식
	    var getPhoneCheck = RegExp(/^[0-9]/g);
	
	    if (!getPhoneCheck.test($j("#phone2").val())) {
	        $j("#phone2").val('');
	        $j("#phone2").focus();
	        return false;
	    }
	    return true;
	}
	// #phone3에 keyup이 될 때마다 함수 실행
	$j(function () {
	    $j("#phone3").on('keyup', phone3Check);
	});
	
	// 정규식 외에 문자를 입력하지 못하게하는 함수
	function phone3Check() {
	    // 0-9 숫자 정규식
	    var getPhoneCheck = RegExp(/^[0-9]/g);
	
	    if (!getPhoneCheck.test($j("#phone3").val())) {
	        $j("#phone3").val('');
	        $j("#phone3").focus();
	        return false;
	    }
	    return true;
	}
	
	// #addr1에 keyup이 될 때마다 함수 실행
	$j(function () {
	    $j("#addr1").on('keyup', addr1Check);
	});
	
	// 정규식 외에 문자를 입력하지 못하게하는 함수
	function addr1Check() {
	    // 우편번호 숫자 XXX-XXX형식 정규식
	    var getPostNoCheck = RegExp(/^[0-9]/g);
	
	    if (!getPostNoCheck.test($j("#addr1").val())) {
	        $j("#addr1").val('');
	        $j("#addr1").focus();
	        return false;
	    }
	    return true;
	}
// 	    // 이벤트를 사용할때 이런 문법도 있음 밑에 Ajax와 활용 가능
//		// #email에 keyup이 될 때마다 emailcheck 함수 실행 'keyup', ''옆에 이자리는 함수 실행자리
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
// 	                    $('#pwCheckAjax').html("사용할 수 없는 이메일입니다.")
// 	                    flag = false;
// 	                } else {
// 	                    $('#pwCheckAjax').css('color', 'blue')
// 	                    $('#pwCheckAjax').html("사용할 수 있는 이메일입니다.")
// 	                    flag = true;
// 	                }
// 	            },
// 	            error: function (jqXHR, textStatus,
// 	                errorThrown) {
// 	                alert("실패");
// 	            }
// 	        });
// 	    }
</script>
</body>
</html>