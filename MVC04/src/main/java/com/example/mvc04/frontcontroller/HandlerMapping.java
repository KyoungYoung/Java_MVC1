package com.example.mvc04.frontcontroller;

import com.example.mvc04.controller.Controller;
import com.example.mvc04.controller.*;

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
    }
    public Controller getController(String key) {
        return mappings.get(key);
    }
}
