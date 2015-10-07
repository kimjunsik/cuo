package cuo.web.memberAdmin.vo;
/*id VARCHAR2(20) PRIMARY KEY,
	name VARCHAR2(12),
	passwd VARCHAR2(12) NOT NULL,
	addr VARCHAR2(100),
	birthday DATE,
	grade VARCHAR2(12)*/
public class MemberAdmin {
	private String id;
	private String name;
	private String passwd;
	private String addr;
	private String birthday;
	private String grade;
	
	public MemberAdmin() {
		// TODO Auto-generated constructor stub
	}
	
	public MemberAdmin(String id, String name, String passwd, String addr, String birthday, String grade) {
		super();
		this.id = id;
		this.name = name;
		this.passwd = passwd;
		this.addr = addr;
		this.birthday = birthday;
		this.grade = grade;
	}

	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	
	public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
}
