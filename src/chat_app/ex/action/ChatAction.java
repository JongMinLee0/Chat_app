package chat_app.ex.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ChatAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		// 세션으로부터 접속해 있는 닉네임을 가져온다.
		String nick = "";
		HttpSession session = request.getSession();
		nick = (String) session.getAttribute("nick");
		
		
		
		
		
	}

}
