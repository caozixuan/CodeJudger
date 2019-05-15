<%@ page import="ssm.model.Problem" %>
<%@ page import="java.util.List" %>
<%@ page import="ssm.model.User" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="ssm.model.UserInformation" %><%--
  Created by IntelliJ IDEA.
  User: rickyzhang
  Date: 2019/4/10
  Time: 9:51 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en" dir="ltr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <meta http-equiv="Content-Language" content="en" />
    <meta name="msapplication-TileColor" content="#2d89ef">
    <meta name="theme-color" content="#4188c9">
    <meta name="apple-mobile-web-app-status-bar-style" content="black-translucent"/>
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="mobile-web-app-capable" content="yes">
    <meta name="HandheldFriendly" content="True">
    <meta name="MobileOptimized" content="320">
    <link rel="icon" href="../../favicon.ico" type="image/x-icon"/>
    <link rel="shortcut icon" type="image/x-icon" href="../../favicon.ico" />
    <!-- Generated: 2018-04-06 16:27:42 +0200 -->
    <title>Homepage - tabler.github.io - a responsive, flat and full featured admin template</title>
    <script src="${pageContext.request.contextPath}/assets/js/require.min.js"></script>
    <script>
        requirejs.config({
            baseUrl: '/',
            shim: {
                'bootstrap': ['jquery']
            },
            paths: {
                'core': '${pageContext.request.contextPath}/assets/js/core',
                'jquery': '${pageContext.request.contextPath}/assets/js/vendors/jquery-3.2.1.min'
            }
        });
    </script>
    <!-- Dashboard Core -->
    <link href="${pageContext.request.contextPath}/assets/css/dashboard.css" rel="stylesheet" />
    <script src="${pageContext.request.contextPath}/assets/js/dashboard.js"></script>
</head>
<body class="">
<%--Login Module--%>
<div class="container">
    <!-- 模态框（Modal） -->
    <div class="modal fade" id="myLoginModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content modal-backdrop">
                <div class="modal-body">
                    <div class="row">
                        <div class="col col-login mx-auto">
                            <form class="card" method="post" action="${pageContext.request.contextPath}/user/validateUser">
                                <div class="card-body p-6">
                                    <div class="card-title">Login to your account<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                                    </div>
                                    <div class="form-group">
                                        <label class="form-label">Email address</label>
                                        <input type="text" class="form-control" id="exampleInputEmail1" placeholder="Enter email" name="email">
                                    </div>
                                    <div class="form-group">
                                        <label class="form-label">
                                            Password
                                            <a href="./forgot-password.html" class="float-right small">I forgot password</a>
                                        </label>
                                        <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password" name="password">
                                    </div>
                                    <div class="form-group">
                                        <label class="custom-control custom-checkbox">
                                            <input type="checkbox" class="custom-control-input" />
                                            <span class="custom-control-label">Remember me</span>
                                        </label>
                                    </div>
                                    <div class="form-footer">
                                        <button id="submit" type="submit" class="btn btn-primary btn-block">LOG IN</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<%--Register Module--%>
<div class="container">
    <!-- 模态框（Modal） -->
    <div class="modal fade" id="myRegisterModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content modal-backdrop">
                <div class="modal-body">
                    <div class="row">
                        <div class="col col-login mx-auto">
                            <form class="card" action="" method="post" action="${pageContext.request.contextPath}/user/addUser">
                                <div class="card-body p-6">
                                    <div class="card-title">Sign up and join us<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                                    </div>
                                    <div class="form-group">
                                        <label class="form-label">Nickname</label>
                                        <input type="text" class="form-control" id="exampleInputNickName" aria-describedby="emailHelp" placeholder="Enter nickname">
                                    </div>
                                    <div class="form-group">
                                        <label class="form-label">Email address</label>
                                        <input type="email" class="form-control" id="exampleInputEmail2" aria-describedby="emailHelp" placeholder="Enter email">
                                    </div>
                                    <div class="form-group">
                                        <label class="form-label">
                                            Password
                                        </label>
                                        <input type="password" class="form-control" id="exampleInputPassword2" placeholder="Enter password">
                                    </div>
                                    <div class="form-group">
                                        <label class="form-label">
                                            Confirm password
                                        </label>
                                        <input type="password" class="form-control" id="exampleInputPassword2Confirm" placeholder="Confirm password">
                                    </div>
                                    <div class="form-footer">
                                        <button type="submit" class="btn btn-primary btn-block">SIGN IN</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="page">
    <div class="page-main">
        <div class="header py-4">
            <div class="container">
                <div class="d-flex">
                    <a class="header-brand" href="${pageContext.request.contextPath}/problems/">
                        <img src="${pageContext.request.contextPath}/demo/brand/tabler.svg" class="header-brand-img" alt="tabler logo">
                    </a>
                    <div class="d-flex order-lg-2 ml-auto">
                        <div class="nav-item d-none d-md-flex">
                            <a href="https://github.com/tabler/tabler" class="btn btn-sm btn-outline-primary" target="_blank">Source code</a>
                        </div>
                        <div class="dropdown d-none d-md-flex">
                            <a class="nav-link icon" data-toggle="dropdown">
                                <i class="fe fe-bell"></i>
                                <span class="nav-unread"></span>
                            </a>
                            <div class="dropdown-menu dropdown-menu-right dropdown-menu-arrow">
                                <a href="#" class="dropdown-item d-flex">
                                    <span class="avatar mr-3 align-self-center" style="background-image: url(${pageContext.request.contextPath}demo/faces/male/41.jpg)"></span>
                                    <div>
                                        <strong>Nathan</strong> pushed new commit: Fix page load performance issue.
                                        <div class="small text-muted">10 minutes ago</div>
                                    </div>
                                </a>
                                <a href="#" class="dropdown-item d-flex">
                                    <span class="avatar mr-3 align-self-center" style="background-image: url(${pageContext.request.contextPath}/demo/faces/female/1.jpg)"></span>
                                    <div>
                                        <strong>Alice</strong> started new task: Tabler UI design.
                                        <div class="small text-muted">1 hour ago</div>
                                    </div>
                                </a>
                                <a href="#" class="dropdown-item d-flex">
                                    <span class="avatar mr-3 align-self-center" style="background-image: url(${pageContext.request.contextPath}/demo/faces/female/18.jpg)"></span>
                                    <div>
                                        <strong>Rose</strong> deployed new version of NodeJS REST Api V3
                                        <div class="small text-muted">2 hours ago</div>
                                    </div>
                                </a>
                                <div class="dropdown-divider"></div>
                                <a href="#" class="dropdown-item text-center text-muted-dark">Mark all as read</a>
                            </div>
                        </div>
                        <%if (session.getAttribute("uuid")==null){%>
                        <div>
                            <button class="btn btn-sm btn-primary" data-toggle="modal" data-target="#myLoginModal">
                                SIGN IN!
                            </button>
                            <button class="btn btn-sm btn-primary" data-toggle="modal" data-target="#myRegisterModal">
                                SIGN UP!
                            </button>
                        </div>
                        <%}else {%>
                        <div class="dropdown">
                            <a href="#" class="nav-link pr-0 leading-none" data-toggle="dropdown">
                                <span class="avatar" style="background-image: url(${pageContext.request.contextPath}/demo/faces/female/25.jpg)"></span>
                                <span class="ml-2 d-none d-lg-block">
                                            <span class="text-default"><%= session.getAttribute("nickName")%></span>
                                    <small class="text-muted d-block mt-1">Administrator</small>
                                     </span>
                            </a>
                            <div class="dropdown-menu dropdown-menu-right dropdown-menu-arrow">
                                <a class="dropdown-item" href="#">
                                    <i class="dropdown-icon fe fe-user"></i> Profile
                                </a>
                                <a class="dropdown-item" href="#">
                                    <i class="dropdown-icon fe fe-settings"></i> Settings
                                </a>
                                <a class="dropdown-item" href="#">
                                    <span class="float-right"><span class="badge badge-primary">6</span></span>
                                    <i class="dropdown-icon fe fe-mail"></i> Inbox
                                </a>
                                <a class="dropdown-item" href="#">
                                    <i class="dropdown-icon fe fe-send"></i> Message
                                </a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="#">
                                    <i class="dropdown-icon fe fe-help-circle"></i> Need help?
                                </a>
                                <a class="dropdown-item" href="${pageContext.request.contextPath}/user/logout">
                                    <i class="dropdown-icon fe fe-log-out"></i> Sign out
                                </a>
                            </div>
                        </div>
                        <%}%>
                    </div>
                    <a href="#" class="header-toggler d-lg-none ml-3 ml-lg-0" data-toggle="collapse" data-target="#headerMenuCollapse">
                        <span class="header-toggler-icon"></span>
                    </a>
                </div>
            </div>
        </div>
        <div class="header collapse d-lg-flex p-0" id="headerMenuCollapse">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-lg-3 ml-auto">
                        <form class="input-icon my-3 my-lg-0">
                            <input type="search" class="form-control header-search" placeholder="Search&hellip;" tabindex="1">
                            <div class="input-icon-addon">
                                <i class="fe fe-search"></i>
                            </div>
                        </form>
                    </div>
                    <div class="col-lg order-lg-first">
                        <ul class="nav nav-tabs border-0 flex-column flex-lg-row">
                            <li class="nav-item">
                                <a href="${pageContext.request.contextPath}/problems/" class="nav-link"><i class="fe fe-home"></i> Problems </a>
                            </li>
                            <li class="nav-item">
                                <a href="${pageContext.request.contextPath}/rank/" class="nav-link active"><i class="fe fe-bar-chart"></i> Rank </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <div class="my-3 my-md-5">
            <div class="container">
                <div class="page-header">
                    <h1 class="page-title">
                        Ranking
                    </h1>
                </div>
                <div class="row row-cards">
                    <div class="col-12">
                        <div class="card">
                            <div class="table-responsive">
                                <table class="table table-hover table-outline table-vcenter text-nowrap card-table">
                                    <thead>
                                    <tr>
                                        <th class="text-center w-1"><i class="icon-people"></i></th>
                                        <th>User</th>
                                        <th class="text-center">Score</th>
                                        <th class="text-center">Total Submission</th>
                                        <th class="text-center">Total Correction</th>
                                        <th class="text-center">Completion<i class="icon-settings"></i></th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <% List<User> users = (List<User>)request.getAttribute("users");%>
                                    <% List<UserInformation> userInformations = (List<UserInformation>)request.getAttribute("userInformations");%>
                                    <% for (int i = 0; i<users.size(); i++ )
                                    {%>
                                    <tr>
                                        <td class="text-center">
                                            <div class="avatar d-block" style="background-image: url(${pageContext.request.contextPath}/demo/faces/female/26.jpg)">
                                                <span class="avatar-status bg-green"></span>
                                            </div>
                                        </td>
                                        <td>
                                            <div><%=users.get(i).getNickName()%></div>
                                            <div class="small text-muted">
                                                Registered: Mar 9, 2018
                                            </div>
                                        </td>
                                        <td class="text-center">
                                            <%=userInformations.get(i).getTotalSolveValue()%>
                                        </td>
                                        <td class="text-center">
                                            <%=userInformations.get(i).getTotalSubmitCount()%>
                                        </td>
                                        <td class="text-center">
                                            <%=userInformations.get(i).getTotalRightCount()%>
                                        </td>
                                        <td class="text-center">
                                            <div class="mx-auto chart-circle chart-circle-xs" data-value="0.42" data-thickness="3" data-color="blue">
                                                <div class="chart-circle-value"> <%=userInformations.get(i).getTotalRightCount()/100.0%></div>
                                            </div>
                                        </td>
                                    </tr>
                                    <%}%>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="footer">
    <div class="container">
        <div class="row">
            <div class="col-lg-8">
                <div class="row">
                    <div class="col-6 col-md-3">
                        <ul class="list-unstyled mb-0">
                            <li><a href="#">First link</a></li>
                            <li><a href="#">Second link</a></li>
                        </ul>
                    </div>
                    <div class="col-6 col-md-3">
                        <ul class="list-unstyled mb-0">
                            <li><a href="#">Third link</a></li>
                            <li><a href="#">Fourth link</a></li>
                        </ul>
                    </div>
                    <div class="col-6 col-md-3">
                        <ul class="list-unstyled mb-0">
                            <li><a href="#">Fifth link</a></li>
                            <li><a href="#">Sixth link</a></li>
                        </ul>
                    </div>
                    <div class="col-6 col-md-3">
                        <ul class="list-unstyled mb-0">
                            <li><a href="#">Other link</a></li>
                            <li><a href="#">Last link</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 mt-4 mt-lg-0">
                Premium and Open Source dashboard template with responsive and high quality UI. For Free!
            </div>
        </div>
    </div>
</div>
<footer class="footer">
    <div class="container">
        <div class="row align-items-center flex-row-reverse">
            <div class="col-auto ml-lg-auto">
                <div class="row align-items-center">
                    <div class="col-auto">
                        <ul class="list-inline list-inline-dots mb-0">
                            <li class="list-inline-item"><a href="./docs/index.html">Documentation</a></li>
                            <li class="list-inline-item"><a href="./faq.html">FAQ</a></li>
                        </ul>
                    </div>
                    <div class="col-auto">
                        <a href="https://github.com/tabler/tabler" class="btn btn-outline-primary btn-sm">Source code</a>
                    </div>
                </div>
            </div>
            <div class="col-12 col-lg-auto mt-3 mt-lg-0 text-center">
                Copyright © 2018 <a href=".">Tabler</a>. Theme by codecalm.net -  More Templates <a href="http://www.cssmoban.com/" target="_blank" title="模板之家">模板之家</a> - Collect from <a href="http://www.cssmoban.com/" title="网页模板" target="_blank">网页模板</a> All rights reserved.
            </div>
        </div>
    </div>
</footer>
</div>
</body>
</html>

