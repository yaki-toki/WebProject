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
		// 현제 페이지의 값을 저장할 값
		String pageNoVal = request.getParameter("pageNo");
		// 검색하는 값
		String keyWord = request.getParameter("keyWord");
		String keyField = request.getParameter("keyField");
		
		// 항상 페이지는 첫 페이지 이기 때문에 초기화를 1로
		int pageNo = 1;
		String word = "";
		String Field = "";
		
		// 페이지 값이 넘어가면 현제 넘어 간 페이지로 값을 저장
		if (pageNoVal != null) {
			pageNo = Integer.parseInt(pageNoVal);
		}
		
		// 검색 키워드 값을 입력 한 경우 값 변경
		if (keyWord != null) {
			System.out.println("");
			// 검색 키워드 내용
			word = keyWord;
			// 검색 키워드의 필드
			Field = keyField;
		}
		// 현제 페이지 번호와 내용의 키워드, 필드의 값을 PageInfo에 넘김
		PageInfo articlePage = getArticlePage(pageNo, word, Field);
		
		request.setAttribute("articlePage", articlePage);
		ActionForward forward = new ActionForward();
		forward.setPath("/main.jsp?pagefile=./board/list");
		
		//페이지 전환 시키기 위한 forward값을 전달
		return forward;
	}

	public PageInfo getArticlePage(int pageNum, String keyWord, String keyField) {
		try (Connection conn = getConnection()) {
			int total = articleDao.selectListCount();
			List<BoardBean> content = articleDao.selectBorad((pageNum - 1) * size, size, keyWord, keyField);
			
			// 받아 온 값들을 return시킴
			return new PageInfo(total, pageNum, size, content);
			
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
}