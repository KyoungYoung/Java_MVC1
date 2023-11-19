<%--
  Created by IntelliJ IDEA.
  User: kky
  Date: 2023/11/16
  Time: 7:56 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<body>
<h1 align="center">
  회원가입
</h1>
<form action="memberInsert.jsp" method="post">

  <table class="table table-bordred">
    <tr class="table-danger">
      <td>아이디</td>
      <td><input type="text" name="id"></td>
    </tr>
    <tr class="table-danger">
      <td>패스워드</td>
      <td><input type="text" name="password"></td>
    </tr>
    <tr class="table-danger">
      <td>이름</td>
      <td><input type="text" name="name"></td>
    </tr>
    <tr class="table-danger">
      <td>나이</td>
      <td><input type="text" name="age"></td>
    </tr>
    <tr class="table-danger">
      <td>이메일</td>
      <td><input type="text" name="email"></td>
    </tr>
    <tr class="table-danger">
      <td>전화번호</td>
      <td><input type="text" name="phone"></td>
    </tr>
    <tr class="table-danger" align="center">
      <td colspan="2">
        <input type="submit" value="가입" class="btn btn-warning">
        <input type="reset" value="취소" class="btn btn-info">
      </td>
    </tr>
  </table>
</form>
</body>
</html>
