package com.neuron.spring.main.store;

import java.util.List;

import com.neuron.spring.main.domain.Notice;

public interface MainStore {

	List<Notice> selectAllMainNotice();

	Notice selectEmgNotice(String key);

	

}
