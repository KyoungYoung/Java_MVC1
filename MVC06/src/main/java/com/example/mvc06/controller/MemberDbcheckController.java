package com.example.mvc06.controller;

import com.example.mvc06.model.MemberDAO;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class MemberDbcheckController implements Controller {
    @Override
    public String requestHandler(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        MemberDAO dao = new MemberDAO();
        String dbDouble = dao.memberDbcheck(id); //yes or no
        // ajax() 함수에 만들어놓은 callback함수로 응답
        response.getWriter().print(dbDouble);

        return null;
    }
}
