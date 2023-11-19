<%@ page import="com.example.mvc02.model.MemberVO" %>
<%@ page import="com.example.mvc02.model.MemberDAO" %><%--
  Created by IntelliJ IDEA.
  User: kky
  Date: 2023/11/16
  Time: 7:58 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    // 파라미터 수집
    request.setCharacterEncoding("utf-8");
    String id = request.getParameter("id");
    String pass = request.getParameter("password");
    String name = request.getParameter("name");
    int age = Integer.parseInt(request.getParameter("age"));
    String email = request.getParameter("email");
    String phone = request.getParameter("phone");

    MemberVO vo = new MemberVO();
    vo.setId(id);
    vo.setPass(pass);
    vo.setName(name);
    vo.setAge(age);
    vo.setEmail(email);
    vo.setPhone(phone);

    MemberDAO dao = new MemberDAO();
    int cnt = dao.memberInsert(vo);
    if (cnt > 0) {
        response.sendRedirect("memberList.jsp");
    }else{
        throw new ServletException("not insert");
    }
%>
<html>
<head>
    <title>회원 등록</title>
</head>
<body>

</body>
</html>
