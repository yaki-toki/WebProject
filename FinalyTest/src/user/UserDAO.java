package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class UserDAO extends User{

	// 생성과 동시에 custom_num DB에 접근하여 num의 최대값을 가져온다.
	private Connection conn;
	// DB Connection객체 생성
	private PreparedStatement pstmt;
	
	private Statement stm;
	
	private ResultSet rs;
	// Data set을 저장할 객체 생성
	public UserDAO() {

		try {
			String DB_URL = "jdbc:mysql://203.255.177.208:3306/test12?useUnicode=true&characterEncoding=utf8";
			String DB_USER = "test12";
			String DB_PASSWORD = "test1234";
			// DB URL,ID,PASSWORD
			Class.forName("com.mysql.jdbc.Driver");
			// 드라이버 탐색
			conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
			// DB 연결
		} catch (Exception e) {
			System.out.println("Exception Error...");
			System.out.println(e.toString());
		}
	}
	
	public ResultSet SetUser(String userID) {
		String SQL = "select * from member where userID=?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			rs.next();
			//2~8 ID, PW, 이름, 나이, 성별, 이메일, 전화번호
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return rs;
	}
	
	public int IDChk(String userID) {
		String SQL = "select * from member where userID=?";

		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			if (rs.next() || userID.equals("")) {
				return 0;
				// 이미 존재하는 회원
			} else {
				return 1;
				// 가입 가능
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return -1;// 데이터베이스 오류
	}

	public int join(User user){
		String SQL = "insert into member values(?,?,?,?,?,?,?,?)";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, user.getUserID());
			pstmt.setString(2, user.getUserPassword());
			pstmt.setString(3, user.getUserName());
			pstmt.setInt(4, user.getUserAge());
			pstmt.setString(5, user.getUserGender());
			pstmt.setString(6, user.getUserEmail());
			pstmt.setString(7, user.getUserPhone());
			pstmt.setTimestamp(8, user.getReg_date());
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return -1;// DB Error
	}
	
	public int login(String userID, String userPassword) {
		String SQL = "select userPassword from member where userID = ?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				if(rs.getString(1).equals(userPassword)) {
					return 1; //로그인 성공
				}
			}
			else {
				return 0; //비밀번호 오류
			}
			return -1;//ID없음
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return -2; // DB오류
	}
	
	public ResultSet Car() {
		String SQL = "SELECT * FROM car";
		try {
			stm = conn.createStatement();
			rs = stm.executeQuery(SQL);
			return rs;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return rs;
		}finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	public int UpdateUser(User user) {
		String SQL = "update member set userPassword=?,userName=?,userAge=?,userGender=?, userEmail=?,userPhone=? where userID=?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, user.getUserPassword());
			pstmt.setString(2, user.getUserName());
			pstmt.setInt(3, user.getUserAge());
			pstmt.setString(4, user.getUserGender());
			pstmt.setString(5, user.getUserEmail());
			pstmt.setString(6, user.getUserPhone());
			pstmt.setString(7, user.getUserID());
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return -1;// DB Error
	}
}
