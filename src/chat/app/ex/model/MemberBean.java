package chat.app.ex.model;

public class MemberBean {
	// DTO class, email, password, nickname을 저장할 변수 선언
	// DB의 변수명과 동일
	private String email;
	private String pwd;
	private String nick;
	private String salt;
	
	// Constructor
	public MemberBean() {
	}

	public MemberBean(String email, String pwd, String nick) {
		this.email = email;
		this.pwd = pwd;
		this.nick = nick;
	}

	// getter, setter 정의
	public String getEmail() {
		return email;
	}

	public String getSalt() {
		return salt;
	}

	public void setSalt(String salt) {
		this.salt = salt;
	}

	public void setEmail(String email) {
		this.email = email;
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

}
