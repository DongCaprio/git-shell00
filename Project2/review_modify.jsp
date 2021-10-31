<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<script type="text/javascript">
	function review_modify() {
		if (f.score.value == "") {
			alert("평점을 입력하십시요..");
			f.writer.focus();
			return false;
		}
		if (f.reviewComment.value == "") {
			alert("감상평을 입력하십시요.");
			f.reviewComment.focus();
			return false;
		}
		f.action = "review_modify_action";
		f.submit();
	}

	function modify_cancle() {
		location.href = "movie_info?movieNo="+ ${review1movie.movie.movieNo};
	}
</script>
<body>
	리뷰수정폼
	<div id="content">
		<table border=0 cellpadding=0 cellspacing=0>
			<tr>
				<td><br/>
					<table style="padding-left: 10px" border=0 cellpadding=0 cellspacing=0>
						<tr>
							<td bgcolor="f4f4f4" height="22">
								&nbsp;&nbsp; <b>리뷰수정</b>
							</td>
						</tr>
					</table>
					<br> <!-- modify Form  -->
					<form name="f" >
						<input type="hidden" name="reviewNo" value="${review1movie.reviewNo}"/>
						<input type="hidden" name="movieNo" value="${review1movie.movie.movieNo}"/>
						<table border="0" cellpadding="0" cellspacing="1" width="590" bgcolor="BBBBBB">
							<tr>
								<td width=100 align=center bgcolor="E6ECDE" height="22">평점(숫자)</td>
								<td width=490 bgcolor="ffffff" style="padding-left: 10px" align="left">
									<input type="number" style="width: 150" name="score" value="${review1movie.score}"
									 min ="1" max = "5">
								</td>
							</tr>
							<tr>
								<td width=100 align=center bgcolor="E6ECDE" height="22">내용</td>
								<td width=490 bgcolor="ffffff" style="padding-left: 10px" align="left">
									<textarea name="reviewComment" style="width: 350px" rows="14">
										${review1movie.reviewComment}
									</textarea>
								</td>
							</tr>
						</table>
					</form>
					<br>
					<table width=590 border=0 cellpadding=0 cellspacing=0>
						<tr>
							<td align=center>
								<input type="button" value="수정" onClick="review_modify()">
								&nbsp;
								<input type="button" value="취소" onClick="modify_cancle()">
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</div>

</body>
</html>