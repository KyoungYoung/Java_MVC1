<%@ page import="com.example.mvc06.model.MemberDAO" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="com.example.mvc06.model.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>상세보기</title>
</head>
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
    function update() {
        document.form1.action="<c:url value='/memberUpdate.do'/> "
        document.form1.submit();
    }

    function frmreset() {
        document.form1.reset();
    }
</script>
<body>
<div class="container">
    <h2>회원관리 시스템</h2>
    <div class="panel panel-default">
        <div class="panel-heading">
            <c:if test="${sessionScope.userId!=null && sessionScope.userId!=''}">
                <label>${sessionScope.userName}님 환영합니다.</label>
            </c:if>
            <c:if test="${sessionScope.userId==null || sessionScope.userId==''}">
                <label>안녕하세요</label>
            </c:if>
        </div>

        <div class="panel-body">
            <form id="form1" name="form1" class="form-horizontal"  method="post">
                <input type="hidden" name="num" value="${vo.num}">
            <div class="form-group">
                <label class="control-Label col-sm-2">번호:</label>
                <div class="col-sm-10">
                    <c:out value="${vo.num}"/>
                </div>
            </div>
            <div class="form-group">
                <label class="control-Label col-sm-2">아이디:</label>
                <div class="col-sm-10">
                    <c:out value="${vo.id}"/>
                </div>
            </div>
            <div class="form-group">
                <label class="control-Label col-sm-2">비밀번호:</label>
                <div class="col-sm-10">
                    <c:out value="${vo.pass}"/>
                </div>
            </div>
            <div class="form-group">
                <label class="control-Label col-sm-2">이름:</label>
                <div class="col-sm-10">
                    <c:out value="${vo.name}"/>
                </div>
            </div>
            <div class="form-group">
                <label class="control-Label col-sm-2">나이:</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="age" name="age" value="${vo.age}"/>
<%--                    <c:out value="${vo.age}"/>--%>
                </div>
            </div>
            <div class="form-group">
                <label class="control-Label col-sm-2">이메일:</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="email" name="email" value="${vo.email}">
<%--                    <c:out value="${vo.email}"/>--%>
                </div>
            </div>
            <div class="form-group">
                <label class="control-Label col-sm-2">전화번호:</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="phone" name="phone" value="${vo.phone}">
<%--                    <c:out value="${vo.phone}"/>--%>
                </div>
            </div>
            </form>
        </div>
        <div class="panel-footer" style="text-align: center">
            <c:if test="${!empty sessionScope.userId}">
                <c:if test="${sessionScope.userId==vo.id}">
                    <input type="button" value="수정하기" class="btn btn-primary" onclick="update()">
                </c:if>
                <c:if test="${sessionScope.userId!=vo.id}">
                    <input type="button" value="수정하기" class="btn btn-primary" onclick="update()" disabled>
                </c:if>
            </c:if>


            <input type="button" value="취소하기" class="btn btn-warning" onclick="frmreset()">
            <input type="button" value="목록가기" onclick="location.href='${ctx}/memberList.do'" class="btn btn-success">
        </div>
    </div>
</div>
</body>
</html>
