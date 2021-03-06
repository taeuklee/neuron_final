package com.neuron.spring.project.store;

import java.util.List;
import java.util.Map;

import com.neuron.spring.project.domain.EmpProject;
import com.neuron.spring.project.domain.Employee;
import com.neuron.spring.project.domain.PageInfo;
import com.neuron.spring.project.domain.Project;
import com.neuron.spring.project.domain.ProjectCalendar;
import com.neuron.spring.project.domain.ProjectMember;
import com.neuron.spring.project.domain.ProjectTask;
import com.neuron.spring.project.domain.ProjectTaskDetail;

public interface ProjectStore {

	public List<Employee> selectInsertProjectSearchList(Map<String, Object> map);

	public int insertProjectRegister(Project project);

	public int insertProjectMemberList(Map<String, Object> map);

	public Project selectProjectOne(Project project);

	public List<Project> selectProjectList(Map<String, Object> map);

	public List<EmpProject> selectMemberProjectList(Map<String, Object> map);

	public Project selectProjectOne(int projectNo);

	public Employee selectMaster(int masterEmpNo);

	public List<ProjectMember> selectMemberList(int projectNo);

	public ProjectTask selectProjectTask(int projectNo);

	public List<ProjectCalendar> selectProjectCalendar(int projectNo);

	public List<ProjectMember> selectSearchMemberList(PageInfo pi);

	public int selectListCount(int projectNo);

	public int deleteMemberList(Map<String, Object> map);

	public List<Employee> selectInviteList(Map<String, Object> map);

	public int insertProjectCalendarEvent(ProjectCalendar pCalendar);

	public ProjectCalendar selectProjectEventDetail(Map<String, Object> map);

	public int updateProjectCalendarEvent(ProjectCalendar pCalendar);

	public int deleteProjectCalendarEvent(ProjectCalendar pCalendar);

	public List<ProjectMember> selectTaskProjectSearchList(Map<String, Object> map);

	public int updateProjectMember(Map<String, Object> map);

	public int deleteProjectRequest(int projectNo);

	public int insertMainWork(Map<String, Object> map);

	public ProjectTask selectTask(int projectNo);

	public int deleteMainWork(Map<String, Object> map);

	public List<ProjectMember> selectMemberAllList(PageInfo pi);

	public int getSearchListCount(Map<String, Object> map);

	public int insertProjectTaskDetail(Map<String, Object> map);

	public List<ProjectTaskDetail> selectProjectTaskDetail(Map<String, Object> map);

	public int selectTaskTotalCount(int taskDetailCountNo);

	public int selectTaskComepleteCount(Map<String, Object> countMap);

	public List<ProjectMember> selectTaskMemberList(Map<String, Object> map);

	public int successDetailTask(Map<String, Object> map);

	public int selectMainWorkTotalCount(Map<String, Object> map);

	public int selectMainWorkCompleteCount(Map<String, Object> map);

	public int updateMainWorkProcessivity(Map<String, Object> map);

	public int deleteTaskDetail(Map<String, Object> map);

	public ProjectTaskDetail selectTaskDetail(Map<String, Object> map);

	public int updateMainWork(Map<String, Object> map);
}
