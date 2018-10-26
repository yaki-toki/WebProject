package MVC;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface CommandHandler {
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception;
	// 인터페이스 구현
}
