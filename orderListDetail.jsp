<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/client/common/header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>SoolWhale</title>
<script src="/resources/js/common/jquery-3.7.0.min.js"></script>
<script src="/resources/js/common/jquery-1.12.4.min.js"></script>
<link rel="stylesheet" type="text/css"	href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
<link rel="stylesheet" type="text/css"	href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css" />
<script type="text/javascript"	src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<script src="https://kit.fontawesome.com/312ff11b0d.js"	crossorigin="anonymous"></script>
<link rel="stylesheet"	href="/resources/css/supporter/orderListDetail.css">

<link rel="stylesheet" href="/resources/css/common/aside.css">
<link rel="stylesheet" href="/resources/css/common/common.css">
<link rel="stylesheet" href="/resources/css/common/header.css">
<link rel="stylesheet" href="/resources/css/common/pop.css">

<script src="/resources/js/common/sidebutton.js"></script>
<script src="/resources/js/supporter/orderListDetail.js"></script>
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
				<h1 class="orderListDetail_title">
					<i class="fa-solid fa-arrow-left"></i> 주문 상세 내역</h1>
				<div class="order_num">
					<span class="order_dn order_date">
						<span class="order_date_t order_dn_t">주문날자</span>${choice.paymentDate}
					</span>
					<span class="order_dn order_number">
						<span class="order_number_t order_dn_t">주문번호</span>${choice.paymentNum}
					</span>
				</div>
				<table class="order_table">
					<thead class="order_thead">
						<tr>
							<th>상품정보</th>
							<th>배송비</th>
							<th>배송상태</th>
						</tr>
					</thead>
					<tbody>
						<c:choose>
							<c:when test="${not empty detail}">
								<c:forEach var="payment" items="${detail}">
									<tr>
										<td>
											<span class="table_img"> 
												<img src="/resources/img/project/uploadStorage/project/${payment.project.firstImgFilename}" />
											</span>
												<ul class="table_pro">
													<li class="text_wrap">${payment.project.title}</li>
													<li>${payment.rewardr.rewardName}</li>
													<li>${payment.rewardr.rewardDesc}</li>
	
												</ul>
										</td>
										<td class="td">
											<script type="text/javascript">
												var deliveryCharge = "${payment.deliveryCharge}";
												var deliveryChargeText = "";
	
												if (deliveryCharge === "0") {
													deliveryChargeText = "무료배송";
												} else {
													// 기타 상황에 대한 처리
													deliveryChargeText = deliveryCharge;
												}
	
												document.write(deliveryChargeText);
											</script>
										</td>
										<td class="td">
											<script type="text/javascript">
												var deliveryYN = "${payment.deliveryYN}";
												var displayText = "";
	
												if (deliveryYN === "ORD_01") {
													displayText = "주문예약완료";
												} else if (deliveryYN === "ORD_02") {
													displayText = "결제완료";
												} else if (deliveryYN === "ORD_03") {
													displayText = "배송준비중";
												} else if (deliveryYN === "ORD_02") {
													displayText = "배송중";
												} else if (deliveryYN === "ORD_03") {
													displayText = "배송완료";
												} else {
													
													displayText = deliveryYN;
												}
	
												document.write(displayText);
											</script>
										</td>
									</tr>
								</c:forEach>
							</c:when>

						</c:choose>

					</tbody>
				</table>


				<h2 class="mid_title">주문정보</h2>
				<p class="mid_mid_title">주문자</p>
				<p>${choice.user.name}</p>
				<p class="mid_mid_title">연락처</p>
				<p>${choice.user.phoneNumber}</p>
				<p class="mid_mid_title">이메일</p>
				<p>${choice.user.email}</p>

				<h2 class="mid_title">배송지 정보</h2>
				<p class="mid_mid_title">수령인</p>
				<p>${choice.address.recipient}</p>
				<p class="mid_mid_title">연락처</p>
				<p>${choice.address.tel}</p>
				<p class="mid_mid_title">배송정보</p>
				<p>우편번호 ${choice.address.zipcode} &nbsp;&nbsp;
					${choice.address.addr}&nbsp;&nbsp; ${choice.address.addrDetail}</p>
				<p class="mid_mid_title">배송메모</p>
				<p>${choice.address.req}</p>

				<h2 class="mid_title">주문 금액 상세</h2>
				<p>
					<span class="mid_mid_title a">주문금액</span> <span class="b">${choice.payAmount}</span>
					<i class="fa-solid fa-equals"></i> <span class="mid_mid_title a">총 주문금액</span> <span class="a">${choice.payAmount} </span>
				</p>

				<p>
					<span>
						<span><span class="mid_mid_title a">상품금액</span><span class="a">${choice.payAmount}</span></span> 
						<span>
								<span class="mid_mid_title a">배송비</span>
								<span class="a">
									 <script type="text/javascript">
										var reDeliveryCharge = "${choice.deliveryCharge}";
										var reDeliveryChargeText = "";
				
										if (reDeliveryCharge === "0") {
											reDeliveryChargeText = "무료배송";
										} else {
											reDeliveryChargeText = reDeliveryCharge;
										}
										document.write(reDeliveryChargeText);
									</script>
								</span> 
						</span>
					</span>
					 <span> 
					 		<span><span class="mid_mid_title a">포인트</span><span>${choice.usePoint}</span></span>
					</span> <br>
					<span> 
							<span>
								<span class="mid_mid_title mid a">결제 방법 </span><span>${choice.paymentMethod}</span>
							</span>

					</span>
				</p>

			</section>
		</div>
	</div>



	<%@ include file="/WEB-INF/views/client/common/footer.jsp"%>