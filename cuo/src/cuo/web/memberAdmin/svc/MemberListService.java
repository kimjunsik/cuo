package cuo.web.memberAdmin.svc;

import static cuo.util.JdbcUtil.*;

import java.sql.Connection;
import java.util.ArrayList;

import cuo.web.memberAdmin.dao.MemberDAO;
import cuo.web.memberAdmin.vo.MemberAdmin;

public class MemberListService {

	public ArrayList<MemberAdmin> getMemberList() {
		// TODO Auto-generated method stub
		Connection con = getConnection();
		MemberDAO memberDAO = MemberDAO.getInstance();
		memberDAO.setConnection(con);
		
		ArrayList<MemberAdmin> memberList = memberDAO.selectMemberList();
		close(con);
		return memberList;
	}

}
