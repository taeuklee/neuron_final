package com.neuron.spring.employee.service.logic;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

// import org.apache.commons.mail.HtmlEmail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.neuron.spring.employee.domain.Employee;
import com.neuron.spring.employee.domain.PageInfo;
import com.neuron.spring.employee.domain.Search;
import com.neuron.spring.employee.service.EmployeeService;
import com.neuron.spring.employee.store.EmployeeStore;

@Service
public class EmployeeSerivceImpl implements EmployeeService{
	
	@Autowired
	private EmployeeStore store;

	@Override
	public Employee loginEmp(Employee empOne) {
		Employee eOne = store.selectEmp(empOne);
		return eOne;
	}

	@Override
	public int registerEmp(Employee employee) {
		int result = store.insertEmp(employee);
		return result;
	}


	@Override
	public int modifyEmpInfo(Employee emp) {
		int result = store.updateEmpInfo(emp);
		return result;
	}


	@Override
	public List<Employee> printAllEmp() {
		List<Employee> eList = store.selectAllEmp();
		return eList;
	}

	@Override
	public Employee printOneEmp(int eNo) {
		Employee employee = store.selectOneEmp(eNo);
		return employee;
	}

	@Override
	public int modifyEmpAdmin(Employee employee) {
		int result = store.updateEmpAdmin(employee);
		return result;
	}

	@Override
	public List<Employee> printSearchAll(Search search) {
		List<Employee> searchList = store.selectSearchAll(search);
		return searchList;
	}

	@Override
	public int getListCount() {
		int totalCount = store.selectListCount();
		return totalCount;
	}

	@Override
	public List<Employee> printAll(PageInfo pi) {
		List<Employee> eList = store.selectAll(pi);
		return eList;
	}

//	@Override
//	public void sendEmail(Employee employee, String div) throws Exception {
//		// Mail Server 설정
//		String charSet = "utf-8";
//		String hostSMTP = "smtp.naver.com";
//		String hostSMTPid = "goodjoice@naver.com";
//		String hostSMTPpwd = "Wydakf27*!";
//
//		// 보내는 사람 EMail, 제목, 내용
//		String fromEmail = "goodjoice@naver.com";
//		String fromName = "뉴런";
//		String subject = "뉴런";
//		String msg = "변경된 비밀 번호 입니다";
//
//		if(div.equals("findpw")) {
//			subject = "임시 비밀번호 입니다.";
//			msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
//			msg += "<h3 style='color: blue;'>";
//			msg += employee.getEmpId() + "님의 임시 비밀번호 입니다. 비밀번호를 변경하여 사용하세요.</h3>";
//			msg += "<p>임시 비밀번호 : ";
//			msg += employee.getEmpPwd() + "</p></div>";
//		}
//
//		// 받는 사람 E-Mail 주소
//		String mail = employee.getEmpEmail();
//		try {
//			HtmlEmail email = new HtmlEmail();
//			email.setDebug(true);
//			email.setCharset(charSet);
//			email.setSSL(true);
//			email.setHostName(hostSMTP);
//			email.setSmtpPort(465); //네이버 이용시 587
//
//			email.setAuthentication(hostSMTPid, hostSMTPpwd);
//			email.setTLS(true);
//			email.addTo(mail, charSet);
//			email.setFrom(fromEmail, fromName, charSet);
//			email.setSubject(subject);
//			email.setHtmlMsg(msg);
//			email.send();
//		} catch (Exception e) {
//			System.out.println("메일발송 실패 : " + e);
//		}
//	}
//
//	//비밀번호찾기
//	@Override
//	public void findPwd(HttpServletResponse response, Employee employee) {
//		response.setContentType("text/html;charset=utf-8");
//		Employee ck = store.selectEmp(employee.getEmpId());
//		PrintWriter out = response.getWriter();
//		// 가입된 아이디가 없으면
//		if(store.idCheck(employee.getEmpId()) == null) {
//			out.print("등록되지 않은 아이디입니다.");
//			out.close();
//		}
//		// 가입된 이메일이 아니면
//		if(!employee.getEmpEmail().equals(ck.getEmpEmail())) {
//			out.print("등록되지 않은 이메일입니다.");
//			out.close();
//		}else {
//			// 임시 비밀번호 생성
//			String pwd = "";
//			for (int i = 0; i < 12; i++) {
//				pwd+= (char) ((Math.random() * 26) + 97);
//			}
//			employee.setEmpPwd(pwd);
//			// 비밀번호 변경
//			store.updateEmpPwd(employee);
//			// 비밀번호 변경 메일 발송
//			sendEmail(employee, "findPwd");
//
//			out.print("이메일로 임시 비밀번호를 발송하였습니다.");
//			out.close();
//		}
//	}


}
