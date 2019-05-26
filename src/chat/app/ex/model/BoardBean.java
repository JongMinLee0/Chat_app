package chat.app.ex.model;

public class BoardBean {

	// 제목, 내용, 닉네임, 날짜 생성
	private String title;
	private String content;
	private String nick;
	private String date;
	private String click;

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getNick() {
		return nick;
	}

	public void setNick(String nick) {
		this.nick = nick;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}
	
	public String getClick() {
		return click;
	}
	
	public void setClick(String click) {
		this.click = click;
	}

}
