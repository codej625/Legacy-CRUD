<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>boardView</title>
</head>
<body>
	<form class="boardDelete">
		<input type="hidden" name="boardNum" value="${board.boardNum}">
		<input type="hidden" name="boardType" value="${board.boardType}">
		<table align="center">
			<c:if test="${session ne null}">
				<tr>
					<td align="right"><input id="submit" type="button" value="삭제"></td>
				</tr>
			</c:if>
			<tr>
				<td>
					<table border="1">
						<tr>
							<td width="120" align="center">Title</td>
							<td width="400">${board.boardTitle}</td>
						</tr>
						<tr>
							<td height="300" align="center">Comment</td>
							<td>${board.boardComment}</td>
						</tr>
						<tr>
							<td align="center">Writer</td>
							<td>
								<c:if test="${session ne null}">
									${session.userId}
								</c:if>
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td align="right">
					<a href="/board/boardList.do">List</a>
					<c:if test="${session ne null}">
						<a href="/board/${board.boardComment}/${board.boardTitle}/${pageNo}/${board.boardNum}/${board.boardType}/boardUpdate.do">Update</a>
					</c:if>
				</td>
			</tr>
		</table>
	</form>
	<script type="text/javascript">
	$j(document).ready(function() {

		$j("#submit").on("click", function() {
			var result = confirm('게시글을 삭제하시겠습니까?');
			if (result) {
				var $frm = $j('.boardDelete :input');
				var param = $frm.serialize();

				$j.ajax({
					url : "/board/boardDelete.do",
					dataType : "json",
					type : "POST",
					data : param,
					success : function(data, textStatus, jqXHR) {
						alert("삭제완료");

						alert("메세지:" + data.success);

						location.href = "/board/boardList.do?pageNo=${pageNo}";
					},
					error : function(jqXHR, textStatus, errorThrown) {
						alert("실패");
					}
				});
			} else {
				alert("삭제가 취소되었습니다.");
			}
		});
	});
</script>
</body>
</html>