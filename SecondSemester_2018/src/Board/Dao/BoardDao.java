package Board.Dao;

import static jdbc.JdbcUtil.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.ArrayList;
import javax.sql.DataSource;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.PageContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Board.model.BoardBean;
import Board.model.Board_Reply;

public class BoardDao {
	private static final String SAVEFOLDER = "DBConnect";
	Connection con;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql;
	DataSource ds;

	private static BoardDao boardDAO;

	public static BoardDao getInstance() {
		if (boardDAO == null)
			boardDAO = new BoardDao();

		return boardDAO;
	}

	public void setConnection(Connection con) {
		this.con = con;
	}

	public boolean insert(BoardBean board) {
		int num = 0;
		String sql = "";
		int insertCount = 0;
		try {
			con = getConnection();
			pstmt = con.prepareStatement("select max(idx) from board");
			rs = pstmt.executeQuery();
			if (rs.next())
				num = rs.getInt(1) + 1;
			else
				num = 1;

			sql = "insert into board(mem_name, content, title, replycount, "
					+ "reg_date, pass,count,ip,filename,filesize) " + "values(?,?,?,0,now(),?,0,?,?,?)";
			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, board.getName());
			pstmt.setString(2, board.getContent());
			pstmt.setString(3, board.getTitle());
			pstmt.setString(4, board.getPass());
			pstmt.setString(5, board.getIp());
			pstmt.setString(6, board.getFilename());
			pstmt.setInt(7, board.getFilesize());

			insertCount = pstmt.executeUpdate();

			if (insertCount > 0) {
				commit(con);
				return true;
			} else {
				rollback(con);
			}
		} catch (Exception ex) {
			System.out.println("에러 : " + ex);
		} finally {
			close(rs);
			close(pstmt);
		}
		return false;
	}

	// 글의 개수 구하기.
	public int selectListCount() {
		int listCount = 0;
		try {
			System.out.println("connection");
			con = getConnection();
			pstmt = con.prepareStatement("select count(*) from board");
			rs = pstmt.executeQuery();
			if (rs.next()) {
				listCount = rs.getInt(1);
			}
		} catch (Exception ex) {
			System.out.println("getListCount 에러: " + ex);
		} finally {
			close(rs);
			close(pstmt);
		}
		return listCount;
	}

	// 글 목록 보기.
	public List<BoardBean> selectBorad(int page, int limit, String keyWord, String keyField) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String board_list_sql = "";
		List<BoardBean> articleList = new ArrayList<BoardBean>();
		BoardBean board = null;
		int startrow = page; // 읽기 시작할 row 번호..
		try {
			if (keyWord.equals("null") || keyWord.equals("")) {
				board_list_sql = "select * from board order by idx desc limit ?,10";
				pstmt = con.prepareStatement(board_list_sql);
				pstmt.setInt(1, startrow);
			} else {
				board_list_sql = "select * from board where " + keyField + " like ? order by idx desc limit ?,10";
				pstmt = con.prepareStatement(board_list_sql);
				pstmt.setString(1, "%" + keyWord + "%");
				pstmt.setInt(2, startrow);
			}
			rs = pstmt.executeQuery();
			while (rs.next()) {
				board = new BoardBean();
				board.setIdx(rs.getInt("idx"));
				board.setName(rs.getString("mem_name"));
				board.setTitle(rs.getString("title"));
				board.setReplycount(rs.getInt("replycount"));
				board.setReg_date(rs.getString("reg_date"));
				board.setReplycount(rs.getInt("replycount"));
				board.setCount(rs.getInt("count"));
				articleList.add(board);
			}
		} catch (Exception ex) {
			System.out.println("getBoardList 에러 : " + ex);
		} finally {
			close(rs);
			close(pstmt);
		}
		return articleList;
	}

}
