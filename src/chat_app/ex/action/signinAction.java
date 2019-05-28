package chat_app.ex.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import chat.app.ex.model.MemberBean;
import chat.app.ex.model.MemberDAO;
import chat.app.ex.model.SecurityUtil;

public class signinAction implements Action{
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		MemberDAO dao = MemberDAO.getInstance();
		SecurityUtil sec = new SecurityUtil();
		request.setCharacterEncoding("UTF-8");
		String email = request.getParameter("email");
		String pw = request.getParameter("pwd");
		
		String rel = "";
		List<MemberBean> list = dao.getList();
		
		for(int i=0; i < list.size(); i++) {
			MemberBean bean = list.get(i);
			// salt값을 받아서 입력한 password를 암호화
			String salt = bean.getSalt();
			String pwd = sec.encryptSHA256(pw, salt);
			
			// 입력한 email과 password가 일치할 때
			if(bean.getEmail().equals(email) && bean.getPwd().equals(pwd)) {
				// 세션에 로그인 정보를 추가
				String nick = bean.getNick();
				HttpSession session = request.getSession();
				session.setAttribute("nick", nick);
				
				rel = "sucess";
				break;
			}
			
		}
		if(!rel.equals("sucess"))
			rel="fail";
		
		// 이메일 인증 결과를 페이지에 전달
		request.setAttribute("login", rel);
		ServletContext context = request.getSession().getServletContext();
		RequestDispatcher dispatcher = context.getRequestDispatcher("/signinOK.jsp");
		dispatcher.forward(request, response);
	}

}
