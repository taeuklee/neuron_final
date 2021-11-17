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

	public List<ProjectMember> selectSearchMemberList(Map<String, Object> map);

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
}
