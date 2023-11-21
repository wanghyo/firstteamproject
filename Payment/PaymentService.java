package com.soolwhale.client.payment.service;

import java.util.List;

import com.soolwhale.client.payment.vo.PaymentVO;
import com.soolwhale.client.user.vo.UserVO;

public interface PaymentService {
	public List<PaymentVO> paymentList(UserVO user);

	public List<PaymentVO> paymentListDetail(String merchantUid, UserVO user);
	public PaymentVO paymentListDetailChoice(String merchantUid, UserVO user);

}

