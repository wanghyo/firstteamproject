package com.soolwhale.client.like.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.soolwhale.client.like.service.LikeService;
import com.soolwhale.client.like.vo.LikeVO;
import com.soolwhale.client.user.vo.UserVO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/supporter/*")
@Slf4j
public class LikeController {

	@Setter(onMethod_ = @Autowired)
	private LikeService likeService;

	@GetMapping(value = "/soolLike")
	public String soolLike() {
		log.info("soolLike 화면 호출");
		return "client/supporter/soolLike";
	}


	@GetMapping(value = "/likeAllList")
	public String likeAllList(@ModelAttribute LikeVO lvo, Model model,
			                      @SessionAttribute(name = "user", required = false) UserVO user, HttpSession session) {
		log.info("likeAll 호출");
		log.info("session" + session);

		if (user != null) {
			lvo.setUserNum(user.getUserNum());

			List<LikeVO> likeAllList = likeService.likeAllList(lvo);
			user.setUserNum(user.getUserNum());
			log.info("LikeAllList-true : " + likeAllList);

			model.addAttribute("likeAllList", likeAllList);
			model.addAttribute("userNum", user.getUserNum());

			return "client/supporter/soolLike";

		} else {
			return "redirect:/member/login"; 
		}

	}

	@GetMapping(value = "/likeAfter")
	public String likeAfter(@ModelAttribute LikeVO lvo, Model model,
			                    @SessionAttribute(name = "user", required = false) UserVO user, HttpSession session) {
		log.info("likeAfter 호출");

		if (user != null) {
			lvo.setUserNum(user.getUserNum());
			List<LikeVO> likeAfter = likeService.likeAfter(lvo);

			model.addAttribute("likeAfter", likeAfter);

			return "client/supporter/soolLikeafter";
		} else {
			return "redirect:/member/login"; 
		}

	}

	@GetMapping(value = "/likeBefore")
	public String likeBefore(@ModelAttribute LikeVO lvo, Model model,
			                     @SessionAttribute(name = "user", required = false) UserVO user, HttpSession session) {
		log.info("likeBefore 호출");

		if (user != null) {
			lvo.setUserNum(user.getUserNum());
			List<LikeVO> likeBefore = likeService.likeBefore(lvo);

			model.addAttribute("likeBefore", likeBefore);

			return "client/supporter/soolLikebefore";
		} else {
			
			return "redirect:/member/login"; 
		}
	}

	@GetMapping(value = "/likeIng")
	public String likeIng(@ModelAttribute LikeVO lvo, Model model,
			                  @SessionAttribute(name = "user", required = false) UserVO user, HttpSession session) {
		log.info("likeIng 호출");

		if (user != null) {
			lvo.setUserNum(user.getUserNum());
			List<LikeVO> likeIng = likeService.likeIng(lvo);

			model.addAttribute("likeIng", likeIng);

			return "client/supporter/soolLikeing";
		} else {
			
			return "redirect:/member/login"; 
		}

	}

}
