package com.spring.example;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.Cookie;
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
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.fasterxml.jackson.databind.JsonNode;
import com.spring.example.kakao.KakaoDTO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController extends kakao_key {

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

	private String client_id = kakao_key.client_id;
	private String redirect_uri = "http://localhost:8080/example/oauth";

	// 로그인
	@RequestMapping(value = "/in", method = RequestMethod.GET)
	public ModelAndView kakaoIn(HttpServletRequest request) {
		System.out.println("------------------------ 로그인 (in) ------------------------");
		ModelAndView mav = new ModelAndView();

		RedirectView redirectView = new RedirectView(); // redirect url 설정
		redirectView.setUrl("https://kauth.kakao.com/oauth/authorize?");
		redirectView.setExposeModelAttributes(true);

		mav.addObject("client_id", client_id);
		mav.addObject("redirect_uri", redirect_uri);
		mav.addObject("response_type", "code");
		/*
		 * final String RequestUrl =
		 * "https://kauth.kakao.com/oauth/authorize?client_id=" + client_id +
		 * "&redirect_uri=" + redirect_uri + "&response_type=code&scope=talk_message";
		 */
		mav.setView(redirectView);

		System.out.println("-----------------------------------------------------------");
		System.out.println();
		return mav;
	}

	// 토큰 얻기
	@RequestMapping(value = "/oauth", produces = "application/json")
	public String kakaoLogin(@RequestParam("code") String code, HttpSession session, HttpServletRequest request, Model model) {
		System.out.println("---------------------- 토큰얻기 (oauth) -----------------------");
		// 카카오 홈페이지에서 받은 결과 코드
		System.out.println(code);
		System.out.println("로그인 후 결과값");

		// 카카오 rest api 객체 선언
		kakao_restapi kr = new kakao_restapi();
		// 결과값을 node에 담아줌
		JsonNode node = kr.getAccessToken(code);
		// 결과값 출력
		System.out.println(node);
		// 노드 안에 있는 access_token값을 꺼내 문자열로 변환
		String token = node.get("access_token").toString();
		// 세션에 담아준다.
		session.setAttribute("token", token);
		System.out.println("-----------------------------------------------------------");
		System.out.println();
		
		return "redirect:/info";
	}

	// 로그 아웃
	@RequestMapping(value = "/logout", produces = "application/json")
	public String kakaoUserLogout(HttpSession session, HttpServletResponse response) {
		System.out.println("---------------------- 로그아웃 (logout) ----------------------");
		try {
			String token = session.getAttribute("token").toString();
			if (token.equals("")) {
				return "redirect:/";
			} else {
				// kakao restapi 객체 선언
				kakao_restapi kr = new kakao_restapi();
				// 노드에 로그아웃한 결과값음 담아줌 매개변수는 세션에 잇는 token을 가져와 문자열로 변환
				JsonNode node = kr.Logout(session.getAttribute("token").toString());
				// 결과 값 출력
				System.out.println("로그인 후 반환되는 아이디 : " + node.get("id"));
				session.removeAttribute("token");
				session.invalidate();
				// JSESSIONID
				Cookie kc = new Cookie("JSESSIONID", null);
				kc.setMaxAge(0); // 유효시간을 0으로 설정
				kc.setPath("/");
				response.addCookie(kc); // 응답 헤더에 추가해서 없어지도록 함
				System.out.println("쿠키 제거");

				System.out.println("-----------------------------------------------------------");
				System.out.println();
				return "redirect:/";
			}
		} catch (Exception e) {

		}
		System.out.println("-----------------------------------------------------------");
		System.out.println();
		return "redirect:/";
	}

	// 사용자 정보
	@RequestMapping(value = "/info", produces = "application/json")
	public String kakaoInfo(HttpSession session, Model model) {
		System.out.println("---------------------- 사용자정보 (info) ----------------------");
		kakao_restapi kr = new kakao_restapi();
		KakaoDTO kakao = kr.userInfo(session.getAttribute("token").toString());

		// 이메일 소유
		if (kakao.getHas_email()) {
			if(kakao.getEmail().equals("") || kakao.getEmail().equals(null)) {
				return "CreateEmail";
			}
		} else {
			return "CreateEmail";
		}

		System.out.println("-----------------------------------------------------------");
		System.out.println();
		model.addAttribute("kakao", kakao);
		return "logininfo";
	}

	// 사용자 동의 항목
	@RequestMapping(value = "/agree", produces = "application/json")
	public String kakaoAgree(HttpSession session, Model model) {
		System.out.println("---------------------- 동의 항목 (agree) ----------------------");
		kakao_restapi kr = new kakao_restapi();
		JsonNode node = kr.getKakaoUserAgree(session.getAttribute("token").toString());
		System.out.println("동적 동의 정보 : " + node);
		System.out.println("-----------------------------------------------------------");
		System.out.println();
		return "logininfo";
	}

	// 사용자 정보 저장
	@RequestMapping(value = "/setdata", produces = "application/json")
	public String kakaoUserDataSave(HttpSession session) {
		System.out.println("-------------------- 정보 저장 (setdata) ---------------------");
		kakao_restapi kr = new kakao_restapi();

		String autorize_code = session.getAttribute("token").toString(); // 로그인 시 얻은 사용자 토큰
		String email = session.getAttribute("email").toString(); // 사용자 이메일

		// kakao서버에 저장하기 위한 데이터를 파라미터로 전달
		// email과 birthday만 사용할 예정
		JsonNode node = kr.setKakaoUserData(autorize_code, email);

		System.out.println("사용자 정보 저장 응답 : " + node);
		System.out.println("-----------------------------------------------------------");
		System.out.println();

		return "logininfo";
	}

	@RequestMapping(value = "/createEmail", method = RequestMethod.POST)
	public String kakaoCreateEmail(@RequestParam("userEmail") String userEmail, HttpSession session) {

		System.out.println(userEmail);
		session.setAttribute("email", userEmail);

		return "redirect:/setdata";
	}

	// 사용자 정보 목록
	@RequestMapping(value = "/userlist", produces = "application/json")
	public String kakaoUserMemberList(HttpSession session) {
		System.out.println("-------------------- 사용자 리스트 (userlist) ------------------");
		kakao_restapi kr = new kakao_restapi();
		String autorize_code = session.getAttribute("token").toString();
		String userID = session.getAttribute("userID").toString(); // 사용자 ID

		if (!userID.equals("1066011879")) {
			return "logininfo";
		}
		// 실제로 해당 토큰은 사용 안됨
		// 사용되는 정보는 {admin key}라는 앱 등록자 계정 키
		JsonNode node = kr.kakaoUserList(autorize_code);
		System.out.println("사용자 정보 저장 응답 : " + node);
		System.out.println("-----------------------------------------------------------");
		System.out.println();

		return "logininfo";
	}

	// createEmail
	// 이메일 생성 페이지 이동
	@RequestMapping(value = "/emailPage", produces = "application/json")
	public String CreateEmailPage(HttpSession session) {
		System.out.println("----------------- Email Page (createEmail) ----------------");
		System.out.println();
		System.out.println("-----------------------------------------------------------");
		return "CreateEmail";
	}

	// 사용자 연결 해제(회원탈퇴)
	@RequestMapping(value = "/unlink", produces = "application/json")
	public String kakaoUserUnlink(HttpSession session) {

		System.out.println("---------------------- 회원탈퇴 (unlink) ----------------------");
		kakao_restapi kr = new kakao_restapi();
		String autorize_code = session.getAttribute("token").toString();
		JsonNode node = kr.kakaoUserUnlink(autorize_code);
		System.out.println("사용자 연결 해제 : " + node);
		System.out.println("-----------------------------------------------------------");
		System.out.println();

		return "redirect:/";
	}
}
