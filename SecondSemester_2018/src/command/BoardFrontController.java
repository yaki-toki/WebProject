package command;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServlet;

@WebServlet("*.board")
public class BoardFrontController extends HttpServlet {
	protected void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("euc-kr");
		String RequestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = RequestURI.substring(contextPath.length());
		ActionForward forward = null;
		CommandHandler action = null;

		if (command.equals("/Lab2_8_Board/write.board")) {
			forward = new ActionForward();
			forward.setPath("/Lab2_8_Board/main.jsp?pagefile=./board/write");
		} else if (command.equals("/Lab2_8_Board/writePro.board")) {
			action = new WriteHandler();
			try {
				forward = action.process(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/Lab2_8_Board/boardList.board")) {
			action = new BoardListHandler();
			try {
				forward = action.process(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/Lab2_8_Board/read.board")) {
			action = new ReadHandler();
			try {
				forward = action.process(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/Lab2_8_Board/reply.board")) {
			action = new BoardReplyHandler();
			try {
				forward = action.process(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/Lab2_8_Board/modifyPwd.board")) {
			forward = new ActionForward();
			forward.setPath("/Lab2_8_Board/main.jsp?pagefile=./board/PwdCheck");
		} else if (command.equals("/Lab2_8_Board/modifyForm.board")) {
			action = new PwdCheckHandler();
			try {
				forward = action.process(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/Lab2_8_Board/modify.board")) {
			action = new ModifyHandler();
			try {
				forward = action.process(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/Lab2_8_Board/deleteForm.board")) {
			String nowPage = request.getParameter("pageNo");
			request.setAttribute("page", nowPage);
			int board_num = Integer.parseInt(request.getParameter("no"));
			request.setAttribute("board_num", board_num);
			forward = new ActionForward();
			forward.setPath("/main.jsp?pagefile=./board/delete");
		} else if (command.equals("/Lab2_8_Board/delete.board")) {
			action = new DeleteHandler();
			try {
				forward = action.process(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		if (forward != null) {
			if (forward.isRedirect()) {
				response.sendRedirect(forward.getPath());
			} else {
				RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());
				dispatcher.forward(request, response);
			}
		}

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}
}
