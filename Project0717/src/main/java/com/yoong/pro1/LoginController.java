package com.yoong.pro1;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class LoginController {

	@Autowired
	private LoginService loginService;
	
	@GetMapping("/login")
	public String login() {
		return "login";
	}
	
	@PostMapping("/login")
	public String login(HttpServletRequest request) {
		//System.out.println(request.getParameter("id"));
		//System.out.println(request.getParameter("pw"));
		LoginDTO dto = new LoginDTO();
		dto.setM_id(request.getParameter("id"));
		dto.setM_pw(request.getParameter("pw"));
		//이름 + count(*)
		LoginDTO result = loginService.login(dto);
		
		//System.out.println(result.getM_name());
		//System.out.println(result.getCount());
		
		if(result.getCount() == 1) {
			//세션을 만들어서 로그인을 지정 시간동안 유지
			HttpSession session = request.getSession();
			session.setAttribute("mname", result.getM_name());
			session.setAttribute("mid", result.getM_id());
			
			
			return "redirect:index"; // 정상적으로 로그인 했다면 인덱스로 가기
		} else {
			return "login"; // 아이디/패스워드 일치하지 않으면 다시 로그인 하기
		}
		
	}
	
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		if(session.getAttribute("mname") != null) {
			//session.invalidate(); //세션 삭제
			session.removeAttribute("mname");
		}
		if(session.getAttribute("mid") != null) {
			//session.invalidate(); //세션 삭제
			session.removeAttribute("mid");
		}
		
		session.setMaxInactiveInterval(0); // 세션 유지시간을 0으로 = 종료시키기
		
		session.invalidate(); //세션 초기화 = 종료
		
		return "redirect:index";
	}
	
	
}
