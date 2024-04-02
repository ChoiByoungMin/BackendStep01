package spms.controls;

import java.util.Map;

import spms.dao.MemberDao;

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











