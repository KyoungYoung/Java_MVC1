package com.example.mvc02.model;


import lombok.*;

@Getter @Setter @ToString @NoArgsConstructor @AllArgsConstructor
public class MemberVO {
    private int num;
    private String id;
    private String pass;
    private String name;
    private int age;
    private String email;
    private String phone;

    public MemberVO(String id, String pass, String name, int age, String email, String phone) {
        this.id = id;
        this.pass = pass;
        this.name = name;
        this.age = age;
        this.email = email;
        this.phone = phone;
    }
}
