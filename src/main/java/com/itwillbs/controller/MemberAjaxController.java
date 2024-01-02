package com.itwillbs.controller;

import com.itwillbs.domain.MemberDTO;
import com.itwillbs.service.MainService;
import com.itwillbs.service.MemberService;
import com.itwillbs.team.HomeController;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import javax.inject.Inject;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import java.util.Random;

@RestController
public class MemberAjaxController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	// MemberService 객체 생성
	@Inject
	private MemberService memberService;
	
	@Autowired
	private JavaMailSender mailSender;
	
	@Inject
	private MainService mainService;
	
	// '${pageContext.request.contextPath }/member/idCheck' 가상주소
	// 주소 매핑 처리 => 처리결과 출력
	@RequestMapping(value = "/member/useridCheck", method = RequestMethod.GET)	
	public ResponseEntity<String> useridCheck(HttpServletRequest request) {
		String result="";
		
		String id = request.getParameter("userId");
		// MemberDTO dto = getMember()메서드 호출
		MemberDTO dto = memberService.userGetMember(id);
		if(dto != null) {
			// 아이디 있음 => 아이디 중복
			result = "iddup";
		}else {
			// 아이디 없음 => 아이디 사용가능
			result = "idok";
		}
		
		// ResponseEntity에 출력 결과를 담아서 리턴
		ResponseEntity<String> entity = new ResponseEntity<String>(result, HttpStatus.OK);
		return entity; // 결과 리턴
	}
	
	/* 이메일 인증 */
	@RequestMapping(value="/member/mailCheck", method=RequestMethod.GET)
	@ResponseBody
	public String mailCheckGET(String email) throws Exception {
		
		/* 뷰(View)로부터 넘어온 데이터 확인 */
		System.out.println("여긴 mailcheck : " + email);
		logger.info("이메일 데이터 전송 확인");
		logger.info("인증번호 : " + email);
		
		/* 인증번호(난수) 생성 */
		Random random = new Random();
		int checkNum = random.nextInt(888888) + 111111;
		logger.info("인증번호 " + checkNum);
		
		/* 이메일 보내기 */
        String setFrom = "rudzkcb@naver.com"; // 자신의 이메일 아이디
        String toMail = email;
        String title = "회원가입 인증 이메일 입니다.";
        String content = 
                "홈페이지를 방문해주셔서 감사합니다." +
                "<br><br>" + 
                "인증 번호는 " + checkNum + "입니다." + 
                "<br>" + 
                "해당 인증번호를 인증번호 확인란에 기입하여 주세요.";
        
		try {
            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
            helper.setFrom(setFrom);
            helper.setTo(toMail);
            helper.setSubject(title);
            helper.setText(content,true);
            mailSender.send(message);
            
        } catch(Exception e) {
        	
            e.printStackTrace();
            
		}
		
		String num = Integer.toString(checkNum);
		
		return num;
		
	} // mailCheckGET
	
}
	
