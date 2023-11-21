
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>Title</title>
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
  function add() {
    document.form1.action="<c:url value='/memberInsert.do'/> "
    document.form1.submit();
  }
  function frmreset() {
    document.form1.reset();
  }

  function doubleCheck() {
    if ($("#id").val() == '') {
      alert("아이디를 입력하세요");
      $("#id").focus();
      return;
    }
    var id = $("#id").val();
    $.ajax({
      url : "<c:url value="/memberDbcheck.do"/>",
      type : "POST",
      data : {"id":id},
      success : dbCheck,
      error : function (){alert("error!")}
    });
  }

  function dbCheck(data) {
    if (data != "NO") {
      alert("중복된 id");
      $("#id").focus();
    }else {
      alert("사용가능한 id");
      $("#id").focus();
    }
  }
</script>
<body>
<div class="container">
  <h2>회원가입</h2>
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
      <form id="form1" name="form1" class="form-horizontal" method="post">

        <div class="form-group">
          <label class="control-Label col-sm-2" for="id">아이디:</label>
          <div class="col-sm-10">
            <table>
              <tr>
                <td><input type="text" class="form-control" id="id" name="id" placeholder="아이디를 입력하세요"></td>
                <td><input type="button" value="중복체크" onclick="doubleCheck()" class="btn btn-warning"> </td>
              </tr>
            </table>
          </div>
        </div>

        <div class="form-group">
          <label class="control-Label col-sm-2" for="pass">비밀번호:</label>
          <div class="col-sm-10">
            <input type="text" class="form-control" id="pass" name="pass" placeholder="비밀번호를 입력하세요" style="width: 30%">
          </div>
        </div>

        <div class="form-group">
          <label class="control-Label col-sm-2" for="name">이름:</label>
          <div class="col-sm-10">
            <input type="text" class="form-control" id="name" name="name" placeholder="이름을 입력하세요" style="width: 30%">
          </div>
        </div>

        <div class="form-group">
          <label class="control-Label col-sm-2" for="age">나이:</label>
          <div class="col-sm-10">
            <input type="text" class="form-control" id="age" name="age" placeholder="나이를 입력하세요" style="width: 30%">
          </div>
        </div>

        <div class="form-group">
          <label class="control-Label col-sm-2" for="email">이메일:</label>
          <div class="col-sm-10">
            <input type="text" class="form-control" id="email" name="email" placeholder="이메일을 입력하세요" style="width: 30%">
          </div>
        </div>

        <div class="form-group">
          <label class="control-Label col-sm-2" for="phone">전화번호:</label>
          <div class="col-sm-10">
            <input type="text" class="form-control" id="phone" name="phone" placeholder="전화번호를 입력하세요" style="width: 30%">
          </div>
        </div>
      </form>
    </div>
    <div class="panel-footer" style="text-align: center">

      <c:if test="${sessionScope.userId==null || sessionScope.userId==''}">
        <input type="button" value="등록하기" class="btn btn-primary" onclick="add()">
      </c:if>
      <c:if test="${sessionScope.userId!=null && sessionScope.userId!=''}">
      <input type="button" value="등록하기" class="btn btn-primary" onclick="add()" disabled>
      </c:if>


      <input type="button" value="취소하기" class="btn btn-warning" onclick="frmreset()">
      <input type="button" value="목록가기" onclick="location.href='${ctx}/memberList.do'" class="btn btn-success">
    </div>
  </div>
</div>

</body>
</html>
