package com.hyper.block;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.hyper.block.Group.GroupGetParser;
import com.hyper.block.Group.GroupModel;
import com.hyper.block.Group.GroupPostMethod;
import com.hyper.block.Group.JsonGetGroup;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);

		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

		String formattedDate = dateFormat.format(date);

		model.addAttribute("serverTime", formattedDate);

		return "home";
	}

	private String reqContext = null;
	private JsonGetGroup jsonGetGroup;

	@RequestMapping(value = "/getgroup", method = RequestMethod.GET)
	public String getGroup(Model model, HttpSession session) {

		jsonGetGroup = new JsonGetGroup();
		JsonArray jsonArray = jsonGetGroup.GetGroup();

		GroupModel[] groupModel = new GroupModel[jsonArray.size()];
		GroupGetParser parser = new GroupGetParser();

		for (int i = 0; i < jsonArray.size(); i++) {
			JsonObject object = (JsonObject) jsonArray.get(i);
			groupModel[i] = parser.getParser(object);
		}
		model.addAttribute("groupList", groupModel);

		reqContext = "getgroup";
		session.setAttribute("reqContext", reqContext);
		return "home";
	}

	@RequestMapping(value = "/getById", method = RequestMethod.GET)
	public String getGroupById(@RequestParam("userId") String userId, Model model, HttpSession session,
			HttpServletResponse response) {
		if (userId.equals("") || userId.equals(null)) {
			reqContext = "getUserIdNull";
			session.setAttribute("reqContext", reqContext);
			return "home";
		}
		jsonGetGroup = new JsonGetGroup();
		JsonObject object = jsonGetGroup.GetGroupById(userId);
		GroupModel groupModel = new GroupModel();
		GroupGetParser parser = new GroupGetParser();
		groupModel = parser.getParser(object);
		model.addAttribute("userModel", groupModel);
		reqContext = "getGroupId";
		session.setAttribute("reqContext", reqContext);
		return "home";
	}

	@RequestMapping(value = "/postUserData", method = RequestMethod.GET)
	public String postGroupUser() {
		System.out.println("POST요청 페이지로 이동");
		return "postUserData";
	}

	
	@RequestMapping(value = "/block/userData", method = RequestMethod.POST)
	public String requestParameter() {
		GroupModel model = new GroupModel();
		
//		model.setGroupClass(groupClass);
//		model.setGroupName(groupName);
//		model.setUserEmail(userEmail);
//		model.setAccount(account);
//		model.setState(false);
//		model.setOauth(oauth);
		
		model.setGroupClass("org.lego.network.Group");
		model.setGroupName("admin");
		model.setUserEmail("rlawlgk23@gmail.com");
		model.setAccount("master");
		model.setState(false);
		model.setOauth("kakao");
		
		GroupPostMethod postMethod = new GroupPostMethod();
		String result = postMethod.dataPost(model);
		System.out.println(result);
		return "home";
	}
}
