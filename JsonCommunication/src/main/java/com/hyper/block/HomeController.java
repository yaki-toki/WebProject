package com.hyper.block;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.MalformedURLException;
import java.net.ProtocolException;
import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.hyper.block.Group.GroupDBModel;
import com.hyper.block.Group.GroupModel;
import com.hyper.block.Group.JsonGroupImpl;
import com.hyper.block.Query.JsonQueryImpl;
import com.hyper.block.db.service.MemberService;
//import com.hyper.block.GroupPay.JsonGroupPayImpl;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	
	@Inject
	private MemberService dbService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) throws Exception {
		logger.info("Welcome home! The client locale is {}.", locale);

		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

		String formattedDate = dateFormat.format(date);

		model.addAttribute("serverTime", formattedDate);
		
		return "home";
	}

	private String reqContext = null;

	private JsonGroupImpl serviceGroup = new JsonGroupImpl();
	private JsonQueryImpl queryImpl = new JsonQueryImpl();

	@RequestMapping(value = "/getgroup", method = RequestMethod.GET)
	public String getGroup(Model model, HttpSession session)
			throws MalformedURLException, ProtocolException, UnsupportedEncodingException, IOException, Exception {

		JsonArray jsonArray = serviceGroup.GetGroup();

		GroupModel[] groupModel = new GroupModel[jsonArray.size()];

		for (int i = 0; i < jsonArray.size(); i++) {
			JsonObject object = (JsonObject) jsonArray.get(i);
			groupModel[i] = serviceGroup.getParser(object);
		}
		model.addAttribute("groupList", groupModel);

		reqContext = "getgroup";
		session.setAttribute("reqContext", reqContext);
		return "home";
	}

	@RequestMapping(value = "/getById", method = RequestMethod.GET)
	public String getGroupById(@RequestParam("userId") String userId, Model model, HttpSession session,
			HttpServletResponse response, HttpServletRequest request)
			throws MalformedURLException, ProtocolException, UnsupportedEncodingException, IOException, Exception {

		if (userId.equals("") || userId.equals(null)) {
			reqContext = "getUserIdNull";
			session.setAttribute("reqContext", reqContext);
			return "home";
		}
		
		int userCount = queryImpl.SelectUserEmail(userId);
		if(userCount == 0) {
			session.setAttribute("newEmail", userId);
			return "redirect:/postUserData";
		}

		JsonObject object = serviceGroup.GetGroupByEmail(userId);
		GroupModel groupModel = new GroupModel();

		groupModel = serviceGroup.getParser(object);
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

	@RequestMapping(value = "/userData", method = RequestMethod.POST)
	public String requestParameter(HttpServletRequest request, HttpServletResponse response)
			throws MalformedURLException, ProtocolException, UnsupportedEncodingException, IOException, Exception {
		
		int user = dbService.selectGroupUserEmail(request.getParameter("userEmail"));
		
		if(user == 1) {
			request.setAttribute("user",1);
			return "home";
		}else {
			GroupModel model = new GroupModel();
			GroupDBModel dbmodel = new GroupDBModel();

			model.setGroupClass("org.lego.network.Group");
			model.setUserEmail(request.getParameter("userEmail"));
			
			dbmodel.setGroupClass("org.lego.network.Group");
			dbmodel.setUserEmail(request.getParameter("userEmail"));
			
			dbService.insertGroup(dbmodel);

			String result = serviceGroup.GroupPost(model);

			System.out.println(result);
		}
		
		return "home";
	}
}
