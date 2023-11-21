package com.example.mvc06.controller;

import com.example.mvc06.model.MemberDAO;
import com.example.mvc06.model.MemberVO;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class MemberUpdateController implements Controller{

    @Override
    public String requestHandler(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        // HTML이 UTF-8 형식이라는 것을 브라우저에게 전달
        response.setContentType("text/html; charset=utf-8");
        String ctx = request.getContextPath();
        int num = Integer.parseInt(request.getParameter("num"));
        int age = Integer.parseInt(request.getParameter("age"));
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");

        MemberDAO dao = new MemberDAO();
        MemberVO vo = new MemberVO();

        vo.setNum(num);
        vo.setAge(age);
        vo.setEmail(email);
        vo.setPhone(phone);

        int cnt = dao.memberUpdate(vo);
        String nextPage = null;
        if (cnt > 0) {
            nextPage = "redirect:"+ctx+"/memberList.do";
        } else {
            throw new ServletException("not update");
        }
        return nextPage;
    }
}
