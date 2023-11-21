package com.soolwhale.client.inquiry.vo;


import com.soolwhale.client.user.vo.UserVO;
import com.soolwhale.common.vo.CommonVO;

import lombok.Data;

@Data
public class InquiryVO extends CommonVO {
	private String inquiryNum; // 문의번호
	private String cat =" "; 	// 카테고리
	private String userType=" "; // 사용자 구분
	private String inquiryDate; // 문의 일시
	private String userNum ;  // 사용자 번호
	private String inquiryQ=" "; // 문의 내용
	private String cModifyDate; // 수정일시
	private String inquiryTitle=" "; // 문의제목
	private String id;
	private String rownum;
	private UserVO user;

}
