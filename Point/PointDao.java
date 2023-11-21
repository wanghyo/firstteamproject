package com.soolwhale.client.point.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.soolwhale.client.point.vo.PointVO;

@Mapper
public interface PointDao {

	public List<PointVO> pointCheckList(String userNum);
	public PointVO pointSum(String userNum);
	
}
