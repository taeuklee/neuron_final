package com.neuron.spring.main.service.logic;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.neuron.spring.main.domain.Notice;
import com.neuron.spring.main.service.MainService;
import com.neuron.spring.main.store.MainStore;

@Service
public class MainServiceImpl implements MainService{
	
	@Autowired
	private MainStore store;

	@Override
	public List<Notice> printAll() {
		List<Notice> nList = store.selectAllMainNotice();
		return nList;
	}

	@Override
	public Notice printOne(String key) {
		Notice notice = store.selectEmgNotice(key);
		return notice;
	}



}
