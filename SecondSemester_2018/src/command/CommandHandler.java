package command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface CommandHadler {
	public ActionForward process(HttpServletRequest request, HttpServletResponse response) throws Exception;
}
