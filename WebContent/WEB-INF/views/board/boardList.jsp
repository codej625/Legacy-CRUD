<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>list</title>
</head>
<body>
	<!-- �α��� ������ response�Ǵ� ����� -->
	<c:if test="${result ne null}">
		<script type="text/javascript">
			alert('${result}�� �ȳ��ϼ���.')
		</script>
	</c:if>
	<table align="center">
		<tr>
			<td>
				<table>
					<tr>
						<c:if test="${session eq null}">
							<td align="left" width="35"><a href="/board/boardLogin.do">login</a></td>
						</c:if>
						<td align="left"><a href="/board/boardJoin.do">join</a></td>
						<td align="right" width="360">total : ${totalCnt}</td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td>
				<table id="boardTable" border="1">
					<tr>
						<td width="80" align="center">Type</td>
						<td width="40" align="center">No</td>
						<td width="300" align="center">Title</td>
					</tr>
					<c:forEach items="${boardList}" var="list">
						<tr>
							<td align="center">${list.comVo.codeName}</td>
							<td>${list.boardNum}</td>
							<td><a href="/board/${list.boardType}/${list.boardNum}/boardView.do?pageNo=${pageVo.pageNo}">${list.boardTitle}</a></td>
						</tr>
					</c:forEach>
				</table>
			</td>
		</tr>
		<c:if test="${session ne null}">
			<tr>
				<td align="right">
					<a href="/board/boardWrite.do">�۾���</a> 
					<a href="/board/boardLogout.do">�α׾ƿ�</a>
				</td>
			</tr>
		</c:if>
		<tr>
			<td align="left">
				<form action="/board/boardList.do" method="post">
					<input type="checkbox" id="chk_all">��ü
					<c:forEach items="${checkbox}" var="check">
						<input type="checkbox" name="boardCheckbox" id="chk1" class="del-chk" value="${check.CODE_ID}">${check.CODE_NAME}
					</c:forEach>
					<input type="submit" value="��ȸ">
				</form>
			</td>
		</tr>
	</table>
	<script type="text/javascript">
		$j(document).ready(function() {
			if ($j('#result').val == 1) {
				alert('�α��� ����')
			}
		});

		// 	checkbox -> page �ε��� check all ���
		// 	$j(document).ready(function() {
		// 		$j('#chk_all').prop('checked',true);
		// 		 if($j('#chk_all').is(':checked')){
		// 		    $j('.del-chk').prop('checked',true);
		// 		 }
		// 	});

		// checkbox -> .del-chk ��ü ���ý� #chk_all���� check
		$j(document).on('click', '.del-chk', function() {
			if ($j('input[class=del-chk]:checked').length == $j('.del-chk').length) {
				$j('#chk_all').prop('checked', true);
			} else {
				$j('#chk_all').prop('checked', false);
			}
		});

		// checkbox -> #chk_all(click) -> all checked ���
		$j(document).on('click', '#chk_all', function() {
			if ($j('#chk_all').is(':checked')) {
				$j('.del-chk').prop('checked', true);
			} else {
				$j('.del-chk').prop('checked', false);
			}
		});
	</script>
</body>
</html>