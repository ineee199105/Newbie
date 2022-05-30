package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import vo.ActionForward;
import vo.Member;

public class SignUpProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		
		ActionForward forward = null;
		Member member = new Member();
		
		member.setId(member.getId());
		member.setPasswd(member.getPasswd());
		member.setAddr(member.getAddr());
		member.setAge(Integer.parseInt(request.getParameter("age")));
		member.setGender(member.getGender());
		member.setName(member.getName());
		member.setNation(member.getNation());
		
	//	SignUpProService signUpProService = new SignUpProService();
		return null;
	}
	
	
}
