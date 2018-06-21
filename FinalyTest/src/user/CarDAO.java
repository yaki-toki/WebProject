package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class CarDAO {

	// 생성과 동시에 custom_num DB에 접근하여 num의 최대값을 가져온다.
	private Connection conn;
	// DB Connection객체 생성
	private PreparedStatement pstmt;

	private Statement stm;

	private ResultSet rs;

	// Data set을 저장할 객체 생성
	public CarDAO() {

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

	// modelID를 사용하여 해당 모델의 정보를 불러온다.
	public ResultSet SetModel(String modelID) {
		// 차량에 대한 정보를 불러오는 부분
		String SQL = "select * from model where modelID=?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, modelID);
			rs = pstmt.executeQuery();
			rs.next();
			return rs;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return rs;
	}

	public int InsertCar(String number, User user, Car car) {
		String SQL = "insert into car values(?,?,?)";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, number);
			pstmt.setString(2, user.getUserID());
			pstmt.setString(3, car.getModelID());
			return pstmt.executeUpdate();
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
		return -1;// DB Error
	}
}
