package com.yoong.pro1;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

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
		return "board";
	}

	// 파라미터로 들어오는 값 잡기
	@GetMapping("/detail")
	public String detail(HttpServletRequest request, Model model) {
		//String bno = request.getParameter("bno");
		int bno = util.strToInt(request.getParameter("bno"));
		// bno에 요청하는 값이 있습니다 이 값을 db까지 보내겠습니다
		// System.out.println("bno : " + bno);
		BoardDTO dto = boardService.detail(bno);
		model.addAttribute("dto", dto);
		return "detail";
	}

	@GetMapping("/write")
	public String write() {
		return "write";
	}

	@PostMapping("/write")
	public String write(HttpServletRequest request) {
		// 사용자가 입력한 데이터 변수에 담기
		BoardDTO dto = new BoardDTO();
		dto.setBtitle(request.getParameter("title"));
		dto.setBcontent(request.getParameter("content"));
		dto.setBwrite("마이크");

		// Service -> DAO -> mybatis -> DB로 보내서 저장하기
		boardService.write(dto);

		return "redirect:board"; // 다시 컨트롤러 지나가기 / GET방식으로 지나갑니다
	}

	
	@GetMapping("/delete")
	//					HttpServletRequest의 getParameter();
	public String delete(@RequestParam(value = "bno", required = true, defaultValue="0") int bno) {
		//System.out.println("bno : " + bno);
		//dto
		
		BoardDTO dto = new BoardDTO();
		dto.setBno(bno);
		// dto.setBwrite(null) 사용자 정보
		//추후 로그인을 하면 사용자의 정보도 담아서 보냅니다
		
		boardService.delete(dto);
		
		return "redirect:board"; // 삭제를 완료한 후에 다시 보드로 갑니다
		}
	
	@GetMapping("/edit")
	public ModelAndView edit(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("edit"); // edit.jsp
		//데이터베이스에 bno를 보내서 dto를 얻어옵니다
		BoardDTO dto = boardService.detail(util.strToInt(request.getParameter("bno")));
		//mv에 실어보냅니다
		mv.addObject("dto", dto);
		return mv;
	}
	
	@PostMapping("/edit")
	public String edit(BoardDTO dto) {
		//System.out.println(dto.getBtitle());
		//System.out.println(dto.getBcontent());
		//System.out.println(dto.getBno());
		
		boardService.edit(dto);
		
		return "redirect:board?bno="+dto.getBcontent(); // 보드로 이동하게 해주세요
	}

	
	}


