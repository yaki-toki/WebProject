package customtag;

import java.io.IOException;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.SimpleTagSupport;

public class WelcomeTag extends SimpleTagSupport {
	@Override
	public void doTag() throws JspException, IOException {
		getJspContext().getOut().println("Welcome to My Custom Tag");
		// 원래 선언 된 테그이기 때문에 오버라이드를 해준다.
	}
}
