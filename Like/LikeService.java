package com.soolwhale.client.like.service;

import java.util.List;

import com.soolwhale.client.like.vo.LikeVO;

public interface LikeService {
	public List<LikeVO> likeAllList(LikeVO lvo);
	
	public List<LikeVO> likeAfter(LikeVO lvo);
	
	public List<LikeVO> likeBefore(LikeVO lvo);
	
	public List<LikeVO> likeIng(LikeVO lvo);
	
}
