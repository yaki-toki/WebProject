package command;

import static jdbc.JdbcUtil.*;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Board.model.BoardBean;
import Board.Dao.BoardDao;

//CommandHandler
public class BoardListHandler implements CommandHandler {
	private BoardDao articleDao = new BoardDao();
	private int size = 10;

	// CommandHandler에 있는 추상화 메소드 구현
	public ActionForward process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String pageNoVal = request.getParameter("pageNo");
		String keyWord = request.getParameter("keyWord");
		String keyField = request.getParameter("keyField");
		int pageNo = 1;
		String word = "";
		String Field = "";
		if (pageNoVal != null) {
			pageNo = Integer.parseInt(pageNoVal);
		}
		if (keyWord != null) {
			System.out.println("");
			word = keyWord;
			Field = keyField;
		}
		PageInfo articlePage = getArticlePage(pageNo, word, Field);
		request.setAttribute("articlePage", articlePage);
		ActionForward forward = new ActionForward();
		forward.setPath("/main.jsp?pagefile=./board/list");
		return forward;
	}

	public PageInfo getArticlePage(int pageNum, String keyWord, String keyField) {
		try (Connection conn = getConnection()) {
			int total = articleDao.selectListCount();
			List<BoardBean> content = articleDao.selectBorad((pageNum - 1) * size, size, keyWord, keyField);
			return new PageInfo(total, pageNum, size, content);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
}