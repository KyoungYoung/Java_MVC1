package com.example.mvc03.controller;

import com.example.mvc03.model.MemberDAO;
import com.example.mvc03.model.MemberVO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/memberUpdate.do")
public class MemberUpdateController extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
// HTML이 UTF-8 형식이라는 것을 브라우저에게 전달
        resp.setContentType("text/html; charset=utf-8");
        int num = Integer.parseInt(req.getParameter("num"));
        int age = Integer.parseInt(req.getParameter("age"));
        String email = req.getParameter("email");
        String phone = req.getParameter("phone");

        MemberDAO dao = new MemberDAO();
        MemberVO vo = new MemberVO();

        vo.setNum(num);
        vo.setAge(age);
        vo.setEmail(email);
        vo.setPhone(phone);

        int cnt = dao.memberUpdate(vo);
        if (cnt > 0) {
            resp.sendRedirect("memberList.do");
        } else {
            throw new ServletException("not update");
        }
    }
}
