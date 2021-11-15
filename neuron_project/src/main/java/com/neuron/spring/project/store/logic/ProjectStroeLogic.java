package com.neuron.spring.project.store.logic;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.object.StoredProcedure;
import org.springframework.stereotype.Repository;

import com.neuron.spring.project.domain.EmpProject;
import com.neuron.spring.project.domain.Employee;
import com.neuron.spring.project.domain.Project;
import com.neuron.spring.project.domain.ProjectCalendar;
import com.neuron.spring.project.domain.ProjectMember;
import com.neuron.spring.project.domain.ProjectTask;
import com.neuron.spring.project.store.ProjectStore;


@Repository
public class ProjectStroeLogic implements ProjectStore{

	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<Employee> selectInsertProjectSearchList(Map<String, Object> map) {
		List<Employee> eList = sqlSession.selectList("projectMapper.insertProjectSearchList", map);
		return eList;
	}

	@Override
	public int insertProjectRegister(Project project) {
		int result = sqlSession.insert("projectMapper.insertProjectRegister", project);
		return result;
	}
	
	
	@Override
	public Project selectProjectOne(Project project) {
		Project newProject = sqlSession.selectOne("projectMapper.selectProjectOne", project);
		System.out.println(newProject.toString());
		return newProject;
	}

	@Override
	public int insertProjectMemberList(Map<String, Object> map) {
		int result = sqlSession.insert("projectMapper.insertProjectMemberList", map);
		return result;
	}

	@Override
	public List<Project> selectProjectList(Map<String, Object> map) {
		List<Project> projectList = sqlSession.selectList("projectMapper.selectProjectList", map);
		return projectList;
	}

	@Override
	public List<EmpProject> selectMemberProjectList(Map<String, Object> map) {
		List<EmpProject> projectList = sqlSession.selectList("projectMapper.selectMemberProjectList", map);
		return projectList;
	}

	@Override
	public Project selectProjectOne(int projectNo) {
		Project project = sqlSession.selectOne("projectMapper.selectProject", projectNo);
		return project;
	}

	@Override
	public Employee selectMaster(int masterEmpNo) {
		Employee master = sqlSession.selectOne("projectMapper.selectMaster",masterEmpNo);
		return master;
	}

	@Override
	public List<ProjectMember> selectMemberList(int projectNo) {
		List<ProjectMember> memberList = sqlSession.selectList("projectMapper.selectMemberList", projectNo);
		return memberList;
	}

	@Override
	public ProjectTask selectProjectTask(int projectNo) {
		ProjectTask projectTask = sqlSession.selectOne("projectMapper.selectProjectTask", projectNo);
		return projectTask;
	}

	@Override
	public List<ProjectCalendar> selectProjectCalendar(int projectNo) {
		List<ProjectCalendar> projectCalendar = sqlSession.selectList("projectMapper.selectProjectCalendar", projectNo);
		return projectCalendar;
	}

	@Override
	public List<ProjectMember> selectSearchMemberList(Map<String, Object> map) {
		List<ProjectMember> memberList = sqlSession.selectList("projectMapper.selectSearchMemberList", map);
		return memberList;
	}

	@Override
	public int selectListCount() {
		int count = sqlSession.selectOne("projectMapper.selectListCount");
		return count;
	}

	@Override
	public int deleteMemberList(Map<String, Object> map) {
		int result = sqlSession.delete("projectMapper.deleteMemberList", map);
		return result;
	}

	@Override
	public List<Employee> selectInviteList(Map<String, Object> map) {
		List<Employee> eList = sqlSession.selectList("projectMapper.selectInviteList", map);
		return eList;
	}



}
