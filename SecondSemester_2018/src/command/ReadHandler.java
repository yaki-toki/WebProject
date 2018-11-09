package command;

import static jdbc.JdbcUtil.*;
import java.sql.Connection;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Board.model.BoardBean;
import Board.model.Board_Reply;
import Board.Dao.BoardDao;

public class ReadHandler implements CommandHandler {
	public ActionForward process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int board_num = Integer.parseInt(request.getParameter("no"));
		String page = request.getParameter("pageNo");
		BoardBean article = getArticle(board_num);
		List<Board_Reply> reply = getReplyList(board_num);
		request.setAttribute("reply", reply);
		;
		ActionForward forward = new ActionForward();
		request.setAttribute("page", page);
		request.setAttribute("article", article);
		forward.setPath("main.jsp?pagefile=./board/read");
		return forward;
	}

	public BoardBean getArticle(int board_num) throws Exception {
		// TODO Auto-generated method stub
		BoardBean article = null;
		Connection con = getConnection();
		BoardDao boardDAO = BoardDao.getInstance();
		boardDAO.setConnection(con);
		int updateCount = boardDAO.updateReadCount(board_num);
		if (updateCount > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		article = boardDAO.selectArticle(board_num);
		close(con);
		return article;
	}

	public List<Board_Reply> getReplyList(int board_num) throws Exception {
		List<Board_Reply> ReplyList = null;
		Connection con = getConnection();
		BoardDao boardDAO = BoardDao.getInstance();
		boardDAO.setConnection(con);
		ReplyList = boardDAO.replyBoard(board_num);
		close(con);
		return ReplyList;
	}
}