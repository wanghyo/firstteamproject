package com.soolwhale.client.payment.service;

import java.util.List;

import com.soolwhale.client.payment.dao.PaymentDao;
import com.soolwhale.client.payment.vo.PaymentVO;
import com.soolwhale.client.user.vo.UserVO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class PaymentServiceImpl implements PaymentService {
	
  	@Setter(onMethod_=@Autowired)
  	private PaymentDao paymentDao;

	  @Override 
	  public List<PaymentVO> paymentList(UserVO user) {
    	  log.info("paymentDao 호출");
    	  List<PaymentVO> list = null;
    	  list = paymentDao.paymentList(user);
    	  return list;
	  }
	    
	  @Override 
	  public List<PaymentVO> paymentListDetail(String merchantUid, UserVO user) {
  	    List<PaymentVO> detail = paymentDao.paymentListDetail( merchantUid,  user);
  	    return detail; 
	  }
	  
	  @Override
	  public PaymentVO paymentListDetailChoice(String merchantUid,UserVO user){
  		  PaymentVO detail =(PaymentVO) paymentDao.paymentListDetailChoice(merchantUid,  user);
  		  return detail;  
	  }


}
