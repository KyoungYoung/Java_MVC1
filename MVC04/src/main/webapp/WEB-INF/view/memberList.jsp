<%@ page import="com.example.mvc04.model.MemberDAO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.mvc04.model.MemberVO" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: kky
  Date: 2023/11/16
  Time: 8:22 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
  <title>Title</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
  <script>
    function deleteFn(num) {
      location.href = `${ctx}/memberDelete.do?num=\${num}`
    }
  </script>
</head>
<body>
<table class="table table-bordered">
  <thead>
  <tr>
    <th>번호</th>
    <th>아이디</th>
    <th>비밀번호</th>
    <th>이름</th>
    <th>나이</th>
    <th>이메일</th>
    <th>전화번호</th>
    <th>삭제</th>
  </tr>
  </thead>
  <tbody>
  <c:forEach var="vo" items="${list}">
    <tr>
      <td>${vo.num}</td>
      <td><a href="${ctx}/memberContent.do?num=${vo.num}">${vo.id}</a></td>
      <td>${vo.name}</td>
      <td>${vo.age}</td>
      <td>${vo.email}</td>
      <td>${vo.phone}</td>
      <td><input type="button" value="삭제" class="btn btn-warning" onclick="deleteFn(${vo.num})"></td>
    </tr>
  </c:forEach>

  <tr>
    <td colspan="7" align="right">
      <input type="button" value="회원가입" class="btn btn-primary" onclick="location.href='${ctx}/memberRegister.do'" >
    </td>
  </tr>
  </tbody>
</table>
</body>
</html>