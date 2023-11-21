package com.example.mvc06.controller;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class MemberLogoutController implements Controller {
    @Override
    public String requestHandler(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 세션 가져와 세션 제거
        // 세션 제거하는 방법
        // 1. 강제
        String ctx = request.getContextPath();
        request.getSession().invalidate();
        // 2. 브라우저를 종료하는 겂 (JSSESSIONID 브라우저 쿠키에 저장)
        // 3.세션이 종료될 때 까지 기다리는것 (세션 타임아웃) 30분이 기본
        return "redirect:" + ctx + "/memberList.do";
    }
}
