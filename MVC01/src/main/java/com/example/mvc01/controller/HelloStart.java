package com.example.mvc01.controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/h.do")
public class HelloStart extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int sum = 0;
        for (int i = 0; i < 11; i++) {
            sum += i;
        }
        PrintWriter out = resp.getWriter();
        out.println("<html>");
        out.println("<body>");
        out.println("<p>");
        out.println(sum);
        out.println("</p>");
        out.println("</body>");
        out.println("</html>");
    }
}
