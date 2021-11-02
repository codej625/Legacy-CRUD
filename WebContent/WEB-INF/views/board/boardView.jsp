<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>boardView</title>
</head>

<script type="text/javascript">

	$j(document).ready(function(){
		
		$j("#submit").on("click",function(){
			var result = confirm('�Խñ��� �����Ͻðڽ��ϱ�?');
			if(result) {
				var $frm = $j('.boardDelete :input');
				var param = $frm.serialize();
				
				$j.ajax({
				    url : "/board/boardDelete.do",
				    dataType: "json",
				    type: "POST",
				    data : param,
				    success: function(data, textStatus, jqXHR)
				    {
						alert("�����Ϸ�");
						
						alert("�޼���:"+data.success);
						
						location.href = "/board/boardList.do?pageNo=${pageNo}";
				    },
				    error: function (jqXHR, textStatus, errorThrown)
				    {
				    	alert("����");
				    }
				});
			} else { 
				alert("������ ��ҵǾ����ϴ�.");
			}
		});
	});
	

</script>


<body>
<form class="boardDelete">
<table align="center">
		<tr>
			<td align="right">
			<input id="submit" type="button" value="����">
			</td>
		</tr>
	<tr>
		<td>
			<table border ="1">
				<tr>
					<td width="120" align="center">
					Title
					</td>
					<td width="400">
					${board.boardTitle}
					</td>
				</tr>
				<tr>
					<td height="300" align="center">
					Comment
					</td>
					<td>
					${board.boardComment}
					</td>
				</tr>
				<tr>
					<td align="center">
					Writer
					</td>
					<td>
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td align="right">
			<a href="/board/boardList.do">List</a> 
			<a href="/board/${board.boardComment}/${board.boardTitle}/${pageNo}/${board.boardNum}/boardUpdate.do">Update</a>
		</td>
	</tr>
</table>
<input type="hidden" name="boardNum" value="${board.boardNum}">
</form>	
</body>
</html>