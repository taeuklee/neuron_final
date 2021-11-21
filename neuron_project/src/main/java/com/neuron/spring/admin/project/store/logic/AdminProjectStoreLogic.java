package com.neuron.spring.admin.project.store.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.neuron.spring.admin.project.domain.Project;
import com.neuron.spring.admin.project.store.AdminProjectStore;

@Repository
public class AdminProjectStoreLogic implements AdminProjectStore{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<Project> selectAllProject() {
		List<Project> pList = sqlSession.selectList("adprojectMapper.selectAllProject");
		return pList;
	}

	@Override
	public List<Project> selectOkProject(String key) {
		List<Project> pList = sqlSession.selectList("adprojectMapper.selectOkProject", key);
		return pList;
	}

	@Override
	public List<Project> selectNoProject(String key) {
		List<Project> pList = sqlSession.selectList("adprojectMapper.selectNoProject", key);
		return pList;
	}

	@Override
	public int adminOkUpdate(Project project) {
		int result = sqlSession.update("adprojectMapper.adminOkUpdate", project);
		return result;
	}

	@Override
	public int removeProject(int projectNo) {
		int result = sqlSession.delete("adprojectMapper.removeProject", projectNo);
		return result;
	}



}
