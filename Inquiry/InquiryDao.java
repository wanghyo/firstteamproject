package com.soolwhale.client.inquiry.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;


import com.soolwhale.client.inquiry.vo.InquiryVO;

@Mapper
public interface InquiryDao {
	public List<InquiryVO> inquiryList(InquiryVO ivo); 
	
	public int inquiryInsert(InquiryVO ivo);
	
	public InquiryVO inquiryDetail(InquiryVO ivo); 
	
	public int inquiryUpdate(InquiryVO ivo) throws Exception;
	
	public InquiryVO updateForm(InquiryVO ivo);
	
	public int questionDelete(InquiryVO vo) throws Exception;
	
	List<InquiryVO> getListWithPaging(InquiryVO ivo); //페이징 처리


}
