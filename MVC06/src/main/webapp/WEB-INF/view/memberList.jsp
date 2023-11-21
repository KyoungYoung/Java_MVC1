<%@ page import="com.example.mvc06.model.MemberDAO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.mvc06.model.MemberVO" %>
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
  <!-- Latest compiled and minified CSS -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

  <!-- jQuery library -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

  <!-- Latest compiled JavaScript -->
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
  <script>
    $(document).ready(()=>{
      <c:if test="${!empty msg}">
        alert("${msg}");
        <c:remove var="msg" scope="session"/>
      </c:if>
    })

    function deleteFn(num) {
      location.href = `${ctx}/memberDelete.do?num=\${num}`
    }
    function check(){
      if ($('#user_id').val() == '') {
        alert("아이디를 입력하세요");
        return false;
      }
      if ($('#password').val() == '') {
        alert("비밀번호를 입력하세요");
        return false;
      }
      return true;
    }

    function logout() {
      location.href="<c:url value='/memberLogout.do' />" ;
    }

    function memberList() {
      let html = "<table class='table table-hover'>";
      html += "<tr>";
      html += "<th>번호</th>";
      html += "<th>아이디</th>";
      html += "<th>비밀번호</th>";
      html += "<th>이름</th>";
      html += "<th>나이</th>";
      html += "<th>이메일</th>";
      html += "<th>전화번호</th>";
      html += "<th>삭제</th>";
      html += "</tr>";
      html += "</table>";
      $("collapse1 .panel-body").html(html);
    }
  </script>
</head>
<body>
<div class="container">
  <h2>회원관리시스템</h2>
  <div class="panel panel-default">
    <div class="panel-heading">
      <c:if test="${sessionScope.userId==null || sessionScope.userId==''}">

      <form class="form-inline" action="${ctx}/memberLogin.do" method="post">
        <div class="form-group">
          <label for="user_id">ID:</label>
          <input type="text" class="form-control" id="user_id" name="user_id">
        </div>
        <div class="form-group">
          <label for="password">Password:</label>
          <input type="password" class="form-control" id="password" name="password">
        </div>

        <button type="submit" class="btn btn-default" onclick="return check()">로그인</button>
      </form>
      </c:if>
      <c:if test="${sessionScope.userId!=null && sessionScope.userId!=''}">

        ${sessionScope.userName}님 환영합니다
        <button type="button" class="btn btn-warning" onclick="logout()">로그아웃</button>
      </c:if>
    </div>
    <div class="panel-body">
      <div class="table-responsive">
        <table class="table table-hover">
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
              <td>${vo.pass}</td>
              <td>${vo.name}</td>
              <td>${vo.age}</td>
              <td>${vo.email}</td>
              <td>${vo.phone}</td>

              <c:if test="${sessionScope.userId==vo.id}">
                <td><input type="button" value="삭제" class="btn btn-warning" onclick="deleteFn(${vo.num})"></td>
              </c:if>
              <c:if test="${sessionScope.userId!=vo.id}">
                <td><input type="button" value="삭제" class="btn btn-warning" onclick="deleteFn(${vo.num})" disabled></td>
              </c:if>
            </tr>
          </c:forEach>
          <tr>
            <td colspan="8" align="right">
              <input type="button" value="회원가입" class="btn btn-primary" onclick="location.href='${ctx}/memberRegister.do'" >
            </td>
          </tr>
          </tbody>
        </table>
      </div>
     </div>
    <div class="panel-footer">
      회원관리 erp system
    </div>
  </div>

  <div class="panel-group">
    <div class="panel panel-default">
      <div class="panel-heading">
        <h4 class="panel-title">
          <a data-toggle="collapse"  onclick="memberList()">회원리스트보기</a>
        </h4>
      </div>
      <div id="collapse1" class="panel-collapse collapse">
        <div class="panel-body">Panel Body</div>
        <div class="panel-footer">Panel Footer</div>
      </div>
    </div>
  </div>
</div>
</body>
</html>