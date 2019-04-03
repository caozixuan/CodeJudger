<%--
  Created by IntelliJ IDEA.
  User: rickyzhang
  Date: 2019/3/24
  Time: 7:45 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>SIGN IN</title>
</head>
<body>
<h3>SIGN IN!</h3>
<br>
<form method="post" action="${pageContext.request.contextPath}/user/validateUser">
    <table>
        <tr>
            <td><label>Email</label></td>
            <td><input type="text" name="email"></td>
        </tr>
        <tr>
            <td><label>Password</label></td>
            <td><input type="password" name="password"></td>
        </tr>
        <tr>
            <td><input id="submit" type="submit" name="SIGN IN!"></td>
        </tr>
    </table>
</form>

</body>
</html>
