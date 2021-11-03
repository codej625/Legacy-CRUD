<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>list</title>
</head>
<script type="text/javascript">

	$j(document).ready(function(){
	});
	
// 	checkbox -> page �ε��� check all ���
// 	$j(document).ready(function() {
// 		$j('#chk_all').prop('checked',true);
// 		 if($j('#chk_all').is(':checked')){
// 		    $j('.del-chk').prop('checked',true);
// 		 }
// 	});
	
// 	checkbox -> .del-chk ��ü ���ý� #chk_all���� check
	$j(document).on('click','.del-chk',function(){
	    if($j('input[class=del-chk]:checked').length == $j('.del-chk').length){
	    	$j('#chk_all').prop('checked',true);
	    }else{
	    	$j('#chk_all').prop('checked',false);
	    }
	});
	
//  checkbox -> #chk_all(click) -> all checked ���
	$j(document).on('click','#chk_all',function(){
	    if($j('#chk_all').is(':checked')){
	       $j('.del-chk').prop('checked',true);
	    }else{
	       $j('.del-chk').prop('checked',false);
	    }
	});

</script>
<body>
<table  align="center">
	<tr>
		<td align="right">
			total : ${totalCnt}
		</td>
	</tr>
	<tr>
		<td>
			<table id="boardTable" border = "1">
				<tr>
					<td width="80" align="center">
						Type
					</td>
					<td width="40" align="center">
						No
					</td>
					<td width="300" align="center">
						Title
					</td>
				</tr>
				<c:forEach items="${boardList}" var="list">
					<tr>
						<td align="center">
							${list.boardType}
						</td>
						<td>
							${list.boardNum}
						</td>
						<td>
							<a href = "/board/${list.boardType}/${list.boardNum}/boardView.do?pageNo=${pageNo}">${list.boardTitle}</a>
						</td>
					</tr>	
				</c:forEach>
			</table>
		</td>
	</tr>
	<tr>
		<td align="right">
			<a href ="/board/boardWrite.do?pageNo=${pageNo}">�۾���</a>
		</td>
	</tr>
	<tr>
		<td align="left">
			<form action="/board/boardTypeSelect.do" method="post">
				<input type="checkbox" 					 id="chk_all"               	      >��ü
				<input type="checkbox" name="typeSelect" id="chk1" class="del-chk" value="a01" >�Ϲ�
				<input type="checkbox" name="typeSelect" id="chk2" class="del-chk" value="a02" >Q&A
				<input type="checkbox" name="typeSelect" id="chk3" class="del-chk" value="a03" >�͸�
				<input type="checkbox" name="typeSelect" id="chk" class="del-chk" value="a04" >����
				<input type="submit" value="��ȸ">
			</form>
		</td>
	</tr>
</table>	
</body>
</html>