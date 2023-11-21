package com.example.mvc06.controller;

import com.example.mvc06.model.MemberDAO;
import com.example.mvc06.model.MemberVO;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class MemberLoginController implements Controller {
    @Override
    public String requestHandler(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        // HTML이 UTF-8 형식이라는 것을 브라우저에게 전달
        response.setContentType("text/html; charset=utf-8");
        String ctx = request.getContextPath();
        String user_id = request.getParameter("user_id");
        String password = request.getParameter("password");

        MemberVO vo = new MemberVO();
        vo.setId(user_id);
        vo.setPass(password);

        MemberDAO dao = new MemberDAO();
        String user_name = dao.memberLogin(vo); // 구현

        //user_name에 값이 있으면 인증 성공, 없으면 회원인증이 실패한거다
        if (user_name != null && !"".equals(user_name)) {
            //성공
            HttpSession session = request.getSession();
            session.setAttribute("userId",user_id);
            session.setAttribute("userName",user_name);

        }else {
            // 실패
            request.getSession().setAttribute("userId","");
            request.getSession().setAttribute("userName","");
            request.getSession().setAttribute("msg","사용자 정보가 올바르지 않습니다.");
        }
        return "redirect:" + ctx + "/memberList.do";


    }
}
