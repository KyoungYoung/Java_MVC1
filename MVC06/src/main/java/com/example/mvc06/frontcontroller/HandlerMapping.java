package com.example.mvc06.frontcontroller;

import com.example.mvc06.controller.*;
import com.example.mvc06.controller.Controller;

import java.util.HashMap;

public class HandlerMapping {
    private HashMap<String, Controller> mappings;
    public HandlerMapping() {
        mappings = new HashMap<String, Controller>();
        // key, value
        mappings.put("/memberList.do", new MemberListController());
        mappings.put("/memberInsert.do", new MemberInsertController());
        mappings.put("/memberRegister.do", new MemberRegisterController());
        mappings.put("/memberUpdate.do", new MemberUpdateController());
        mappings.put("/memberDelete.do", new MemberDeleteController());
        mappings.put("/memberContent.do", new MemberContentController());
        mappings.put("/memberLogin.do", new MemberLoginController());
        mappings.put("/memberLogout.do", new MemberLogoutController());
        mappings.put("/memberDbcheck.do", new MemberDbcheckController());
    }
    public Controller getController(String key) {
        return mappings.get(key);
    }
}
