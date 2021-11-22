package com.neuron.spring.main.store.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.neuron.spring.main.domain.Notice;
import com.neuron.spring.main.store.MainStore;

@Repository
public class MainStoreLogic implements MainStore{
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<Notice> selectAllMainNotice(String key) {
		System.out.println("step1");
		List<Notice> nList = sqlSession.selectList("noticeMapper1.selectAllMainNotice", key);
		return nList;
	}





}
