package com.example.mvc05.frontcontroller;

public class ViewResolver {
    public static String makeView(String nextPage) {
        return "/WEB-INF/view/" + nextPage + ".jsp";
    }
}
