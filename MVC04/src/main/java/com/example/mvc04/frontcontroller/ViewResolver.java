package com.example.mvc04.frontcontroller;

public class ViewResolver {
    public static String makeView(String nextPage) {
        return "/WEB-INF/view/" + nextPage + ".jsp";
    }
}
