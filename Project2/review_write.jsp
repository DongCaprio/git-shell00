<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

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
	
	function review_cancle() {
		location.href = "movie_info?movieNo="+${currentMovie.movieNo};
	}

</script>

<title>리뷰 쓰기</title>
</head>
<body>
	<%-- 영화리뷰작성 <b>[${ currentMovie.title }]</b>
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
	</form> --%>
	
	
	<br>
	<div class="section-line" style="padding: 20px 20px 20px 25px;">
                            <div class="section-head">
                                <h2 class="section-title text-uppercase">Add comment</h2>
                            </div>
                            <form autocomplete="off" name="f">
								<input type="hidden" name="movieNo" value="${currentMovie.movieNo}">
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
                                            <textarea class="form-control" name="reviewComment" placeholder="Add your review"></textarea>
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <div class="rating-line">
                                            <label>Rating:</label>
                                            <div class="form-rating" name="score">
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
                                        <button class="px-5 btn btn-theme" type="button" onclick="review_write()">Send</button>
                                        
                                        <!-- 리뷰쓰기페이지가 인포에 들어가면 없어도 되는 버튼  -->
                                        <button class="px-5 btn btn-theme" type="button" onclick="review_cancel()">Cancel</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                        
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


