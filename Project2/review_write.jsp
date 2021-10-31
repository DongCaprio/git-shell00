<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
	function review_write() {
		if(f.score.value == "" ){
			alert("평점을 입력하세요");
			f.score.focus();
			return false;
		}
		if(f.reviewComment.value == ""){
			alert("감상평을 입력하세요");
			f.reviewComment.focus();
			return false;
		}
		f.action="review_write_action";
		f.submit();
	}

</script>

<title>리뷰 쓰기</title>
</head>
<body>
	영화리뷰작성 <b>[${ currentMovie.title }]</b>
	<form name="f" >
		<input type="hidden" name="movieNo" value="${currentMovie.movieNo}">
		<table border="0" cellpadding="0" cellspacing="1" width="590" bgcolor="BBBBBB">
			<tr>
				<td width=4000 align=center bgcolor="E6ECDE" height="30">평점</td>
				<td width=490 bgcolor="ffffff" style="padding-left: 10px" align="left">
					<input type="number" style="width: 150px" name="score" min ="1" max = "5">
				</td>
				<td width=4000 align=center bgcolor="E6ECDE" height="22">감상평</td>
				<td width=490 bgcolor="ffffff" style="padding-left: 10px" align="left">
					<input type="text" style="width: 150px" name="reviewComment">
				</td>
			</tr>
			<tr>
				<td align=center>
				<input type="button" value="등록하기" onClick="review_write();">
		</table>
	</form>
</body>
</html>