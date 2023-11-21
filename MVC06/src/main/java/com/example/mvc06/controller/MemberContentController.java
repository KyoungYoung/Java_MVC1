package com.example.mvc06.controller;

import com.example.mvc06.model.MemberDAO;
import com.example.mvc06.model.MemberVO;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class MemberContentController implements Controller{
    @Override
    public String requestHandler(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        // HTML이 UTF-8 형식이라는 것을 브라우저에게 전달
        response.setContentType("text/html; charset=utf-8");
        int num = Integer.parseInt(request.getParameter("num"));
        MemberDAO dao = new MemberDAO();
        MemberVO vo = dao.memberContent(num);

        // 객체 바인딩
        request.setAttribute("vo", vo);
        return "memberContent"; //뷰의 이름만 리턴
//        return "/WEB-INF/view/memberContent.jsp";
    }
}
