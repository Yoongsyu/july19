package com.yoong.pro1;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.inject.Named;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("boardService")
public class BoardService {

	@Inject
	@Named("boardDAO")
	private BoardDAO boardDAO;
	
	@Autowired
	private Util util;
	

	// 보드 리스트 불러오는 메소드
	public List<Map<String, Object>> boardList() {
		return boardDAO.boardList();
	}

	public BoardDTO detail(String bno) {
		BoardDTO dto = boardDAO.detail(bno);
		// 172.30.1.35 --> 172.♡.1.19
		if (dto.getBip() != null && dto.getBip().indexOf(".") != -1) {
			String ip = dto.getBip();
			String[] ipArr = ip.split("\\.");
			ipArr[1] = "♡";
			dto.setBip(String.join(".", ipArr));
		}
		return dto;

	}

	// 글쓰기 입니다
	public void write(BoardDTO dto) {
		//btitle을 꺼내줍니다
		//dto.getBtitle();
		String btitle = dto.getBtitle();
		//값을 변경하겠습니다 replace() '<' -> &lt; '>'-> &gt;
		
		//dto.setBtitle(dto.getBtitle().replaceAll("<", "&lt;").replaceAll(">", "&gt;"));
		
		btitle = util.exchange(btitle);
		
		//다시 저장해주세요
		dto.setBtitle(btitle);
		
		dto.setBip(util.getIp()); // 얻어온 ip도 저장해서 데이터베이스로 보냄
		
		boardDAO.write(dto);
		// 실행만 시키고 결과를 받지 않습니다
		// select를 제외한 나머지는 영향받은 행의 수 (int)를 받아오기도 합니다
	}
	
	public void delete(BoardDTO dto) {
		boardDAO.delete(dto);
		
	}

}
