package com.example.mvc05.controller;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public interface Controller {
    // 모든 POJO가 가지고 있어야하는 메서드
    // 리턴타입이 String으로 바뀜 - 다음 페이지 정보
    public String requestHandler(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException;

}
