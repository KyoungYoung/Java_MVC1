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
import java.io.PrintWriter;

@WebServlet("/memberInsert.do")
public class MemberInsertController extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
// HTML이 UTF-8 형식이라는 것을 브라우저에게 전달
        resp.setContentType("text/html; charset=utf-8");
        String id = req.getParameter("id");
        String pass = req.getParameter("password");
        String name = req.getParameter("name");
        int age = Integer.parseInt(req.getParameter("age"));
        String email = req.getParameter("email");
        String phone = req.getParameter("phone");


        MemberVO vo = new MemberVO();
        vo.setId(id);
        vo.setPass(pass);
        vo.setName(name);
        vo.setAge(age);
        vo.setEmail(email);
        vo.setPhone(phone);

        // Model과 연동부분
        MemberDAO dao = new MemberDAO();
        int cnt =dao.memberInsert(vo);
        if (cnt > 0) {
            // 성공
            resp.sendRedirect("/MVC03/memberList.do");
        } else {
            // 실패
            throw new ServletException("not insert");
        }

    }
}
