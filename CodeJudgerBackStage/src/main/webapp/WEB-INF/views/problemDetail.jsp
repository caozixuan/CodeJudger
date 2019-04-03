<%@ page import="ssm.model.*" %>
<%@ page import="java.util.List" %>
<%@ page import="org.springframework.beans.factory.parsing.Problem" %><%--
  Created by IntelliJ IDEA.
  User: rickyzhang
  Date: 2019/3/24
  Time: 7:41 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
    <title>CodeJudger</title>
    </head>

    <body>
        <div style="position: absolute; left: 200px; top: 100px;">
            <a href="${pageContext.request.contextPath}/user/register">SIGN UP!</a>
            <br /><br />
            <a href="${pageContext.request.contextPath}/user/login">SIGN IN!</a>
        </div>
        <table border="1">
            <tr>
                <td>ID</td>
                <td>TYPE</td>
                <td>DIFFICULTY</td>
            </tr>
            <%
                for (ssm.model.Problem pro: (List<ssm.model.Problem>)request.getAttribute("problems"))
                {%>
            <tr>
                <td><%=pro.getUuid()%></td>
                <td><%=pro.getProblemTypeID()%></td>
                <td><%=pro.getProblemDifficulty()%></td>
            </tr>
            <%}
            %>
        </table>

    </body>

</html>