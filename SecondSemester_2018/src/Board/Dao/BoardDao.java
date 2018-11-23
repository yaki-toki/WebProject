package Board.Dao;

import static jdbc.JdbcUtil.close;
import static jdbc.JdbcUtil.commit;
import static jdbc.JdbcUtil.getConnection;
import static jdbc.JdbcUtil.rollback;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.PageContext;
import javax.sql.DataSource;

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
			sql = "insert board(mem_name,content,title,replycount, reg_date,pass,count,ip,filename,filesize)";
			sql += "values(?, ?, ?, 0, now(), ?, 0, ?, ?, ?)";
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
			// return true;
		} catch (Exception ex) {
			System.out.println("에러" + ex);
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

	// 글 수정
	public int updateArticle(BoardBean bean) {
		int updateCount = 0;
		PreparedStatement pstmt = null;
		String sql = "update board set mem_name=?,title=?," + " content=?, filename=?,filesize=?, ip =? where idx=?";
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
		PreparedStatement pstmt2 = null;
		String board_delete_sql = "delete from board where idx=?";
		String reply_delete_sql = "delete from board_reply where board_no=?";
		int deleteCount = 0;
		try {
			pstmt2 = con.prepareStatement(reply_delete_sql);
			pstmt2.setInt(1, board_num);
			pstmt2.executeUpdate();
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
			close(pstmt2);
			close(pstmt);
		}
		return deleteCount;
	}

	// 글쓴이인지 확인.
	public boolean isArticleBoardWriter(int board_num, String pass) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String board_sql = "select * from board where idx=?";
		boolean isWriter = false;
		try {
			pstmt = con.prepareStatement(board_sql);
			pstmt.setInt(1, board_num);
			rs = pstmt.executeQuery();
			rs.next();
			// 페스우드 확인 부분
			if (pass.equals(rs.getString("pass"))) {
				isWriter = true;
			}
		} catch (SQLException ex) {
			System.out.println("isBoardWriter 에러 : " + ex);
		} finally {
			close(pstmt);
		}
		return isWriter;
	}

	// 글 답변.
	public boolean insertReplyArticle(Board_Reply bean) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		try {
			sql = "insert board_reply(board_no, mem_name,pass, content,reg_date,ip)";
			sql += "values(?, ?, ?, ?, now(), ?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, bean.getBoard_no());
			pstmt.setString(2, bean.getMem_name());
			pstmt.setString(3, bean.getPass());
			pstmt.setString(4, bean.getContent());
			pstmt.setString(5, bean.getIp());
			int insertedCount = pstmt.executeUpdate();
			if (insertedCount > 0) {
				commit(con);
				return true;
			} else {
				rollback(con);
			}
		} catch (SQLException ex) {
			System.out.println("boardReply 에러 : " + ex);
		} finally {
			close(rs);
			close(pstmt);
		}
		return false;
	}

	// 댓글 수 증가
	public int replyUpBoardCount(int board_num) {
		PreparedStatement pstmt = null;
		int updateCount = 0;
		String sql = "";
		try {
			sql = "update board set replycount = replycount + 1 where idx=?";
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

	// 댓글목록
	public List<Board_Reply> replyBoard(int board_num) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String reply_list_sql = "select * from board_reply where board_no=?";
		List<Board_Reply> replyList = new ArrayList<Board_Reply>();
		Board_Reply reply = null;
		try {
			pstmt = con.prepareStatement(reply_list_sql);
			pstmt.setInt(1, board_num);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				reply = new Board_Reply();
				reply.setIdx(rs.getInt("idx"));
				reply.setMem_name(rs.getString("mem_name"));
				reply.setContent(rs.getString("content"));
				reply.setReg_date(rs.getString("reg_date"));
				reply.setIp(rs.getString("ip"));
				replyList.add(reply);
			}
		} catch (Exception ex) {
			System.out.println("getReplyList 에러 : " + ex);
		} finally {
			close(rs);
			close(pstmt);
		}
		return replyList;
	}

	// 댓글 삭제.
	public int deleteReply(int reply_num) {
		PreparedStatement pstmt = null;
		String board_delete_sql = "delete from board_reply where idx=?";
		int deleteCount = 0;
		try {
			pstmt = con.prepareStatement(board_delete_sql);
			pstmt.setInt(1, reply_num);
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

	// 댓글 삭제 후 카운트 값 감소
	public int deleteReply_Count(int reply_num) {
		PreparedStatement pstmt = null;
		int updateCount = 0;
		String sql = "";
		try {
			sql = "update board set replycount = replycount - 1 where idx=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, reply_num);
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

	// 파일 다운로드
	public void downLoad(HttpServletRequest req, HttpServletResponse res, JspWriter out, PageContext pageContext) {
		try {
			// 요청객체인 req에서 다운로드 파일명을 문자열로 리턴 받는다.
			String filename = req.getParameter("filename");

			// 저장된 경로와 다운로드 파일명을 합쳐서 File 객체를 생성한다.
			File file = new File(UtilMgr.con(SAVEFOLDER + File.separator + filename));

			// 파일의 용량 크기 만큼 byte 배열을 선언한다.
			byte b[] = new byte[(int) file.length()];

			// 응답 객체 res 헤더필드에 Accept-Ranges에 bytes 단위로 설정한다.
			res.setHeader("Accept-Ran//ges", "bytes");

			// 요청객체인 req에서 클라이언트의 User-Agent 정보를 리턴 받는다.
			String strClient = req.getHeader("User-Agent");

			// 브라우저의 버전과 정보를 구분해서 각각 res 헤더필드와 contentType을 설정한다.
			if (strClient.indexOf("MSIE6.0") != -1) {
				res.setContentType("application/smnet;charset=euc-kr");
				res.setHeader("Content-Disposition", "filename=" + filename + ";");
			} else {
				res.setContentType("application/smnet;charset=euc-kr");
				res.setHeader("Content-Disposition", "attachment;filename=" + filename + ";");
			}
			out.clear();
			out = pageContext.pushBody();
			// 파일 존재 여부에 따라 스트링 방식으로 브라우저로 파일을 전송한다.
			if (file.isFile()) {
				BufferedInputStream fin = new BufferedInputStream(new FileInputStream(file));
				BufferedOutputStream outs = new BufferedOutputStream(res.getOutputStream());
				int read = 0;
				while ((read = fin.read(b)) != -1) {
					outs.write(b, 0, read);
				}
				outs.close();
				fin.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
