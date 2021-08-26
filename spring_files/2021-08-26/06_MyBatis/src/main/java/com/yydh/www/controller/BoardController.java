package com.yydh.www.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.yydh.www.board.BoardDAO;
import com.yydh.www.board.BoardVO;

@Controller
public class BoardController {
	
	@Autowired
	BoardDAO boardDAO;
	
	@RequestMapping("/getBoardList.do")
	public String GetBoardList(BoardVO vo, Model model, HttpServletRequest request) {
		System.out.println("글 목록 검색 처리");
		
		String searchString = request.getParameter("searchKeyword");
		List<BoardVO> boardList = null;
		
		if(searchString != null) {
//			BoardDAO boardDAO = new BoardDAO();
			boardList = boardDAO.searchBoardList(searchString);
		} else {
			// 1. DB 연동 처리
//			BoardDAO boardDAO = new BoardDAO();
			boardList = boardDAO.getBoardList();
		}
		
		// 2. 검색 결과를 세션에 저장하고 목록 화면으로 이동
//		HttpSession session = request.getSession();
//		session.setAttribute("boardList", boardList);
//		response.sendRedirect("getBoardList.jsp");
		
		// ModelAndView로 결과 화면을 생성
//		ModelAndView mav = new ModelAndView();
//		mav.addObject("boardList", boardList); // Model 정보 저장
//		mav.setViewName("getBoardList"); // View 정보 저장 
		model.addAttribute("boardList", boardList);
		
		return "getBoardList";
	}
	
	@RequestMapping("/getBoard.do")
	public String GetBoard(BoardVO vo, Model model, HttpServletRequest request) {
		model.addAttribute("board", boardDAO.getBoard(vo.getSeq()));
		return "getBoard";
	}
	
	@RequestMapping("/insertBoard.do")
	public String InsertBoard(BoardVO vo, Model model) {
		System.out.println("글 등록 처리");
		boardDAO.insertBoard(vo);
		
		return "redirect:getBoardList.do";
	}
	
	@RequestMapping("/updateBoard.do")
	public String updateBoard(BoardVO vo, Model model) {
		System.out.println("글 수정 처리");
		boardDAO.updateBoard(vo);
		
		return "redirect:getBoardList.do";
	}
	
	@RequestMapping("/deleteBoard.do")
	public String deleteBoard(BoardVO vo, Model model) {
		System.out.println("글 삭제 처리");
		boardDAO.deleteBoard(vo.getSeq());
		
		return "redirect:getBoardList.do";
	}
}
