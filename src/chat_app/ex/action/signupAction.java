package chat_app.ex.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import chat.app.ex.model.MemberBean;
import chat.app.ex.model.MemberDAO;

public class signupAction implements Action {
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberDAO dao = MemberDAO.getInstance();
		MemberBean bean = new MemberBean();
		bean.setEmail(request.getParameter("email"));
		bean.setPwd(request.getParameter("pwd"));
		bean.setNick(request.getParameter("nick"));

		boolean result = dao.InsertMember(bean);
		String rel = "";
		if (result)
			rel = "sucess"; // sucess
		else {
			rel = overlap(dao, bean); // fail
		}
		// result를 jsp에 넘겨준다.
		request.setAttribute("result", rel);
		ServletContext context = request.getSession().getServletContext();
		RequestDispatcher dispatcher = context.getRequestDispatcher("/signupOK.jsp");
		dispatcher.forward(request, response);

	}

	// 중복처리 method 구현
	private String overlap(MemberDAO dao, MemberBean bean) {
		List<MemberBean> list = dao.getList();
		int index = 0;
		while(!list.isEmpty()) {
			MemberBean dto = list.get(index++);
			if(bean.getEmail().equals(dto.getEmail())) {
				return "email";
			}else if(bean.getNick().equals(dto.getNick())) {
				return "nick";
			}
		}
		return "fail";
	}
}
