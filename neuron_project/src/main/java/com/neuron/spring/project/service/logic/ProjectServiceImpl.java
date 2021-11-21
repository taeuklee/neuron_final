package com.neuron.spring.project.service.logic;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.neuron.spring.empCalendar.domain.EmpCalendar;
import com.neuron.spring.project.domain.EmpProject;
import com.neuron.spring.project.domain.Employee;
import com.neuron.spring.project.domain.PageInfo;
import com.neuron.spring.project.domain.Project;
import com.neuron.spring.project.domain.ProjectCalendar;
import com.neuron.spring.project.domain.ProjectMember;
import com.neuron.spring.project.domain.ProjectTask;
import com.neuron.spring.project.domain.ProjectTaskDetail;
import com.neuron.spring.project.service.ProjectService;
import com.neuron.spring.project.store.ProjectStore;


@Service
public class ProjectServiceImpl implements ProjectService{

	@Autowired
	private ProjectStore store;

	@Override
	public List<Employee> selectInsertProjectSearchList(Map<String, Object> map) {
		List<Employee> eList = store.selectInsertProjectSearchList(map);
		return eList;	
	}

	@Override
	public int insertProjectRegister(Project project) {
		int result = store.insertProjectRegister(project);
		return result;
	}

	@Override
	public int insertProjectMemberList(Map<String, Object> map) {
		int result = store.insertProjectMemberList(map);
		return result;
	}

	@Override
	public Project selectProjectOne(Project project) {
		Project newProject = store.selectProjectOne(project);
		return newProject;
	}

	@Override
	public List<Project> selectProjectList(Map<String, Object> map) {
		List<Project> projectList = store.selectProjectList(map);
		return projectList;
	}

	@Override
	public List<EmpProject> selectMemberProjectList(Map<String, Object> map) {
		List<EmpProject> projectList = store.selectMemberProjectList(map);
		return projectList;
	}

	@Override
	public Project selectProject(int projectNo) {
		Project project = store.selectProjectOne(projectNo);
		return project;
	}

	@Override
	public Employee selectMaster(int masterEmpNo) {
		Employee master = store.selectMaster(masterEmpNo);
		return master;
	}

	@Override
	public List<ProjectMember> selectMemberList(int projectNo) {
		List<ProjectMember> memberList = store.selectMemberList(projectNo);
		return memberList;
	}

	@Override
	public ProjectTask selectProjectTask(int projectNo) {
		ProjectTask projectTask = store.selectProjectTask(projectNo);
		return projectTask;
	}

	@Override
	public List<ProjectCalendar> selectProjectCalendar(int projectNo) {
		List<ProjectCalendar> projectCalendar = store.selectProjectCalendar(projectNo);
		return projectCalendar;
	}

	@Override
	public List<ProjectMember> selectSearchMemberList(PageInfo pi) {
		List<ProjectMember> memberList = store.selectSearchMemberList(pi);
		return memberList;
	}

	@Override
	public int getListCount(int projectNo) {
		int totalCount = store.selectListCount(projectNo);
		return totalCount;
	}

	@Override
	public int deleteMemberList(Map<String, Object> map) {
		int result = store.deleteMemberList(map);
		return result;
	}

	@Override
	public List<Employee> selectInviteList(Map<String, Object> map) {
		List<Employee> eList = store.selectInviteList(map);
		return eList;
	}

	@Override
	public int insertProjectCalendarEvent(ProjectCalendar pCalendar) {
		int result = store.insertProjectCalendarEvent(pCalendar);
		return result;	
	}

	@Override
	public ProjectCalendar selectProjectEventDetail(Map<String, Object> map) {
		ProjectCalendar eventDetail = store.selectProjectEventDetail(map);
		return eventDetail;
	}

	@Override
	public int updateProjectCalendarEvent(ProjectCalendar pCalendar) {
		int result = store.updateProjectCalendarEvent(pCalendar);
		return result;
	}

	@Override
	public int deleteProjectCalendarEvent(ProjectCalendar pCalendar) {
		int result = store.deleteProjectCalendarEvent(pCalendar);
		return result;
	}

	@Override
	public List<ProjectMember> selectTaskProjectSearchList(Map<String, Object> map) {
		List<ProjectMember> eList = store.selectTaskProjectSearchList(map);
		return eList;
	}

	@Override
	public int updateProjectMember(Map<String, Object> map) {
		int result = store.updateProjectMember(map);
		return result;
	}

	@Override
	public int deleteProjectRequest(int projectNo) {
		int result = store.deleteProjectRequest(projectNo);
		return result;
	}

	@Override
	public int insertMainWork(Map<String, Object> map) {
		int mainWorkResult = store.insertMainWork(map);
		return mainWorkResult;
	}

	@Override
	public ProjectTask selectTask(int projectNo) {
		ProjectTask task = store.selectTask(projectNo);
		return task;
	}

	@Override
	public int deleteMainWork(int projectNo) {
		int result = store.deleteMainWork(projectNo);
		return result;
	}

	@Override
	public List<ProjectMember> selectMemberAllList(PageInfo pi) {
		List<ProjectMember> pList = store.selectMemberAllList(pi);
		return pList;
	}

	@Override
	public int getSearchListCount(Map<String, Object> map) {
		int totalCount = store.getSearchListCount(map);
		return totalCount;
	}

	@Override
	public int insertProjectTaskDetail(Map<String, Object> map) {
		int result = store.insertProjectTaskDetail(map);
		return result;
	}

	@Override
	public List<ProjectTaskDetail> selectProjectTaskDetail(Map<String, Object> map) {
		List<ProjectTaskDetail> taskDetail = store.selectProjectTaskDetail(map);
		return taskDetail;
	}

	@Override
	public int taskDetailTotalCount(int taskDetailCountNo) {
		int taskDetailTotalCount = store.selectTaskTotalCount(taskDetailCountNo);
		return taskDetailTotalCount;
	}

	@Override
	public int taskDetailCompleteCount(Map<String, Object> countMap) {
		int taskDetailCompleteCount = store.selectTaskComepleteCount(countMap);
		return taskDetailCompleteCount;
	}

	@Override
	public List<ProjectMember> selectTaskMemberList(Map<String, Object> map) {
		List<ProjectMember> memberList = store.selectTaskMemberList(map);
		return memberList;
	}

	@Override
	public int successDetailTask(Map<String, Object> map) {
		int result = store.successDetailTask(map);
		return result;
	}

	@Override
	public int taskTotalCount(Map<String, Object> map) {
		int result = store.selectMainWorkTotalCount(map);
		return result;
	}

	@Override
	public int mainWorkDetailCompleteCount(Map<String, Object> map) {
		int result = store.selectMainWorkCompleteCount(map);
		return result;
	}

	@Override
	public int updateMainWorkProcessivity(Map<String, Object> map) {
		int result = store.updateMainWorkProcessivity(map);
		return result;
	}




}
