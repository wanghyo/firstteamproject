package com.soolwhale.client.like.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.soolwhale.client.like.dao.LikeDao;
import com.soolwhale.client.like.vo.LikeVO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class LikeServiceImpl implements LikeService {
	
	@Setter(onMethod_=@Autowired)
	private LikeDao likeDao;
	
	@Override
	public List<LikeVO> likeAllList(LikeVO lvo) {
		List<LikeVO> list= null;
		log.info("lvo : " + lvo);
		
		list = likeDao.likeAllList(lvo);
		log.info("likeAllList : " + list );
		
		return list;
	}

	@Override
	public List<LikeVO> likeAfter(LikeVO lvo) {
		List<LikeVO> list=null;
		list = likeDao.likeAfter(lvo);
		return list;
	}

	@Override
	public List<LikeVO> likeBefore(LikeVO lvo) {
		List<LikeVO> list=null;
		list = likeDao.likeBefore(lvo);
		return list;
	}
	
	@Override
	public List<LikeVO> likeIng(LikeVO lvo) {
		List<LikeVO> list=null;
		list = likeDao.likeIng(lvo);
		return list;
	}


}
