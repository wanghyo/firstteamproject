<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/client/common/header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>관심프로젝트</title>
<script src="/resources/js/common/jquery-3.7.0.min.js"></script>
<script src="/resources/js/common/jquery-1.12.4.min.js"></script>
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css" />
<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<script src="https://kit.fontawesome.com/312ff11b0d.js" crossorigin="anonymous"></script>


<link rel="stylesheet" href="/resources/css/supporter/soolLike.css">
<link rel="stylesheet" href="/resources/css/common/aside.css">
<link rel="stylesheet" href="/resources/css/common/common.css">
<link rel="stylesheet" href="/resources/css/common/header.css">
<link rel="stylesheet" href="/resources/css/common/pop.css">
<script src="/resources/js/common/sidebutton.js"></script>
<script src="/resources/js/supporter/soolLike.js"></script>
<script src="/resources/js/common/common.js"></script>
<script src="/resources/js/common/pop.js"></script>

</head>
<body>

	<div id="wrap">

		<div class="wrap_center wrap_myinfo">
			<aside class="main_aside" id="wrap_aside">
				<div class="user_img"></div>
				<p class="user_id" id="user_id">
					<a>내 정보 보기 &gt;</a>
				</p>

				<p class="question" id="question">
					<a>문의 내역</a>
				</p>
				<div class="support_form">
					<p class="support_p smp">서포트</p>
					<ul class="support_ul">
						<li class="support_li1 li_style" id="support_li1"><a>주문 내역</a></li>
						<li class="support_li2 li_style" id="support_li2"><a>관심 프로젝트</a></li>
					</ul>
				</div>

				<div class="maker_form">
					<p class="maker_p smp">메이커</p>
					<ul class="maker_ul">
						<li class="maker_li1 li_style" id="maker_li1"><a>내 프로젝트</a></li>
						<li class="maker_li2 li_style" id="maker_li2"><a>판매현황</a></li>
					</ul>
				</div>

			</aside>
			<section class="main_section">
				<div id="like_top">
					<span class="like_title">관심 프로젝트</span>
					<span class="like_select">
						<span id="likeAll">전체</span> 
						<span id="likeBefore">진행예정</span> 
						<span id="likeIng">진행중</span> 
						<span id="likeAfter">진행종료</span>
					</span>
				</div>


				<div class="seciont_soollike">
					<form name="like_data" id="like_data">
				
						<input type="hidden" name="likeNum" value="${like.likeNum }" />

					</form>
					<c:choose>
						<c:when test="${not empty likeAfter}">
							<c:forEach var="like" items="${likeAfter}">
								<div class="soollike_list" id="soollike_list" data-num="${like.likeNum}">
									<span class="soollike_img">
										<c:if
											test="${not empty like.project.firstImgFilename}">
											<img src="/resources/img/project/uploadStorage/project/${like.project.firstImgFilename}"
												class="project_thumbnail_image" />
										</c:if>
									</span>

									<div class="soollike_ddd">
										<ul class="soollike_ul">
											<li class="soolproject_title">
												<span class="likeempty">
														<i class="fa-regular fa-heart imor"></i> 
														<i class="fa-solid fa-heart imos" id="fa-solid" data-num="${like.likeNum}"></i>
												</span> 
												<span class="project_title">${like.project.title}</span>
											</li>
											<li class="price">
												<div class="progress_bar">
													<div class="bar"></div>
													<div class="rate" data-rate="0"></div>
												</div>
											</li>
										</ul>

										<ul class="tage_ul">
											<li class="tage" id="projectDesc">${like.project.projectDesc}</li>
										</ul>

									</div>

								</div>
								<!--soollike_list-->
							</c:forEach>
						</c:when>
						<c:otherwise>
							<div>
								<h2>관심 프로젝트를 등록해 보세요.</h2>
							</div>
						</c:otherwise>
					</c:choose>
				</div>
				<!--flex_wrap-->

			</section>
		</div>
	</div>
	<%@ include file="/WEB-INF/views/client/common/footer.jsp"%>

	<script>
		var progressWrap = $('.progress_bar'), progressBar = progressWrap
				.find('.bar'), progressText = progressWrap.find('.rate'), progressRate = progressText
				.attr('data-rate');

		//bar animation 2.5s width바뀌는 애니메이트
		progressBar.animate({
			width : progressRate + '%'
		}, 2500);

		setInterval(textAnimation, 1000 / 10);

		function textAnimation() {
			var currentRate = progressBar.width() / progressWrap.width() * 100;
			progressText.text(Math.ceil(currentRate) + '%');

			if (currentRate == progressRate) {
				clearInterval(timer);
			}
		}
	</script>
