package cuo.web.login.svc;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cuo.web.login.dao.LoginDAO;
@Service
public class IdCheckService {
	@Autowired
	private LoginDAO loginDAO;
	
	public boolean existsId(String id) {
		// TODO Auto-generated method stub
		
		boolean idExists = false;
		int idCount = loginDAO.selectIdCount(id);
		if(idCount > 0){
			idExists = true;
		}
		return idExists;
	}

}
