package com.example.mvc03.controller;

import com.example.mvc03.model.MemberDAO;
import com.example.mvc03.model.MemberVO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/memberContent.do")
public class MemberContentController extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        // HTML이 UTF-8 형식이라는 것을 브라우저에게 전달
        resp.setContentType("text/html; charset=utf-8");

        int num = Integer.parseInt(req.getParameter("num"));
        MemberDAO dao = new MemberDAO();
        MemberVO vo = dao.memberContent(num);

        // 객체 바인딩
        req.setAttribute("vo",vo);
        RequestDispatcher dis = req.getRequestDispatcher("/view/memberContent.jsp");
        dis.forward(req,resp);
    }
}
