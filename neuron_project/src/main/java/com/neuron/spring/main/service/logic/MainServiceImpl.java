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
	public List<Notice> printAll(String key) {
		List<Notice> nList = store.selectAllMainNotice(key);
		return nList;
	}



}
