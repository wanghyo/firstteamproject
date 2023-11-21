package com.soolwhale.client.payment.dao;

import java.util.List;

import com.soolwhale.client.payment.vo.PaymentVO;
import com.soolwhale.client.user.vo.UserVO;

@Mapper
public interface PaymentDao {

	public List<PaymentVO> paymentList(UserVO user);
	public List<PaymentVO> paymentListDetail(String merchantUid, UserVO user);
	public PaymentVO paymentListDetailChoice(String merchantUid, UserVO user);

}

