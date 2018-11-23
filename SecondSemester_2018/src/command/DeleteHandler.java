package command;

import static jdbc.JdbcUtil.*;
import java.sql.Connection;
import java.io.PrintWriter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Board.Dao.BoardDao;

public class DeleteHandler implements CommandHandler {
	public ActionForward process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		int board_num = Integer.parseInt(request.getParameter("no"));
		String nowPage = request.getParameter("pageNo");
		boolean isArticleWriter = isArticleWriter(board_num, request.getParameter("pass"));
		if (!isArticleWriter) {
			response.setContentType("text/html;charset=euc-kr");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('삭제할 권한이 없습니다');");
			out.println("history.back();");
			out.println("</script>");
			out.close();
		} else {
			boolean isDeleteSuccess = removeArticle(board_num);
			if (!isDeleteSuccess) {
				response.setContentType("text/html;charset=euc-kr");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('삭제실패');");
				out.println("history.back();");
				out.println("</script>");
				out.close();
			} else {
				forward = new ActionForward();
				forward.setRedirect(true);
				forward.setPath("boardList.bo?page=" + nowPage);
			}
		}
		return forward;
	}

	public boolean isArticleWriter(int board_num, String pass) throws Exception {
		boolean isArticleWriter = false;
		Connection con = getConnection();
		BoardDao boardDAO = BoardDao.getInstance();
		boardDAO.setConnection(con);
		isArticleWriter = boardDAO.isArticleBoardWriter(board_num, pass);
		close(con);
		return isArticleWriter;
	}

	public boolean removeArticle(int board_num) throws Exception {
		boolean isRemoveSuccess = false;
		Connection con = getConnection();
		BoardDao boardDAO = BoardDao.getInstance();
		boardDAO.setConnection(con);
		int deleteCount = boardDAO.deleteArticle(board_num);
		if (deleteCount > 0) {
			commit(con);
			isRemoveSuccess = true;
		} else {
			rollback(con);
		}
		close(con);
		return isRemoveSuccess;
	}
}