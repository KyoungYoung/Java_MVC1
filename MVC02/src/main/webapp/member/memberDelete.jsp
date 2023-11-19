<%@ page import="com.example.mvc02.model.MemberDAO" %><%--
  Created by IntelliJ IDEA.
  User: kky
  Date: 2023/11/16
  Time: 9:03 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    int num = Integer.parseInt(request.getParameter("num"));

    MemberDAO dao = new MemberDAO();
    int cnt = dao.memberDelete(num);
    if (cnt > 0) {
        response.sendRedirect("memberList.jsp");
    } else {
        throw new ServletException();
    }
%>
<html>
<head>
    <title>삭제</title>
</head>
<body>

</body>
</html>
