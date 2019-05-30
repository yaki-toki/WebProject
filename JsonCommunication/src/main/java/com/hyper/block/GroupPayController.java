package com.hyper.block;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.MalformedURLException;
import java.net.ProtocolException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.hyper.block.GroupPay.GroupPayModel;
import com.hyper.block.GroupPay.JsonGroupPayImpl;

@Controller
public class GroupPayController {

	@RequestMapping(value = "/groupPay", method = RequestMethod.GET)
	public String NewPage() {
		return "groupPay";
	}

	JsonGroupPayImpl service = new JsonGroupPayImpl();

	@RequestMapping(value = "/getGroupPay", method = RequestMethod.GET)
	public String getGroupPay(Model model)
			throws MalformedURLException, ProtocolException, UnsupportedEncodingException, IOException, Exception {

		JsonArray jsonArray = service.GetGroupPay();

		GroupPayModel[] groupPayModel = new GroupPayModel[jsonArray.size()];

		for (int i = 0; i < jsonArray.size(); i++) {
			JsonObject object = (JsonObject) jsonArray.get(i);
			groupPayModel[i] = service.getParser(object);
		}
		
		model.addAttribute("groupPayModel", groupPayModel);

		return "groupPay";
	}

	@RequestMapping(value = "/searchGroup", method = RequestMethod.GET)
	public String getGroupPayById(@RequestParam("group") String groupName, Model model, HttpSession session,
			HttpServletResponse response)
			throws MalformedURLException, ProtocolException, UnsupportedEncodingException, IOException, Exception {

		if (groupName.equals("") || groupName.equals(null)) {
			return "redirect:/groupPay";
		}

		JsonObject groupPay = service.GetGroupPayByName(groupName);
		GroupPayModel groupPayModel = new GroupPayModel();

		groupPayModel = service.getParser(groupPay);
		model.addAttribute("groupPay", groupPayModel);

		return "groupPay";
	}

	@RequestMapping(value = "/addGroup", method = RequestMethod.POST)
	public String AddGroup(HttpServletRequest request) 
			throws MalformedURLException, ProtocolException, UnsupportedEncodingException, IOException, Exception {

		GroupPayModel model = new GroupPayModel();
		
		model.setPayClass("org.lego.network.GroupPay");
		model.setGroupName(request.getParameter("groupName"));
		model.setPay(Integer.parseInt(request.getParameter("pay")));
		model.setParticipantNum(0);
		model.setNowPay(0);
		
		String result = service.GroupPayPost(model);
		System.out.println(result);
		
		return "redirect:/groupPay";
	}
}
