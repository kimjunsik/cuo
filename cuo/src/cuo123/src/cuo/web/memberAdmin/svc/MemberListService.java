package cuo.web.memberAdmin.svc;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cuo.web.memberAdmin.dao.MemberDAO;
import cuo.web.memberAdmin.vo.MemberAdmin;

@Service
public class MemberListService {
	
	@Autowired
	private MemberDAO memberDAO;
	
	public List<MemberAdmin> getMemberList() {
		// TODO Auto-generated method stub
/*		Connection con = getConnection();
		MemberDAO memberDAO = MemberDAO.getInstance();
		memberDAO.setConnection(con);*/	
		
		List<MemberAdmin> memberList = memberDAO.selectMemberList();
		/*close(con);*/
		return memberList;
	}

}
