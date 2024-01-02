package com.test.sts;

import com.github.scribejava.core.builder.ServiceBuilder;
import com.github.scribejava.core.model.OAuth2AccessToken;
import com.github.scribejava.core.model.OAuthRequest;
import com.github.scribejava.core.model.Response;
import com.github.scribejava.core.model.Verb;
import com.github.scribejava.core.oauth.OAuth20Service;
import org.springframework.util.StringUtils;

import javax.servlet.http.HttpSession;
import java.util.UUID;

public class KakaoLoginBO {
	
	// 카카오 로그인 정보
	private final static String KAKAO_CLIENT_ID = "f5b5bf34676dc45207b5d739969c45fe"; // kakao k
	private final static String KAKAO_CLIENT_SECRET = "ZJ7jsY5ZYuF8IbTqblP99tUJA6yKlZcf";
	private final static String KAKAO_REDIRECT_URI = "http://localhost:8080/team/member/kakaocallback";
	private final static String SESSION_STATE = "kakao_oauth_state"; 
	private final static String PROFILE_API_URL = "https://kapi.kakao.com/v2/user/me"; 

	public String getAuthorizationUrl(HttpSession session) {
		String state = generateRandomString();
		setSession(session, state);
		OAuth20Service oauthService = new ServiceBuilder()
				.apiKey(KAKAO_CLIENT_ID)
				.apiSecret(KAKAO_CLIENT_SECRET)
				.callback(KAKAO_REDIRECT_URI)
				.state(state)
				.build(KakaoOAuthApi.instance());
		
		return oauthService.getAuthorizationUrl();
	}
	
	public OAuth2AccessToken getAccessToken(HttpSession session, String code, String state) throws Exception{
		String sessionState = getSession(session);
		if(StringUtils.pathEquals(sessionState, state)) {
			OAuth20Service oauthService = new ServiceBuilder()
					.apiKey(KAKAO_CLIENT_ID)
					.apiSecret(KAKAO_CLIENT_SECRET)
					.callback(KAKAO_REDIRECT_URI)
					.state(state)
					.build(KakaoOAuthApi.instance());
			OAuth2AccessToken accessToken = oauthService.getAccessToken(code);
			return accessToken;
		}
		return null;
	}
	
	public String getUserProfile(OAuth2AccessToken oauthToken) throws Exception {
		OAuth20Service oauthService = new ServiceBuilder()
				.apiKey(KAKAO_CLIENT_ID)
				.apiSecret(KAKAO_CLIENT_SECRET)
				.callback(KAKAO_REDIRECT_URI)
				.build(KakaoOAuthApi.instance());
		OAuthRequest request = new OAuthRequest(Verb.GET, PROFILE_API_URL, oauthService);
		oauthService.signRequest(oauthToken, request);
		Response response = request.send();
		return response.getBody();
	} 
	
	private String generateRandomString() {
		return UUID.randomUUID().toString();
	}
	
	private void setSession(HttpSession session, String state) {
		session.setAttribute(SESSION_STATE, state);
	}
	
	private String getSession(HttpSession session) {
		return (String) session.getAttribute(SESSION_STATE);
	}
	
}
