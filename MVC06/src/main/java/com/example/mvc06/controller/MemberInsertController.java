package com.example.mvc06.controller;

import com.example.mvc06.model.MemberDAO;
import com.example.mvc06.model.MemberVO;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class MemberInsertController implements Controller{
    @Override
    public String requestHandler(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        // HTML이 UTF-8 형식이라는 것을 브라우저에게 전달
        response.setContentType("text/html; charset=utf-8");
        String ctx = request.getContextPath();
        String id = request.getParameter("id");
        String pass = request.getParameter("password");
        String name = request.getParameter("name");
        int age = Integer.parseInt(request.getParameter("age"));
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");

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
        String nextPage = null;
        if (cnt > 0) {
            nextPage = "redirect:"+ctx+"/memberList.do";
            // 성공

        } else {
            // 실패
            throw new ServletException("not insert");
        }
        return nextPage;
    }
}
