package command;

import static jdbc.JdbcUtil.close;
import static jdbc.JdbcUtil.commit;
import static jdbc.JdbcUtil.getConnection;
import static jdbc.JdbcUtil.rollback;

import java.io.PrintWriter;
import java.sql.Connection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import Board.Dao.BoardDao;
import Board.model.BoardBean;

public class ModifyHandler implements CommandHandler {
	public ActionForward process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		ReadHandler board = new ReadHandler();
		boolean isModifySuccess = false;
		String realFolder = "";
		String saveFolder = "test";
		// 기본으로 설정 된 최대 file size
		int fileSize = 5 * 1024 * 1024; // 5MB
		realFolder = request.getRealPath(saveFolder);
		String filename = "";
		// file이 수정되는 경우에 변경 될 file size
		int filesize = 0;
		try {
			MultipartRequest multi = null;
			multi = new MultipartRequest(request, realFolder, fileSize, "euc-kr", new DefaultFileRenamePolicy());
			int board_num = Integer.parseInt(multi.getParameter("no"));
			int page = Integer.parseInt(multi.getParameter("pageNo"));
			BoardBean article = board.getArticle(board_num);
			article.setContent(multi.getParameter("content"));
			article.setTitle(multi.getParameter("title"));
			article.setIp(request.getRemoteAddr());
			if (multi.getFilesystemName("filename2") != null) {
				// filename이 업데이트 되는 값이 있다면 file이름을 수정한다.
				filename = multi.getFilesystemName("filename2");
				// file을 수정 한 경우에는  file size가 수정 되어야 한다.
				filesize = (int) multi.getFile("filename2").length();
				article.setFilename(filename);
				article.setFilesize(filesize);
			}
			isModifySuccess = modifyArticle(article);
			if (!isModifySuccess) {
				response.setContentType("text/html;charset=euc-kr");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('수정실패');");
				out.println("history.back()");
				out.println("</script>");
			} else {
				forward = new ActionForward();
				forward.setRedirect(true);
				forward.setPath("read.board?no=" + board_num + "&pageNo=" + page);
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return forward;
	}

	public boolean modifyArticle(BoardBean article) throws Exception {
		// TODO Auto-generated method stub
		boolean isModifySuccess = false;
		Connection con = getConnection();
		BoardDao boardDao = BoardDao.getInstance();
		boardDao.setConnection(con);
		int updateCount = boardDao.updateArticle(article);
		if (updateCount > 0) {
			commit(con);
			isModifySuccess = true;
		} else {
			rollback(con);
		}
		close(con);
		return isModifySuccess;
	}
}