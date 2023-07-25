package com.yoong.pro1;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class BoardController {
	// user -> Controller -> Service -> DAO -> mybatis -> DB

	// Autowired 말고 Resource로 연결
	@Resource(name = "boardService")
	private BoardService boardService;

	@Autowired
	private Util util; // 컴포넌트 Util과 연결했습니다

	@GetMapping("/board")
	public String board(Model model) {
		// 서비스에서 값 가져오기
		model.addAttribute("list", boardService.boardList());
		boardService.boardList();
		return "board";
	}

	// 파라미터로 들어오는 값 잡기
	@GetMapping("/detail")
	public String detail(HttpServletRequest request, Model model) {
		// String bno = request.getParameter("bno");
		int bno = util.strToInt(request.getParameter("bno"));
		// bno에 요청하는 값이 있습니다 이 값을 db까지 보내겠습니다
		// System.out.println("bno : " + bno);

		// DTO로 변경합니다
		BoardDTO dto = new BoardDTO();
		dto.setBno(bno);

		BoardDTO result = boardService.detail(dto);
		model.addAttribute("dto", result);
		return "detail";
	}

	@GetMapping("/write")
	public String write(HttpServletRequest request) {
		HttpSession session = request.getSession();
		if (session.getAttribute("mname") != null) {
			return "write";
		} else {
			return "redirect:/login"; // 슬러시 넣어주세요
		}

	}

	@PostMapping("/write")
	public String write2(HttpServletRequest request) { // 메소드명에 2를 넣어주세요

		HttpSession session = request.getSession();
		if (session.getAttribute("mid") != null) {
			// 로그인 했습니다 = 아래 로직을 여기로 가져오세요
			// 사용자가 입력한 데이터 변수에 담기
			BoardDTO dto = new BoardDTO();
			dto.setBtitle(request.getParameter("title"));
			dto.setBcontent(request.getParameter("content"));
			// 세션에서 불러오겠습니다
			dto.setM_id((String) session.getAttribute("mid")); // 세션에서 가져옴
			dto.setM_name((String) session.getAttribute("mname")); // 세션에서 가져옴

			// Service -> DAO -> mybatis -> DB로 보내서 저장하기
			boardService.write(dto);
			return "redirect:board"; // 다시 컨트롤러 지나가기 / GET방식으로 지나갑니다

		} else {
			// 로그인 안 했어요 = 로그인 하세요
			return "redirect:/login";
		}

	}


	@GetMapping("/delete")
	// HttpServletRequest의 getParameter();
	public String delete(@RequestParam(value = "bno", required = true, defaultValue = "0") int bno, HttpSession session) {
		// System.out.println("bno : " + bno);
		// 로그인 여부 확인
		//System.out.println("mid : " + session.getAttribute("mid"));

		BoardDTO dto = new BoardDTO();
		dto.setBno(bno);
		dto.setM_id((String) session.getAttribute("mid"));
		// dto.setBwrite(null) 사용자 정보
		// 추후 로그인을 하면 사용자의 정보도 담아서 보냅니다

		boardService.delete(dto);

		return "redirect:board"; // 삭제를 완료한 후에 다시 보드로 갑니다
	}

	
	
	@GetMapping("/edit")
	public ModelAndView edit(HttpServletRequest request) {

		HttpSession session = request.getSession();
		ModelAndView mv = new ModelAndView("redirect:lgin"); // edit.jsp

		if (session.getAttribute("mid") != null) {
			// 데이터베이스에 bno를 보내서 dto를 얻어옵니다
			BoardDTO dto = new BoardDTO();
			dto.setBno(util.strToInt(request.getParameter("bno")));
			// 내글만 수정할 수 있도록 세션에 있는 mid도 보냅니다
			dto.setM_id((String) session.getAttribute("mid"));
			// mv에 실어보냅니다

			// 데이터베이스에 bno를 보내서 dto를 얻어옵니다.
			BoardDTO result = boardService.detail(dto);
			
			if(result != null) { // 내 글을 수정했습니다
				mv.addObject("dto", result);// mv에 실어 보냅니다
			mv.setViewName("edit"); // 이동할 jsp명을 적어줍니다
			} else {//다른 사람 글이라면 null
				mv.setViewName("warning");
			}
			
		} else {
			// 로그인 안했다 = login 컨트롤러
			mv.setViewName("redirect:/login");
		}
		return mv;
	}

	@PostMapping("/edit")
	public String edit(BoardDTO dto) {
		// System.out.println(dto.getBtitle());
		// System.out.println(dto.getBcontent());
		// System.out.println(dto.getBno());

		boardService.edit(dto);

		return "redirect:board?bno=" + dto.getBcontent(); // 보드로 이동하게 해주세요
	}

}
