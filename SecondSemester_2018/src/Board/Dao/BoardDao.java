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
		// Board에 저장된 값들을 리스트 형태로 만들어서 초기화
		BoardBean board = null;
		int startrow = page; // 읽기 시작할 row 번호 즉, 페이지 번호
		try {
			// 검색 기능
			if (keyWord.equals("null") || keyWord.equals("")) {
				// 검색 조건이 없는 경우 내림 차순(desc)으로 10개씩 출력
				board_list_sql = "select * from board order by idx desc limit ?,10";
				pstmt = con.prepareStatement(board_list_sql);
				pstmt.setInt(1, startrow);
			} else {
				// 검색 조건이 있는 경우
				// keyField : 글쓴이, 제목, 글 내용 등등 검색 키워드가 포함되어 있는 컬럼
				board_list_sql = "select * from board where " + keyField + " like ? order by idx desc limit ?,10";
				pstmt = con.prepareStatement(board_list_sql);
				pstmt.setString(1, "%" + keyWord + "%");
				pstmt.setInt(2, startrow);
			}
			// 쿼리문 실행
			rs = pstmt.executeQuery();

			// while문을 이용해서 각 열의 값들을 받아온다.
			while (rs.next()) {
				// 반복이 시작되면 board를 초기화
				board = new BoardBean();
				board.setIdx(rs.getInt("idx"));
				board.setName(rs.getString("mem_name"));
				board.setTitle(rs.getString("title"));
				board.setReplycount(rs.getInt("replycount"));
				board.setReg_date(rs.getString("reg_date"));
				board.setCount(rs.getInt("count"));

				// 위에서 set한 값들이 저장된 board객체를 articleList에 저장
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

	// 글 내용 보기.
	public BoardBean selectArticle(int board_num) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		BoardBean boardBean = null;
		try {
			pstmt = con.prepareStatement("select * from board where idx= ?");
			pstmt.setInt(1, board_num);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				boardBean = new BoardBean();
				boardBean.setIdx(rs.getInt("idx"));
				boardBean.setName(rs.getString("mem_name"));
				boardBean.setTitle(rs.getString("title"));
				boardBean.setContent(rs.getString("content"));
				boardBean.setReg_date(rs.getString("reg_date"));
				boardBean.setPass(rs.getString("pass"));
				boardBean.setCount(rs.getInt("count"));
				boardBean.setFilename(rs.getString("filename"));
				boardBean.setFilesize(rs.getInt("filesize"));
				boardBean.setIp(rs.getString("ip"));
			}
		} catch (Exception ex) {
			System.out.println("getDetail 에러 : " + ex);
		} finally {
			close(rs);
			close(pstmt);
		}
		return boardBean;
	}

	// 조회수 업데이트.
	public int updateReadCount(int board_num) {
		PreparedStatement pstmt = null;
		int updateCount = 0;
		String sql = "";
		try {
			sql = "update board set count=count+1 where idx=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, board_num);
			updateCount = pstmt.executeUpdate();
			if (updateCount > 0) {
				commit(con);
			} else {
				rollback(con);
			}
		} catch (SQLException ex) {
			System.out.println("setReadCountUpdate 에러 : " + ex);
		} finally {
			close(pstmt);
		}
		return updateCount;
	}

	public int updateArticle(BoardBean bean) {
		int updateCount = 0;
		PreparedStatement pstmt = null;
		String sql = "update board set mem_name=?,title=?,content=?, filename=?,filesize=?, ip =? where idx=?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bean.getName());
			pstmt.setString(2, bean.getTitle());
			pstmt.setString(3, bean.getContent());
			pstmt.setString(4, bean.getFilename());
			pstmt.setInt(5, bean.getFilesize());
			pstmt.setString(6, bean.getIp());
			pstmt.setInt(7, bean.getIdx());
			pstmt.executeUpdate();
			int update = pstmt.executeUpdate();
			if (update > 0) {
				commit(con);
			} else {
				rollback(con);
			}
			updateCount = pstmt.executeUpdate();
		} catch (Exception ex) {
			System.out.println("boardModify 에러 : " + ex);
		} finally {
			close(pstmt);
		}
		return updateCount;
	}

	// 글 삭제.
	public int deleteArticle(int board_num) {
		PreparedStatement pstmt = null;
		String board_delete_sql = "delete from board where idx=?";
		int deleteCount = 0;
		try {
			pstmt = con.prepareStatement(board_delete_sql);
			pstmt.setInt(1, board_num);
			deleteCount = pstmt.executeUpdate();
			if (deleteCount > 0) {
				commit(con);
			} else {
				rollback(con);
			}
		} catch (Exception ex) {
			System.out.println("boardDelete 에러 : " + ex);
		} finally {
			close(pstmt);
		}
		return deleteCount;
	}
}
