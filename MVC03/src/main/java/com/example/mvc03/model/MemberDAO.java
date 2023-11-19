package com.example.mvc03.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class MemberDAO {
    // 자바와 db를 연결하기 위한 객체 JDBC Connection
    private Connection conn;
    // 동적으로 sql 처리 , Statement와 차이점은 캐시 사용 유무이다. PreparedStatement는 객체를 캐시에 담아 재사용 , 성능이 더 좋다, 보안적인 문제도 더 좋다
    private PreparedStatement ps;
    // db에 있는 데이터를 가지고와 저장해 놓을 수 있는 객체
    private ResultSet rs;

    // db 연결 객체 생성
    public void getConnect(){
        String URL = "jdbc:mysql://localhost:3306/kky";
        String user = "testuser";
        String password = "test1234";
        // MySQL Driver 로딩
        try {
            Class.forName("com.mysql.cj.jdbc.Driver"); // 동적 로딩
            conn = DriverManager.getConnection(URL, user, password);
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    // 회원 저장 동작
    public int memberInsert(MemberVO vo) {
        // ?는 파라미터
        String SQL = "insert into member(id, pass, name, age, email, phone) values(?,?,?,?,?,?)";
        getConnect();
        int cnt = -1;
        // SQL 문장 전송하는 객체 생성
        try {
            ps = conn.prepareStatement(SQL);
            ps.setString(1, vo.getId());
            ps.setString(2, vo.getPass());
            ps.setString(3, vo.getName());
            ps.setInt(4, vo.getAge());
            ps.setString(5, vo.getEmail());
            ps.setString(6, vo.getPhone());

            // 성공하면 1, 실패하면 0, 전송 - ps를 미리 컴파일 시키고 마지막에 ps가 가지고 있는 SQL 실행
            cnt = ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            dbClose();
        }
        return cnt;// 1 or O
    }

    // 멤버 리스트 불러오기
    public ArrayList<MemberVO> memberList(){
        String SQL = "select * from member";
        getConnect();
        ArrayList<MemberVO> list = new ArrayList<>();
        try {
            ps = conn.prepareStatement(SQL);
            rs = ps.executeQuery();
            while (rs.next()) {
                int num = rs.getInt("num");
                String id = rs.getString("id");
                String pass = rs.getString("pass");
                String name = rs.getString("name");
                int age = rs.getInt("age");
                String email = rs.getString("email");
                String phone = rs.getString("phone");

                MemberVO VO = new MemberVO(num, id, pass, name, age, email, phone);
                list.add(VO);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            dbClose();
        }
        return list;

    }

    // db 연결 끊기
    public void dbClose() {
        try {
            rs.close();
            ps.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // 삭제
    public int memberDelete(int num) {
        String SQL = "delete from member where num=?";
        getConnect();
        int cnt = -1;
        try {
            ps = conn.prepareStatement(SQL);
            ps.setInt(1, num);
            cnt = ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            dbClose();
        }
    return cnt;
    }

    public MemberVO memberContent(int num) {
        String SQL = "select * from member where num=?";
        getConnect();
        MemberVO vo = null;

        try {
            ps = conn.prepareStatement(SQL);
            ps.setInt(1,num);
            rs = ps.executeQuery();
            while (rs.next()) {
                num = rs.getInt("num");
                String id = rs.getString("id");
                String pass = rs.getString("pass");
                String name = rs.getString("name");
                int age = rs.getInt("age");
                String email = rs.getString("email");
                String phone = rs.getString("phone");

                vo = new MemberVO(num, id, pass, name, age, email, phone);

            }
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            dbClose();
        }
        return vo;
    }

    public int memberUpdate(MemberVO vo) {
        String SQL = "update member set age=?, email=?, phone=? where num=?";
        getConnect();
        int cnt = -1;
        try {
            ps = conn.prepareStatement(SQL);
            ps.setInt(1,vo.getAge());
            ps.setString(2,vo.getEmail());
            ps.setString(3,vo.getPhone());
            ps.setInt(4,vo.getNum());
            cnt = ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            dbClose();
        }
        return cnt;
    }


}
