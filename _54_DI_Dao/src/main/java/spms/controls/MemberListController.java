package spms.controls;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import spms.dao.MemberDao;
import spms.vo.Member;

public class MemberListController implements Controller{
	
	MemberDao memberDao;
	
	public MemberListController setMemberDao(MemberDao memberDao) {
		this.memberDao = memberDao;
		return this;
		
	}
	
	@Override
	public String execute(Map<String, Object> model) throws Exception {
		System.out.println("MemberListSController::execute() 호출");
		
		
		//MemberDao memberDao = (MemberDao)model.get("memberDao");
		
		// request 공간 대신 model에 저장한다.
		model.put("members", memberDao.selectList());
		
		// redirect나 이동할 jsp 경로를 리턴한다
		return "/member/MemberList.jsp";
	}
		
	
}











