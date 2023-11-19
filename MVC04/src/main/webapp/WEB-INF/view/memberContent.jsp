<%@ page import="com.example.mvc04.model.MemberDAO" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="com.example.mvc04.model.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>상세보기</title>
</head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<body>
<form action="${ctx}/memberUpdate.do" method="post">
    <input type="hidden" name="num" value="${vo.num}">
<table class="table table-bordered">

    <c:if test="${vo != null}">


    <tr>
        <td colspan="7">${vo.name}회원의 상세보기</td>
    </tr>
    <tr>
        <td>번호</td>
        <td>${vo.num}</td>
    </tr>
    <tr>
        <td>아이디</td>
        <td>${vo.id}</td>
    </tr>
    <tr>
        <td>비밀번호</td>
        <td>${vo.pass}</td>
    </tr>
    <tr>
        <td>이름</td>
        <td>${vo.name}</td>
    </tr>
    <tr>
        <td>나이</td>
        <td><input type="text" name="age" value="${vo.age}"></td>
    </tr>
    <tr>
        <td>이메일</td>
        <td><input type="text" name="email" value="${vo.email}"></td>
    </tr>
    <tr>
        <td>전화번호</td>
        <td><input type="text" name="phone" value="${vo.phone}"></td>
    </tr>
    </c:if>
    <c:if test="${vo==null}">


    <tr>
        <td>일치하는 회원이 없습니다</td>
    </tr>
    </c:if>
    <tr>
        <td colspan="2" align="center">
            <input type="submit" value="수정하기" class="btn btn-primary">
            <input type="reset" value="취소하기" class="btn btn-warning">
            <input type="button" value="목록가기" onclick="location.href='${ctx}/memberList.do'" class="btn">
        </td>
    </tr>
</table>
</form>
</body>
</html>
