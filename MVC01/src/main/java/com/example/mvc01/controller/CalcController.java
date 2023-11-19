package com.example.mvc01.controller;

import com.example.mvc01.model.MyCalc;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/calc.do")
public class CalcController extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
// HTML이 UTF-8 형식이라는 것을 브라우저에게 전달
        resp.setContentType("text/html; charset=utf-8");
        int su1 = Integer.parseInt(req.getParameter("su1"));
        int su2 = Integer.parseInt(req.getParameter("su2"));

        MyCalc c = new MyCalc();
        int result = c.hap(su1, su2);

        PrintWriter out = resp.getWriter();
        out.println("<html>");
        out.println("<body>");
        out.println("<h1>");
        out.println("h1에서 h2까지의 합은 = " + result);
        out.println("</h1>");
        out.println("</body>");
        out.println("</html>");
    }
}
