package com.example.mvc06.model;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

public class MemberDAO {
    private static SqlSessionFactory sqlSessionFactory;

    // 초기화 블록, 프로그램 실행 시 딱 1번만 실행되는 코드영역
    static {
        try {
            String resource = "com/example/mvc06/mybatis/config.xml";
            InputStream inputStream = Resources.getResourceAsStream(resource);
            sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
        } catch (IOException e) {
            e.printStackTrace();

        }
    }
    // 회원 전체 리스트 보기
    public List<MemberVO> memberList() {
        // sqlSessionFactory에서 커녁센 꺼내기
        // Connetion+Statement -> Sqlsession
        SqlSession session = sqlSessionFactory.openSession();
        // session.selectList("SQL문장과 관련된?") - Mapper 파일의 SQL을 넣어주기
        // Mapper 파일의 id값 메서드 이름으로 지정하는게 대부분
        List<MemberVO> list = session.selectList("memberList");
        session.close(); // 커넥션 반납
        return list;
    }

    // 회원 가입
    public int memberInsert(MemberVO vo) {
        SqlSession session = sqlSessionFactory.openSession();
        int cnt = session.insert("memberInsert", vo);
        session.commit();
        session.close();
        return cnt;
    }

    public int memberDelete(int num) {
        SqlSession session = sqlSessionFactory.openSession();
        int cnt = session.delete("memberDelete", num);
        session.commit();
        session.close();
        return cnt;
    }
    public MemberVO memberContent(int num) {
        SqlSession session = sqlSessionFactory.openSession();
        MemberVO vo = session.selectOne("memberContent", num);
        session.close();
        return vo;

    }

    public int memberUpdate(MemberVO vo) {
        SqlSession session = sqlSessionFactory.openSession();
        int cnt = session.update("memberUpdate", vo);
        session.commit();
        session.close();
        return cnt;
    }

    public String memberLogin(MemberVO vo) {
        SqlSession session = sqlSessionFactory.openSession();
        String user_name = session.selectOne("memberLogin", vo);
        session.close();
        return user_name;
    }

    public String memberDbcheck(String id) {
        SqlSession session = sqlSessionFactory.openSession();
        String dbId = session.selectOne("memberDbcheck", id);
        String idDouble = "NO";
        if (dbId != null) {
            idDouble = "YES";
        }
        return idDouble;
    }


}




