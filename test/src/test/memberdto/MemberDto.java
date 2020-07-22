package test.memberdto;

public class MemberDto {
	private String id;
	private String pwd;
	private String nick;
	private String email;
	private String regdate;
	private String newPwd;
	private int isStop;
	public MemberDto() {}
	public MemberDto(String id, String pwd, String nick, String email, String regdate, String newPwd, int isStop) {
		super();
		this.id = id;
		this.pwd = pwd;
		this.nick = nick;
		this.email = email;
		this.regdate = regdate;
		this.newPwd = newPwd;
		this.isStop = isStop;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getNick() {
		return nick;
	}
	public void setNick(String nick) {
		this.nick = nick;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public String getNewPwd() {
		return newPwd;
	}
	public void setNewPwd(String newPwd) {
		this.newPwd = newPwd;
	}
	public int getIsStop() {
		return isStop;
	}
	public void setIsStop(int isStop) {
		this.isStop = isStop;
	}
	
	
}
