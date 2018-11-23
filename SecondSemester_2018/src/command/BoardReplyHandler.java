package command;

import static jdbc.JdbcUtil.*;
import java.io.PrintWriter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Connection;

import Board.Dao.BoardDao;
import Board.model.*;

public class BoardReplyHandler implements CommandHandler {

	@Override
	public ActionForward process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		String nowPage = request.getParameter("pageNo");
		int board_num = Integer.parseInt(request.getParameter("no"));

		Board_Reply reply = new Board_Reply();
		reply.setBoard_no(Integer.parseInt(request.getParameter("no")));
		reply.setMem_name(request.getParameter("name"));
		reply.setContent(request.getParameter("content"));
		reply.setPass(request.getParameter("pass"));
		reply.setIp(request.getRemoteAddr());
		boolean isReplySuccess = replyArticle(reply);

		if (isReplySuccess) {
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("read.board?no=" + board_num + "&pageNo=" + nowPage);
		} else {
			response.setContentType("text/html;charset=euc-kr");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('실패')");
			out.println("history.back()");
			out.println("</script>");
		}
		return forward;
	}

	public boolean replyArticle(Board_Reply reply) throws Exception {
		boolean isReplySuccess = false;
		Connection con = getConnection();
		BoardDao boardDAO = BoardDao.getInstance();
		boardDAO.setConnection(con);
		isReplySuccess = boardDAO.insertReplyArticle(reply);
		if (isReplySuccess == true) {
			int updateCount = boardDAO.replyUpBoardCount(reply.getBoard_no());
			if (updateCount > 0) {
				commit(con);
			} else {
				rollback(con);
			}
			isReplySuccess = true;
		} else {
			rollback(con);
		}
		close(con);
		return isReplySuccess;
	}
}
