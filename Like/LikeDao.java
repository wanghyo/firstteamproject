package com.soolwhale.client.like.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.soolwhale.client.like.vo.LikeVO;

@Mapper
public interface LikeDao {
	public List<LikeVO> likeAllList(LikeVO lvo);
	
	public List<LikeVO> likeAfter(LikeVO lvo);
	
	public List<LikeVO> likeBefore(LikeVO lvo);
	
	public List<LikeVO> likeIng(LikeVO lvo);
	
	public List<LikeVO> likeList();
	

}
