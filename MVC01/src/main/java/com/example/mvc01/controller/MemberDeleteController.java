package com.example.mvc01.controller;

import com.example.mvc01.model.MemberDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/memberDelete.do")
public class MemberDeleteController extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int num = Integer.parseInt(req.getParameter("num"));
        MemberDAO dao = new MemberDAO();
        int cnt = dao.memberDelete(num);
        if (cnt > 0) {
            resp.sendRedirect("/MVC01/member/memberList.do");
        }else {
            throw new ServletException("not delete");
        }
    }
}

