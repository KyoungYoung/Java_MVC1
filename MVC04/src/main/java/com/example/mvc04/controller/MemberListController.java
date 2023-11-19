package com.example.mvc04.controller;

import com.example.mvc04.model.MemberDAO;
import com.example.mvc04.model.MemberVO;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class MemberListController implements Controller {

    @Override
    public String requestHandler(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        // HTML이 UTF-8 형식이라는 것을 브라우저에게 전달
        response.setContentType("text/html; charset=utf-8");

        // POJO가 해야할 일의 범위
        // 1. Model 연동
        MemberDAO dao = new MemberDAO();
        List<MemberVO> list = dao.memberList();
        // 2. 객체 바인딩
        request.setAttribute("list", list);
        // 3.다음 페이지 정보(view)
        return "memberList"; //뷰의 이름만 리턴
//        return "/WEB-INF/view/memberList.jsp";
    }
}
