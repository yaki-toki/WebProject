package com.spring.example.kakao;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.message.BasicNameValuePair;
import org.json.simple.JSONObject;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

public class KakaoRestApi extends kakao_key{

	private String client_id = kakao_key.client_id;
	private String redirect_uri = kakao_key.redirect_uri;
	
	/*
	 * autorize_code : 현재 접속 한 사용자의 access token값
	 * 해당 정보를 해더에 추가해서 요청을 하는 것은
	 * 해당 사용자의 정보를 받아오기 위함임
	 * */

	// Oauth에서 사용 될 접근 토큰 요청
	public JsonNode getAccessToken(String autorize_code) {
		// 요청 URL
		final String RequestUrl = "https://kauth.kakao.com/oauth/token";
		
		// 요청 시 포함되는 URI(data)
		final List<NameValuePair> postParams = new ArrayList<NameValuePair>();
		postParams.add(new BasicNameValuePair("grant_type", "authorization_code"));
		postParams.add(new BasicNameValuePair("client_id", client_id));
		postParams.add(new BasicNameValuePair("redirect_uri", redirect_uri));
		postParams.add(new BasicNameValuePair("code", autorize_code));

		// Request를 위한 정보 생성
		final HttpClient client = HttpClientBuilder.create().build();
		
		// 요청 방식은 POST
		final HttpPost post = new HttpPost(RequestUrl);

		// 받아온 정보를 저장 할 변수 초기화
		// 변수 타입은 JSON형식으로 받기 위해 JsonNode를 사용
		JsonNode returnNode = null;
		try {
			// URI(data)를 전송 url에 추가
			post.setEntity(new UrlEncodedFormEntity(postParams));
			// POST방식으로 요청 한 정보의 응답
			final HttpResponse response = client.execute(post);
			// 응답 코드
			final int responseCode = response.getStatusLine().getStatusCode();
			System.out.println("응답 Code : " + responseCode);
			// 응답받은 정보를 매퍼로 생성
			ObjectMapper mapper = new ObjectMapper();
			// JSON형식으로 변수에 저장
			returnNode = mapper.readTree(response.getEntity().getContent());

		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (ClientProtocolException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return returnNode;
	}

	// 사용자 로그 아웃
	public JsonNode Logout(String autorize_code) {

		final String RequestUrl = "https://kapi.kakao.com/v1/user/logout";
		final HttpClient client = HttpClientBuilder.create().build();
		final HttpPost post = new HttpPost(RequestUrl);
		// 요청 정보에 해더 추가
		// 해더 내용 Authorization : Bearer 엑세스토큰
		post.addHeader("Authorization", "Bearer " + autorize_code);
		JsonNode returnNode = null;

		try {
			// 요청의 응답 정보 저장
			final HttpResponse response = client.execute(post);
			// 응답 코드
			final int responseCode = response.getStatusLine().getStatusCode();
			System.out.println("응답 Code : " + responseCode);
			// JSON형태 변환
			ObjectMapper mapper = new ObjectMapper();
			returnNode = mapper.readTree(response.getEntity().getContent());

		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (ClientProtocolException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return returnNode;
	}

	public KakaoDTO userInfo(String accessToken) {
		KakaoDTO model = new KakaoDTO();
		final String RequestUrl = "https://kapi.kakao.com/v2/user/me";
		final HttpClient client = HttpClientBuilder.create().build();
		final HttpPost post = new HttpPost(RequestUrl);
		// 해더 추가
		post.addHeader("Authorization", "Bearer " + accessToken);

		JsonNode returnNode = null;

		try {
			final HttpResponse response = client.execute(post);
			// 응답 코드
			final int responseCode = response.getStatusLine().getStatusCode();
			System.out.println("응답 Code : " + responseCode);
			// JSON 형태 반환값 처리
			ObjectMapper mapper = new ObjectMapper();
			returnNode = mapper.readTree(response.getEntity().getContent());
			
			JsonNode userProperties = returnNode.get("properties");
			JsonNode userAccess = returnNode.get("kakao_account");
			
			model.setId(returnNode.get("id").toString());
			model.setNickname(userProperties.get("nickname").toString());
			try {
				String profile_image = userProperties.get("profile_image").toString();
				String thumbnail_image = userProperties.get("thumbnail_image").toString();
				String email = userAccess.get("email").toString();

				profile_image = profile_image.replace("\"", "");
				thumbnail_image = thumbnail_image.replace("\"", "");
				email = email.replace("\"", "");
				
				model.setProfile_image(profile_image);
				model.setThumbnail_image(thumbnail_image);
				model.setEmail(email);
			}catch(Exception e) {
				String email = userAccess.get("email").toString();
				email = email.replace("\"", "");
				model.setProfile_image("../resources/image/login.png");
				model.setThumbnail_image("../resources/image/login.png");
				model.setEmail(email);
			}finally{
				model.setHas_email(Boolean.valueOf(userAccess.get("has_email").toString()).booleanValue());
				model.setEmail_needs_agreement(Boolean.valueOf(userAccess.get("email_needs_agreement").toString()).booleanValue());
				model.setIs_email_valid(Boolean.valueOf(userAccess.get("is_email_valid").toString()).booleanValue());
				model.setIs_email_verified(Boolean.valueOf(userAccess.get("is_email_verified").toString()).booleanValue());
			}
		} catch (ClientProtocolException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return model;
	}

	// 사용자 동의 항목
	public JsonNode getKakaoUserAgree(String autorize_code) {
		// 현재 사용자가 동의한 항목들과 해당 서비스를 위해 필요한 추가 동의 항목을 출력
		final String RequestUrl = "https://kapi.kakao.com/v2/api/talk/memo/default/send";
		final HttpClient client = HttpClientBuilder.create().build();
		// POST형식
		final HttpPost post = new HttpPost(RequestUrl);
		post.addHeader("Authorization", "Bearer " + autorize_code);
		
		final List<NameValuePair> postParams = new ArrayList<NameValuePair>();
		// template_object 요청 데이터
		// required_scopes : 현재 API를 사용하기 위해서 필요한 동의 항목(동의하지 않은 항목들 출력)
		// allowed_scopes : 사용자가 현재 동의한 동의항목
		postParams.add(new BasicNameValuePair("template_object", "required_scopes"));
		// 요청 정보 생성
		
		JsonNode returnNode = null;
		
		try {
			// 요청 body추가
			post.setEntity(new UrlEncodedFormEntity(postParams));
			// 요청 수행
			final HttpResponse response = client.execute(post);
			// 응답 코드
			final int responseCode = response.getStatusLine().getStatusCode();
			System.out.println("응답 Code : " + responseCode);
			
			ObjectMapper mapper = new ObjectMapper();
			returnNode = mapper.readTree(response.getEntity().getContent());

		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (ClientProtocolException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return returnNode;
	}

	// 사용자 정보 저장
	public JsonNode setKakaoUserData(String autorize_code, String email) {
		/*
		 * 사용자 정보를 저장하기 위한 데이터 형태
		 * {"nickname":"홍길동","age":"22"}
		 * 와 같은 JSON형태로 body에 추가로 요청
		 * */
		final String RequestUrl = "https://kapi.kakao.com/v1/user/update_profile";
		final HttpClient client = HttpClientBuilder.create().build();
		final HttpPost post = new HttpPost(RequestUrl);

		post.addHeader("Authorization", "Bearer " + autorize_code);
		
		// JSON으로 받은 데이터를 저장하기 위한 것으로 앞, 뒤의 "를 제거
		email = email.replace("\"", "");

		// JSON데이터 생성
		JSONObject personInfo = new JSONObject();
		// 데이터 추가
		personInfo.put("email", email);
		// 만들어진 데이터 : {"email":email}

		// body에 추가하기 위한 List생성
		final List<NameValuePair> postParams = new ArrayList<NameValuePair>();
		postParams.add(new BasicNameValuePair("properties", "" + personInfo));
		
		JsonNode returnNode = null;
		try {
			// 요청 URL의 body에 정보 추가
			post.setEntity(new UrlEncodedFormEntity(postParams));
			final HttpResponse response = client.execute(post);
			// 응답 코드
			final int responseCode = response.getStatusLine().getStatusCode();
			System.out.println("응답 Code : " + responseCode);
			ObjectMapper mapper = new ObjectMapper();
			returnNode = mapper.readTree(response.getEntity().getContent());

		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (ClientProtocolException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return returnNode;
	}
	
	// 사용자 리스트
	public JsonNode kakaoUserList(String autorize_code) {
		final String RequestUrl = "https://kapi.kakao.com/v1/user/ids";
		final HttpClient client = HttpClientBuilder.create().build();
		final HttpPost post = new HttpPost(RequestUrl);
		// 사용자 리스트를 받아오기 위해 {admin key}를 사용해서 요청
		post.addHeader("Authorization","KakaoAK "+kakao_key.KakaoAK);
		JsonNode returnNode = null;
		
		try {
			final HttpResponse response = client.execute(post);
			// 응답 코드
			final int responseCode = response.getStatusLine().getStatusCode();
			System.out.println("응답 Code : " + responseCode);
			
			ObjectMapper mapper = new ObjectMapper();
			returnNode = mapper.readTree(response.getEntity().getContent());
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (ClientProtocolException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return returnNode;
	}

	// 사용자 연결 해제
	public JsonNode kakaoUserUnlink(String autorize_code) {
		final String RequestUrl = "https://kapi.kakao.com/v1/user/unlink";
		final HttpClient client = HttpClientBuilder.create().build();
		final HttpPost post = new HttpPost(RequestUrl);

		post.addHeader("Authorization", "Bearer " + autorize_code);
		JsonNode returnNode = null;
		try {
			final HttpResponse response = client.execute(post);
			// 응답 코드
			final int responseCode = response.getStatusLine().getStatusCode();
			System.out.println("응답 Code : " + responseCode);
			ObjectMapper mapper = new ObjectMapper();
			returnNode = mapper.readTree(response.getEntity().getContent());
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (ClientProtocolException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return returnNode;
	}
	
	public JsonNode kakaoCreateEmail(HttpServletRequest request) {
		
		
		JsonNode returnNode = null;
		return returnNode;
	}
}
