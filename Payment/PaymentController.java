package com.soolwhale.client.payment.controller;

import java.util.Collections;
import java.util.Date;
import java.util.List;


import com.soolwhale.client.address.service.AddressService;
import com.soolwhale.client.address.vo.AddressVO;
import com.soolwhale.client.payment.service.PaymentService;
import com.soolwhale.client.payment.vo.PaymentVO;
import com.soolwhale.client.point.service.PointService;
import com.soolwhale.client.point.vo.PointVO;
import com.soolwhale.client.project.service.ProjectService;
import com.soolwhale.client.project.vo.ProjectVO;
import com.soolwhale.client.user.service.UserService;
import com.soolwhale.client.user.vo.UserVO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Controller
@SessionAttributes("payment")
@RequestMapping("/payment/*")
@Slf4j
public class PaymentController {

	@Setter(onMethod_=@Autowired)
	private PaymentService paymentService;


		@PostMapping(value="/paymentListDes")
		public String paymentListDetail(@ModelAttribute PaymentVO pvo, Model model, @SessionAttribute(name = "user", required = false)UserVO user, HttpSession session) {
		    log.info("orderListDetail 메서드로 호출 성공");
		    
		    if(user != null ) {
  		        String merchantUid = pvo.getMerchantUid();
  		        String userNum = user.getUserNum();
  		        pvo.setUserNum(user.getUserNum());
  		        pvo.setUser(user);	 
  		        pvo.setDeliveryCharge(pvo.getDeliveryCharge());
  		        
  		        pvo.setDeliveryYN(pvo.getDeliveryYN());
  		        log.info("user :  : " + userNum);
  		        List<PaymentVO> detail = paymentService.paymentListDetail(merchantUid, user); // user 객체 전달
  		        PaymentVO choice =(PaymentVO) paymentService.paymentListDetailChoice(merchantUid,user);
  		        model.addAttribute("userNum", userNum);
  		        model.addAttribute("merchantUid" , merchantUid);
  		        model.addAttribute("detail", detail);
  		        model.addAttribute("choice", choice);
		        
		        return  "client/supporter/orderListDetail";
		    } else {
		        return "redirect:/member/login";
		    }
		}
		
		@GetMapping(value="/paymentList")
		public String paymentList(Model model,@SessionAttribute(name = "user", required = false)UserVO user, HttpSession session, PaymentVO pvo) {
			
			log.info("paymentList 화면 호출");
		    if (user != null) {
  		    	  log.info("userNum 값" + user.getUserNum());
  		        
  		        List<PaymentVO> paymentList = paymentService.paymentList(user);
  		        Collections.reverse(paymentList); 
  		        pvo.setUser(user);
  		        pvo.setUserNum(user.getUserNum());
  		        pvo.setMerchantUid(pvo.getMerchantUid());
  		        pvo.setPaymentNum(pvo.getPaymentNum());
  		        
      				model.addAttribute("paymentList", paymentList);
      				model.addAttribute("merchantUid", pvo.getMerchantUid());
      				model.addAttribute("userNum" , pvo.getUserNum());
		        return "client/supporter/orderList"; 
		    } else {
		        return "redirect:/member/login"; 
		    }
				
		}
	
	
}
