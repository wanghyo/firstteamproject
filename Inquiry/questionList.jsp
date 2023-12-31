<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<title>SoolWhale</title>
<script src="/resources/js/common/jquery-3.7.0.min.js"></script>
<script src="/resources/js/common/jquery-1.12.4.min.js"></script>
<link rel="stylesheet" type="text/css"	href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
<link rel="stylesheet" type="text/css"	href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css" />
<script type="text/javascript"	src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<script src="https://kit.fontawesome.com/312ff11b0d.js"	crossorigin="anonymous"></script>

<link rel="stylesheet" href="/resources/css/member/questionList.css">
<link rel="stylesheet" href="/resources/css/common/aside.css">
<link rel="stylesheet" href="/resources/css/common/common.css">
<link rel="stylesheet" href="/resources/css/common/header.css">
<link rel="stylesheet" href="/resources/css/common/pop.css">
<link rel="stylesheet" href="/resources/css/common/bootstrap.css">
<link rel="stylesheet" href="/resources/css/common/bootstrap.min.css">

<script src="/resources/js/member/questionList.js"></script>
<script src="/resources/js/common/common.js"></script>
<script src="/resources/js/common/pop.js"></script>
<script src="/resources/js/common/sidebutton.js"></script>

</head>
<body>

	<div id="wrap">
		<div data-include1="header" id="header"></div>
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
				<form id="inquiryForm">
					<input type="hidden" id="inquiryNum" name="inquiryNum" "/>
				</form>

				<div class="my_btn_list">
					<span class="my_que que_box" id="my_que"><a>내 문의 내역</a></span>
					<span class="try_que que_box" id="try_que"><a>문의 하기</a></span>
				</div>
 				<h1 class="que_text">내 문의 내역</h1>
				<div class="que_back" id="que_back">
					<table summary="문의 게시판" class="order list_table">
						<thead class="list_table_h">
							<tr>
								<th data-value="inquiry_num" class="text_center or_md_1">No</th>
								<th class="or_md_1">카테고리</th>
								<th class="or_md_2">제목</th>
								<th class="or_md_0">작성시간</th>
							</tr>
						</thead>
						<tbody>
							<c:choose>
								<c:when test="${not empty inquiryList}">
									<c:forEach var="inquiry" items="${inquiryList}"
										varStatus="status">
										<tr class="text-center" data-num="${inquiry.inquiryNum}">
											<td class="table_td1">${inquiry.inquiryNum}</td>
											<td class="table_td4">${inquiry.cat}</td>
											<td class="name table_td3  goDetail">${inquiry.inquiryTitle}</td>
											<td class="table_td2">${inquiry.inquiryDate}</td>
										</tr>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<td colspan="4">등록된 문의글이 존재하지 않습니다.</td>
								</c:otherwise>
							</c:choose>
						</tbody>
					</table>
	<!-- =====================================페이징 출력 시작 ========================== -->
					<div class="pull-right">
						<ul class="pagination justify-content-center"">
							<!-- 이전 바로가기 10개 존재 여부를 prev 필드의 값으로 확인. -->
							<c:if test="${pageMaker.prev}">
								<li class="page-item disabled"><a
									href="${pageMaker.startPage - 1}" class="page-link"
									tabindex="-1">Previous</a></li>
							</c:if>
							<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="num">
								<li class="page-item ${pageMaker.cvo.pageNum == num ? 'active' : ''}">
									<a class="page-link" href="${num}">${num}</a>
								</li>
							</c:forEach>
							<!-- 다음 바로가기 10개 존재 여부를 next 필드의 값으로 확인. -->
							<c:if test="${pageMaker.next}">
								<li class="pagination_button next page-item">
									<a href="${pageMaker.endPage + 1}" class="page-link">Next</a>
								</li>
							</c:if>
						</ul>
					</div>
					<!-- 페이징 버튼 액션 -->
					<form id="actionForm" action="/member/questionList" method="get">
						<input type="hidden" name="pageNum" value="${pageMaker.cvo.pageNum }" />
						<input type="hidden" name="amount" value="${pageMaker.cvo.amount }" />
					</form>
				</div>
			</section>
		</div>
	</div>

	<%@ include file="/WEB-INF/views/client/common/footer.jsp"%>
