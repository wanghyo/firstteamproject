<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/client/common/header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>내 정보 보기 MAIN</title>
<script src="/resources/js/common/jquery-3.7.0.min.js"></script>
<script src="/resources/js/common/jquery-1.12.4.min.js"></script>
<link rel="stylesheet" type="text/css"	href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
<link rel="stylesheet" type="text/css"	href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css" />
<script type="text/javascript"	src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<script src="https://kit.fontawesome.com/312ff11b0d.js"	crossorigin="anonymous"></script>
<link rel="stylesheet" href="/resources/css/member/myInfoMain.css">
<script src="/resources/js/member/myInfoMain.js"></script>
<link rel="stylesheet" href="/resources/css/common/aside.css">
<link rel="stylesheet" href="/resources/css/common/common.css">
<link rel="stylesheet" href="/resources/css/common/header.css">
<link rel="stylesheet" href="/resources/css/common/pop.css">
<script src="/resources/js/common/sidebutton.js"></script>
<script src="/resources/js/common/common.js"></script>
<script src="/resources/js/common/pop.js"></script>
</head>
<body>
	<div id="wrap">
		<div class="wrap_center wrap_myinfo">
			<aside class="main_aside" id="wrap_aside">
				<div class="user_img"></div>
				<p class="user_id" id="user_id">
					<a>내 정보 보기 &nbsp; &nbsp; &gt;</a>
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
						<li class="maker_li1 li_style" id="maker_li1">
							<a href="/project/projectList">내 프로젝트</a>
						</li>
						<li class="maker_li2 li_style" id="maker_li2">
							<a href="/project/projectList">판매현황</a>
						</li>
					</ul>
				</div>
			</aside>
			<section class="main_section">
				<div class="etc_info">
					<span class="point_info"> 
						<a href="/member/pwConfirm"> 
							<i class="fa-brands fa-product-hunt"> 포인트</i> 
							<span class="point_p"> ${pointSum.pointSum} P</span>
						</a>
					</span>
					<span class="maker_info"> 
						<span class="funding_info maker_info_span"> 
							<a href="/supporter/orderList" class="maker_info_a"> 
								<span class="maker_info_span1">펀딩 오더</span>
								<span class="maker_info_span2">0</span>
							</a>
						</span> 
						<span class="pro_info maker_info_span"> 
							<a href="/project/projectList" class="maker_info_a"> 
								<span class="maker_info_span1">내 프로젝트</span> 
								<span class="maker_info_span2">0</span>
							</a>
						</span>
					</span>
				</div>
				<div class="soolLike_wrap">
					<h3 class="soolLike_text">
						관심 프로젝트 <a id="likeAll" class="likeAll">더보기 &gt;</a>
					</h3>
					<div class="flex_wrap f1">
						<c:choose>
							<c:when test="${not empty likeAllList}">
								<c:forEach var="like" items="${likeAllList}" varStatus="status">
									<c:if test="${status.index < 6}">
 										<div class="slider">
											<div class="slider_div">
												<a href="/project/fundingDetailView?projectNum=${like.project.projectNum}">
													<img src="/resources/img/project/uploadStorage/project/${like.project.firstImgFilename}" class="simg" />
													<div class="subject">${like.project.title}</div>
													<div class="price">${like.project.targetAmount}</div>
													<div class="hr"></div>
													<ul class="tage">
														<li>${like.project.projectDesc}</li>
													</ul>
												</a>
											</div>
										</div>
									</c:if>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<div>
									<h2>관심 프로젝트를 등록해 보세요.</h2>
								</div>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
			</section>
		</div>
	</div>


	<%@ include file="/WEB-INF/views/client/common/footer.jsp"%>
