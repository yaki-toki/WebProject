package Example;

import java.sql.Timestamp;

public class Example2 {
// ------------- 변수 선언--------------------
	private String std_id;
	private String[] class_name;
	// 체크 박스에서 사용하는 배열 타입
	private String[] clear;
	private Timestamp reg_date;
	private String classname;
// ----------------------------------------
	
	public String getStd_id() {
		return std_id;
	}
	public void setStd_id(String std_id) {
		this.std_id = std_id;
	}
	public String[] getClass_name() {
		return class_name;
	}
	public void setClass_name(String[] class_name) {
		this.class_name = class_name;
	}
	public Timestamp getReg_date() {
		return reg_date;
	}
	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}
	public String getclassname() {
		classname = "";
		for(int i = 0; i < class_name.length;i++) {
			classname+=this.class_name[i]+" ";
		}
		return classname;
	}
	
	public void Clear() {
		std_id = "";
		class_name = clear;
		classname="";
	}
}
