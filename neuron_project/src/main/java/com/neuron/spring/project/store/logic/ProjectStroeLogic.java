package com.neuron.spring.project.store.logic;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.object.StoredProcedure;
import org.springframework.stereotype.Repository;

import com.neuron.spring.project.domain.EmpProject;
import com.neuron.spring.project.domain.Employee;
import com.neuron.spring.project.domain.PageInfo;
import com.neuron.spring.project.domain.Project;
import com.neuron.spring.project.domain.ProjectCalendar;
import com.neuron.spring.project.domain.ProjectMember;
import com.neuron.spring.project.domain.ProjectTask;
import com.neuron.spring.project.domain.ProjectTaskDetail;
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
	public List<ProjectMember> selectSearchMemberList(PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		List<ProjectMember> memberList = sqlSession.selectList("projectMapper.selectSearchMemberList", pi, rowBounds);
		return memberList;
	}

	@Override
	public int selectListCount(int projectNo) {
		int count = sqlSession.selectOne("projectMapper.selectListCount", projectNo);
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

	@Override
	public int insertProjectCalendarEvent(ProjectCalendar pCalendar) {
		int result = sqlSession.insert("projectMapper.insertProjectEvent", pCalendar);
		return result;
	}

	@Override
	public ProjectCalendar selectProjectEventDetail(Map<String, Object> map) {
		ProjectCalendar eventDetail = sqlSession.selectOne("projectMapper.selectProjectEventDetail", map);
		return eventDetail;
	}

	@Override
	public int updateProjectCalendarEvent(ProjectCalendar pCalendar) {
		int result = sqlSession.update("projectMapper.updateProjectEvent", pCalendar);
		return result;
	}

	@Override
	public int deleteProjectCalendarEvent(ProjectCalendar pCalendar) {
		int result = sqlSession.delete("projectMapper.deleteProjectEvent", pCalendar);
		return result;
	}

	@Override
	public List<ProjectMember> selectTaskProjectSearchList(Map<String, Object> map) {
		List<ProjectMember> eList = sqlSession.selectList("projectMapper.selectTaskMemberSearchList", map);
		return eList;
	}

	@Override
	public int updateProjectMember(Map<String, Object> map) {
		int result = sqlSession.update("projectMapper.updateProjectMember", map);
		return result;
	}

	@Override
	public int deleteProjectRequest(int projectNo) {
		int result = sqlSession.update("projectMapper.deleteProjectRequest", projectNo);
		return result;
	}

	@Override
	public int insertMainWork(Map<String, Object> map) {
		int mainWorkResult = sqlSession.insert("projectMapper.insertMainWork", map);
		return mainWorkResult;
	}

	@Override
	public ProjectTask selectTask(int projectNo) {
		ProjectTask task = sqlSession.selectOne("projectMapper.selectTask", projectNo);
		return task;
	}

	@Override
	public int deleteMainWork(Map<String, Object> map) {
		int result = sqlSession.delete("projectMapper.deleteMainWork", map);
		return result;
	}

	@Override
	public List<ProjectMember> selectMemberAllList(PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		List<ProjectMember> pList = sqlSession.selectList("projectMapper.selectMemberAllList", pi, rowBounds);
		return pList;
	}

	@Override
	public int getSearchListCount(Map<String, Object> map) {
		int totalCount = sqlSession.selectOne("projectMapper.searchListCount", map);
		return totalCount;
	}

	@Override
	public int insertProjectTaskDetail(Map<String, Object> map) {
		int result = sqlSession.insert("projectMapper.insertTaskDetail", map);
		return result;
	}

	@Override
	public List<ProjectTaskDetail> selectProjectTaskDetail(Map<String, Object> map) {
		List<ProjectTaskDetail> taskDetail = sqlSession.selectList("projectMapper.selectTaskDetail", map);
		return taskDetail;
	}

	@Override
	public int selectTaskTotalCount(int taskDetailCountNo) {
		int totalCount = sqlSession.selectOne("projectMapper.selectTaskDetailTotalCount", taskDetailCountNo);
		return totalCount;
	}

	@Override
	public int selectTaskComepleteCount(Map<String, Object> countMap) {
		int totalCount = sqlSession.selectOne("projectMapper.selectTaskDetailCompleteCount", countMap);
		return totalCount;
	}

	@Override
	public List<ProjectMember> selectTaskMemberList(Map<String, Object> map) {
		List<ProjectMember> memberList = sqlSession.selectList("projectMapper.selectTaskDetailMemberList", map);
		return memberList;
	}

	@Override
	public int successDetailTask(Map<String, Object> map) {
		int result = sqlSession.update("projectMapper.successDetailTask", map);
		return result;
	}

	@Override
	public int selectMainWorkTotalCount(Map<String, Object> map) {
		int result = sqlSession.selectOne("projectMapper.selectMainWorkTotalCount", map);
		return result;
	}

	@Override
	public int selectMainWorkCompleteCount(Map<String, Object> map) {
		int result = sqlSession.selectOne("projectMapper.selectMainWorkCompleteCount", map);
		return result;
	}

	@Override
	public int updateMainWorkProcessivity(Map<String, Object> map) {
		int result = sqlSession.update("projectMapper.updateMainWorkProcessivity", map);
		return result;
	}

	@Override
	public int deleteTaskDetail(Map<String, Object> map) {
		int result = sqlSession.delete("projectMapper.deleteTaskDetail", map);
		return result;
	}

	@Override
	public ProjectTaskDetail selectTaskDetail(Map<String, Object> map) {
		ProjectTaskDetail taskDetail = sqlSession.selectOne("projectMapper.selectProjectTaskDetail", map);
		return taskDetail;
	}

	@Override
	public int updateMainWork(Map<String, Object> map) {
		int result = sqlSession.update("projectMapper.updateMainWork", map);
		return result;
	}



}
