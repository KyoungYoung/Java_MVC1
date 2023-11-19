package com.example.mvc01.controller;

import com.example.mvc01.model.MemberDAO;
import com.example.mvc01.model.MemberVO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

@WebServlet("/memberList.do")
public class MemberListController extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 1. 클라이언트 요청 받기 (memberList.do)
        req.setCharacterEncoding("utf-8");
// HTML이 UTF-8 형식이라는 것을 브라우저에게 전달
        resp.setContentType("text/html; charset=utf-8");
        // 2. 회원 전체 리스트 가져오기 (Model 연동)
        MemberDAO dao = new MemberDAO();
        ArrayList<MemberVO> list = dao.memberList();

        // 3. 회원 전체 리스트를 html로 만들기
        PrintWriter out = resp.getWriter();

    }
}
