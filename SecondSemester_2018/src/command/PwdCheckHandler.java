package command;

import static jdbc.JdbcUtil.close;
import static jdbc.JdbcUtil.getConnection;

import java.io.PrintWriter;
import java.sql.Connection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Board.Dao.BoardDao;
import Board.model.BoardBean;

public class PwdCheckHandler implements CommandHandler {
	public ActionForward process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		int board_num = Integer.parseInt(request.getParameter("no"));
		boolean isRightUser = isArticleWriter(board_num, request.getParameter("pass"));
		if (!isRightUser) {
			response.setContentType("text/html;charset=euc-kr");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('수정할 권한이 없습니다.');");
			out.println("history.back();");
			out.println("</script>");
		} else {
			BoardBean article = getArticle(board_num);
			forward = new ActionForward();
			request.setAttribute("article", article);
			forward.setPath("main.jsp?pagefile=./board/modify");
		}
		return forward;
	}

	public boolean isArticleWriter(int board_num, String pass) throws Exception {
		// TODO Auto-generated method stub
		boolean isArticleWriter = false;
		Connection con = getConnection();
		BoardDao boardDao = BoardDao.getInstance();
		boardDao.setConnection(con);
		isArticleWriter = boardDao.isArticleBoardWriter(board_num, pass);
		close(con);
		return isArticleWriter;
	}

	public BoardBean getArticle(int board_num) throws Exception {
		// TODO Auto-generated method stub
		BoardBean article = null;
		Connection con = getConnection();
		BoardDao boardDAO = BoardDao.getInstance();
		boardDAO.setConnection(con);
		article = boardDAO.selectArticle(board_num);
		close(con);
		return article;
	}
}