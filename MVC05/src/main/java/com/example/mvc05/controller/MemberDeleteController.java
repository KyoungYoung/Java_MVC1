package com.example.mvc05.controller;

import com.example.mvc05.model.MemberDAO;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class MemberDeleteController implements Controller{
    @Override
    public String requestHandler(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        // HTML이 UTF-8 형식이라는 것을 브라우저에게 전달
        response.setContentType("text/html; charset=utf-8");
        String ctx = request.getContextPath();
        int num = Integer.parseInt(request.getParameter("num"));
        MemberDAO dao = new MemberDAO();
        int cnt = dao.memberDelete(num);
        String nextPage = null;
        if (cnt > 0) {
            nextPage = "redirect:"+ ctx +"/memberList.do";
        } else {
            throw new ServletException("not delete");
        }
        return nextPage;
    }
}
