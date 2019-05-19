package chat_app.ex.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import chat.app.ex.model.MemberBean;
import chat.app.ex.model.MemberDAO;

public class signupAction implements Action {
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException  {
		MemberDAO dao = MemberDAO.getInstance();
		MemberBean bean = new MemberBean();
		bean.setEmail(request.getParameter("email"));
		bean.setPwd(request.getParameter("pwd"));
		bean.setNick(request.getParameter("nick"));

		
		boolean result = dao.InsertMember(bean);
		String rel = "";
		if(result)
			rel = "sucess";
		else
			rel = "fail";
		// result를 jsp에 넘겨준다.
		request.setAttribute("result", rel);
		ServletContext context = request.getSession().getServletContext();
		RequestDispatcher dispatcher = context.getRequestDispatcher("/signup.jsp");
		dispatcher.forward(request, response);
		
	}
}
