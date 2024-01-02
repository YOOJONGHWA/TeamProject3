package com.test.sts;


import com.github.scribejava.core.model.OAuth2AccessToken;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;

/**
 * Handles requests for the application home page.
 */
@Controller
public class LoginController {

    /* NaverLoginBO */
    private NaverLoginBO naverLoginBO;
    private String apiResult = null;
    
    @Autowired
    private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
        this.naverLoginBO = naverLoginBO;
    }
    
    /* KakaoLoginBO */
    @Autowired
    private KakaoLoginBO kakaoLoginBO;
    private String apiResult1 = null;
    
//    @Autowired
//    private void setKakaoLoginBO(KakaoLoginBO kakaoLoginBO) {
//        this.kakaoLoginBO = kakaoLoginBO;
//    }
    
    

    //로그인 첫 화면 요청 메소드
    @RequestMapping(value = "/member/otherlogin", method = { RequestMethod.GET, RequestMethod.POST })
    public String login(Model model, HttpSession session) {
        
        /* 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */
        String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
        //https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=sE***************&
        //redirect_uri=http%3A%2F%2F211.63.89.90%3A8090%2Flogin_project%2Fcallback&state=e68c269c-5ba9-4c31-85da-54c16c658125
        System.out.println("네이버:" + naverAuthUrl);
        //네이버 
        model.addAttribute("url", naverAuthUrl);
        
        String kakaoAuthUrl = kakaoLoginBO.getAuthorizationUrl(session);
        System.out.println("카카오:" + kakaoAuthUrl);
        model.addAttribute("urlKakao", kakaoAuthUrl);
        
        /* 생성한 인증 URL을 View로 전달 */
        return "member/otherloginForm";
    }

    //네이버 로그인 성공시 callback호출 메소드
    @RequestMapping(value = "/member/callback", method = { RequestMethod.GET, RequestMethod.POST })
    public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session)
            throws Exception {
        OAuth2AccessToken oauthToken;
        oauthToken = naverLoginBO.getAccessToken(session, code, state);
        //로그인 사용자 정보를 읽어온다.
        apiResult = naverLoginBO.getUserProfile(oauthToken);
        
        JSONParser jsonParser = new JSONParser();
        JSONObject jsonObj;
        
        jsonObj = (JSONObject) jsonParser.parse(apiResult);
        JSONObject response_obj = (JSONObject) jsonObj.get("response");
        // 프로필 조회
        String email = (String) response_obj.get("email");
        String name = (String) response_obj.get("name");
        // 세션에 사용자 정보 등록
        // session.setAttribute("islogin_r", "Y");
        session.setAttribute("signIn", apiResult);
        session.setAttribute("email", email);
        session.setAttribute("userId", name);
        
//        model.addAttribute("result", apiResult);
        /* 네이버 로그인 성공 페이지 View 호출 */

//      session.setAttribute("login",vo);
//      return new ModelAndView("user/loginPost", "result", vo);
        
        return "redirect:/main/main";
    }
    
  //카카오 로그인 성공시 callback호출 메소드
    @RequestMapping(value = "/member/kakaocallback", method = { RequestMethod.GET, RequestMethod.POST })
    public String kakaocallback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session)
            throws Exception {
        OAuth2AccessToken oauthToken;
        oauthToken = kakaoLoginBO.getAccessToken(session, code, state);
        //로그인 사용자 정보를 읽어온다.
        apiResult1 = kakaoLoginBO.getUserProfile(oauthToken);
        
        JSONParser jsonParser = new JSONParser();
        JSONObject jsonObj;
        
        jsonObj = (JSONObject) jsonParser.parse(apiResult1);
        JSONObject response_obj = (JSONObject) jsonObj.get("kakao_account");
        JSONObject response_obj2 = (JSONObject) response_obj.get("profile");
        // 프로필 조회
        String email = (String) response_obj.get("email");
        String name = (String) response_obj2.get("nickname");
        // 세션에 사용자 정보 등록
        // session.setAttribute("islogin_r", "Y");
        session.setAttribute("signIn", apiResult1);
        session.setAttribute("email", email);
        session.setAttribute("userId", name);
        
        /* 네이버 로그인 성공 페이지 View 호출 */

//      session.setAttribute("login",vo);
//      return new ModelAndView("user/loginPost", "result", vo);
        
        return "redirect:/main/main";
    }
}
