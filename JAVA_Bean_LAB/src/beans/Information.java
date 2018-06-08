package beans;
//201403010 김지하

import java.sql.*;
import java.sql.Timestamp;

public class Information {
	private String num = "2018_000";
	private String name = null;
	private String passwd = null;
	private String menu = null;
	private String temp = null;
	private String size = null;
	private int number = 1;
	private Timestamp reg_date;
	//기본 값 초기화

	public Information() {
		//생성과 동시에 custom_num DB에 접근하여 num의 최대값을 가져온다.
		Connection conn = null;
		//DB Connection객체 생성
		Statement stmt;
		//값을 불러오기 위한 객체
		ResultSet rs = null;
		//Data set을 저장할 객체 생성
		String query = "select max(num) from custom_num";
		//num의 최대값 가져오기
		try {
			String DB_URL = "jdbc:mysql://210.123.254.93:3307/school";
			String DB_USER = "root";
			String DB_PASSWORD = "51749509kjh";
			// DB URL,ID,PASSWORD
			Class.forName("com.mysql.jdbc.Driver");
			//드라이버 탐색
			conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
			//DB 연결
			stmt = conn.createStatement();
			rs = stmt.executeQuery(query);
			//쿼리문 실행
			
			if(rs.next())
			//이게 왜 없으면 안되는지 모르겠습니다...
				
			setNumber(rs.getInt(1)+1);
			//setNumber메소드에 값을 1추가해서 전달
			
			rs.close();
			stmt.close();
			conn.close();
			//연동 후 종료
		}catch(Exception e) {
			System.out.println("Exception Error...");
			System.out.println(e.toString());
		}
		
	}

	public int getNumber() {
		return number;
	}

	public void setNumber(int number) {
		this.number = number;
	}

	public void setNum(String num) {
		this.num = num;
	}

	public String getNum() {
		return num+getNumber();
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPasswd() {
		return passwd;
	}

	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}

	public String getMenu() {
		return menu;
	}

	public void setMenu(String menu) {
		this.menu = menu;
	}

	public String getTemp() {
		return temp;
	}

	public void setTemp(String temp) {
		this.temp = temp;
	}

	public String getSize() {
		return size;
	}

	public void setSize(String size) {
		this.size = size;
	}

	public Timestamp getReg_date() {
		return reg_date;
	}

	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}
}
