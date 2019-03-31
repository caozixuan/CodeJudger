<%--
  Created by IntelliJ IDEA.
  User: rickyzhang
  Date: 2019/3/24
  Time: 8:31 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>SIGN UP</title>
</head>
<body>
    <h3>SIGN UP!</h3>
    <br>
    <form method="post" action="${pageContext.request.contextPath}/user/addUser">
        <table>
            <tr>
                <td><label>User Name</label></td>
                <td><input type="text" name="nickName"></td>
            </tr>
            <tr>
                <td><label>Password</label></td>
                <td><input type="password" name="password"></td>
            </tr>
            <tr>
                <td><label>Email</label></td>
                <td><input type="text" name="email"></td>
            </tr>
            <tr>
                <td><input type="submit" name="SIGN UP!"></td>
            </tr>
        </table>
    </form>

</body>
</html>
