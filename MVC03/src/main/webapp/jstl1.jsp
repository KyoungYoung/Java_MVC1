<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.mvc03.model.MemberVO" %>
<%--
  Created by IntelliJ IDEA.
  User: kky
  Date: 2023/11/19
  Time: 12:06 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    // Controller -> JSP 갈 때 setAttribute 한걸 이렇게 일단 표현하기
//    String[] str = {"사과", "바나나", "포도", "귤", "오렌지"};
//    request.setAttribute("str",str);

//    List<String> list = new ArrayList<>();
//    list.add("java");
//    list.add("python");
//    list.add("node.js");
//    list.add("c++");
//    list.add("kotlin");
//    request.setAttribute("list",list);

    MemberVO vo = new MemberVO();
    vo.setNum(1);
    vo.setId("kky");
    vo.setName("경영");
    vo.setEmail("kky@naver.com");

    List<MemberVO> list = new ArrayList<>();
    list.add(vo);
    list.add(vo);
    list.add(vo);
    list.add(vo);
    request.setAttribute("list",list);
%>
<%--<c:set var="cnt" value="7"/>--%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%--// test는 조건식 , 참이면 c태그 안에서 처리, 거짓이면 밖으로 나옴, jstl은 else문이 존재하지 않아 2번써야함--%>
<%--<c:if test="${cnt % 2 == 0}">--%>
<%--    짝수입니다--%>
<%--</c:if>--%>
<%--<c:if test="${cnt % 2 == 1}">--%>
<%--    홀수입니다--%>
<%--</c:if>--%>
<%--<c:choose>--%>
<%--    <c:when test="${cnt%2==0}">--%>
<%--        짝수입니다.--%>
<%--    </c:when>--%>
<%--    <c:when test="${cnt%2==1}">--%>
<%--        홀수입니다.--%>
<%--    </c:when>--%>
<%--    <c:otherwise>--%>
<%--        일치하는 when이 없는 경우 실행--%>
<%--    </c:otherwise>--%>
<%--</c:choose>--%>

<%--<c:forEach var="i" begin="1" end="5" step="1">--%>
<%--    ${i}--%>
<%--</c:forEach>--%>

<%--// items는 여러개 받을 속성 , str 객체 바인딩한 배열이다--%>
<%--// ${}이거는 <%로 된 걸 못받는다, JSTL로 된 문법만 받을 수 있다, 단 setAttribute같은 속성으로된 값은 getAttribute없이 받을 수 있다--%>
<%--${} 는 var로된 변수값과, setAttribute를 한 속성값을 받을 수 있다--%>
<%--    ${f}--%>
<%--<c:forEach var="f" items="${str}">--%>
<%--</c:forEach>--%>

<%--<c:forEach items="${list}" var="sw">--%>
<%--    ${i}--%>
<%--</c:forEach>--%>


<%--<c:forEach items="${vo}" var="v">--%>
<%--    ${v.getNum()}--%>
<%--</c:forEach>--%>

<table border="1">
    <tr>
        <td>번호</td>
        <td>아이디</td>
        <td>이름</td>
        <td>이메일</td>
    </tr>
    <tr>
        <c:forEach items="${list}" var="i">
            <td>${i.num}</td>
            <td>${i.id}</td>
            <td>${i.name}</td>
            <td>${i.email}</td>
        </c:forEach>
    </tr>
</table>

</body>
</html>
