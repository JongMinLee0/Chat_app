package chat.app.ex;

public class MemberBean {
    // DTO class, email, password, nickname을 저장할 변수 선언
	// DB의 변수명과 동일
	private String email;
	private String pwd;
	private String nick;
	
	// getter, setter 정의
	public String getEmail() {
		return email;
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
