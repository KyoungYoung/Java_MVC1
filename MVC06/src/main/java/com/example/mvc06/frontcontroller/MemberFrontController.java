package com.example.mvc06.frontcontroller;

import com.example.mvc06.controller.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


// .do로 끝나는 경로는 여기 프론트 컨트롤러가 컨트롤하겠다라는 뜻
@WebServlet("*.do")
public class MemberFrontController extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // URL 나옴
        String url = req.getRequestURI();
        System.out.println(url);
        // ContextPath가 나옴 ex)/MVC04
        String ctx = req.getContextPath();
        System.out.println(ctx);
        // 실제로 요청한 명령이 무엇인지 파악
        String command = url.substring(ctx.length());
        System.out.println(command);
        Controller controller = null;
        String nextPage = null;

        // 요청에 따른 분기작업
        HandlerMapping mapping = new HandlerMapping();
        // command에는 url
        controller = mapping.getController(command);
        nextPage = controller.requestHandler(req, resp);

        // forward, redirect
        if (nextPage != null) {
            // -1이 아니면 있다는 뜻
            if (nextPage.indexOf("redirect:")!= -1) {
                // redirect:/MVC04/~~
                resp.sendRedirect(nextPage.split(":")[1]);
            }else {
                RequestDispatcher dis = req.getRequestDispatcher(ViewResolver.makeView(nextPage));
                dis.forward(req,resp);
            }
        }
    }
}
