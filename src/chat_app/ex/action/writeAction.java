package chat_app.ex.action;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import chat.app.ex.model.BoardBean;
import chat.app.ex.model.BoardDAO;

public class writeAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		BoardDAO dao = BoardDAO.getInstance();
		BoardBean bean = new BoardBean();
		bean.setTitle(request.getParameter("title"));
		bean.setContent(request.getParameter("content"));
		
		HttpSession session = request.getSession();
		String nick = (String) session.getAttribute("nick");
		bean.setNick(nick);
		// 조회수를 나타내는 click을 set 해주는 매소드를 추가해야한다.
		
		//현재시간을 str에 저장하여 bean객체에 set해준다
		SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date time = new Date();
		String str = format1.format(time);
		bean.setDate(str);
		
		String rel = "";
		bean.setClick("0");
		boolean result = dao.InsertBoard(bean);
		if(result) {
			rel = "sucess";
		}else {
			rel = "fail";
		}
		
		// 결과를 jsp에 넘겨준다
		request.setAttribute("result", rel);
		ServletContext context = request.getSession().getServletContext();
		RequestDispatcher dispatcher = context.getRequestDispatcher("/writeOK.jsp");
		dispatcher.forward(request, response);
	}

}
