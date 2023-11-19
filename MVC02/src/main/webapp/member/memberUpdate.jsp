<%@ page import="com.example.mvc02.model.MemberVO" %>
<%@ page import="com.example.mvc02.model.MemberDAO" %><%--
  Created by IntelliJ IDEA.
  User: kky
  Date: 2023/11/16
  Time: 9:26 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  request.setCharacterEncoding("utf-8");
  int num = Integer.parseInt(request.getParameter("num"));
  int age = Integer.parseInt(request.getParameter("age"));
  String email = request.getParameter("email");
  String phone = request.getParameter("phone");

  MemberDAO dao = new MemberDAO();
  MemberVO vo = new MemberVO();

  vo.setNum(num);
  vo.setAge(age);
  vo.setEmail(email);
  vo.setPhone(phone);

  int cnt = dao.memberUpdate(vo);
  if (cnt > 0) {
    response.sendRedirect("memberList.jsp");
  } else {
    throw new ServletException("not update");
  }
%>
<html>
<head>
    <title>수정</title>
</head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<body>

</body>
</html>
