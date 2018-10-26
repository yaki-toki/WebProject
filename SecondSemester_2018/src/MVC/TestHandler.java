package MVC;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class TestHandler implements CommandHandler  {
	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		req.setAttribute("test", "테스트입니다.");
		return "./WEB-INF/view/hello.jsp";
	}
}
