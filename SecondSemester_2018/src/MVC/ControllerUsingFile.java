package MVC;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServlet;

public class ControllerUsingFile extends HttpServlet {

	private Map<String, CommandHandler> commandHandlerMap = new HashMap<>();
}
