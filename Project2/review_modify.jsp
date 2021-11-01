<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <title>Memico - Cinema Bootstrap HTML5 Template</title>
        <!-- Bootstrap -->
        <link href="./bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css" />
        <!-- Animate.css -->
        <link href="./animate.css/animate.css" rel="stylesheet" type="text/css" />
        <!-- Font Awesome iconic font -->
        <link href="./fontawesome/css/fontawesome-all.css" rel="stylesheet" type="text/css" />
        <!-- Magnific Popup -->
        <link href="./magnific-popup/magnific-popup.css" rel="stylesheet" type="text/css" />
        <!-- Slick carousel -->
        <link href="./slick/slick.css" rel="stylesheet" type="text/css" />
        <!-- Fonts -->
        <link href='https://fonts.googleapis.com/css?family=Oswald:300,400,500,700' rel='stylesheet' type='text/css'>
        <link href='https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700' rel='stylesheet' type='text/css'>
        <!-- Theme styles -->
        <link href="./css/dot-icons.css" rel="stylesheet" type="text/css">
        <link href="./css/theme.css" rel="stylesheet" type="text/css">

<title>Insert title here</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<script type="text/javascript">
	function review_modify() {
		if (f.score.value == "") {
			alert("평점을 입력하십시요");
			f.writer.focus();
			return false;
		}
		if (f.reviewComment.value == "") {
			alert("감상평을 입력하십시요");
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
	<%-- 리뷰수정폼
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
	</div> --%>
	
	
	<br>
	<div class="section-line" style="padding: 20px 20px 20px 25px;">
                            <div class="section-head">
                                <h2 class="section-title text-uppercase">Review revision</h2>
                            </div>
                            <form autocomplete="off" name="f">
								<input type="hidden" name="reviewNo" value="${review1movie.reviewNo}"/>
								<input type="hidden" name="movieNo" value="${review1movie.movie.movieNo}"/>
                                <div class="row form-grid">
                                    <div class="col-12 col-sm-6">
                                        <div class="input-view-flat input-group" div style=" 
											font-weight: bold; 
											font-size: 2.0em;
											line-height: 1.0em;
											font-family: Impact; ">
                                           ${sMemberId} <!--멤버아이디  --> 
                                        </div>
                                    </div>
                                    
                                    <div class="col-12">
                                        <div class="input-view-flat input-group">
                                            <textarea class="form-control" name="reviewComment" placeholder="Change your review" >${review1movie.reviewComment}</textarea>
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <div class="rating-line">
                                            <label>Rating:</label>
                                            <div class="form-rating" name="score" >
                                                <input type="radio" id="rating-10" name="score" value="5" />
                                                <label for="rating-10">
                                                    <span class="rating-active-icon"><i class="fas fa-star"></i></span>
                                                    <span class="rating-icon"><i class="far fa-star"></i></span>
                                                </label>
                                                <input type="radio" id="rating-9" name="score" value="4" />
                                                <label for="rating-9">
                                                    <span class="rating-active-icon"><i class="fas fa-star"></i></span>
                                                    <span class="rating-icon"><i class="far fa-star"></i></span>
                                                </label>
                                                <input type="radio" id="rating-8" name="score" value="3" />
                                                <label for="rating-8">
                                                    <span class="rating-active-icon"><i class="fas fa-star"></i></span>
                                                    <span class="rating-icon"><i class="far fa-star"></i></span>
                                                </label>
                                                <input type="radio" id="rating-7" name="score" value="2" />
                                                <label for="rating-7">
                                                    <span class="rating-active-icon"><i class="fas fa-star"></i></span>
                                                    <span class="rating-icon"><i class="far fa-star"></i></span>
                                                </label>
                                                <input type="radio" id="rating-6" name="score" value="1" />
                                                <label for="rating-6">
                                                    <span class="rating-active-icon"><i class="fas fa-star"></i></span>
                                                    <span class="rating-icon"><i class="far fa-star"></i></span>
                                                </label>
                                               
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <button class="px-5 btn btn-theme" type="button" onclick="review_modify()">Modify</button>
                                        <button class="px-5 btn btn-theme" type="button" onclick="modify_cancel()">Cancel</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                        
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>                    
    <script>
   	 $("input:radio[name='score']:radio[value='${review1movie.score}']").prop('checked', true); 
 	  /* $("input[type=radio][name=score]").eq(${review1movie.score}).prop("checked", true); */
	</script>
                        
                        
        <!-- jQuery library -->
        <script src="./js/jquery-3.3.1.js"></script>
        <!-- Bootstrap -->
        <script src="./bootstrap/js/bootstrap.js"></script>
        <!-- Paralax.js -->
        <script src="./parallax.js/parallax.js"></script>
        <!-- Waypoints -->
        <script src="./waypoints/jquery.waypoints.min.js"></script>
        <!-- Slick carousel -->
        <script src="./slick/slick.min.js"></script>
        <!-- Magnific Popup -->
        <script src="./magnific-popup/jquery.magnific-popup.min.js"></script>
        <!-- Inits product scripts -->
        <script src="./js/script.js"></script>
        <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAJ4Qy67ZAILavdLyYV2ZwlShd0VAqzRXA&callback=initMap"></script>
        <script async defer src="https://ia.media-imdb.com/images/G/01/imdb/plugins/rating/js/rating.js"></script>
	
	
	
	
	
	

</body>
</html>