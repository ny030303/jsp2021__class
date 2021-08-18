package com.yydh.myapp;

import java.util.List;

public interface BoardService {
	void insertBoard(BoardVO vo);
	void UpdateBoard(BoardVO vo);
	void deleteBoard(BoardVO vo);
	BoardVO getBoard(int idx);
	List<BoardVO> getBoardList();
}
