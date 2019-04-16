<%--
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
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,300i,400,400i,500,500i,600,600i,700,700i&amp;subset=latin-ext">
    <script src="${pageContext.request.contextPath}/assets/js/require.min.js"></script>
    <script>
        requirejs.config({
            baseUrl: '${pageContext.request.contextPath}'
        });
    </script>
    <!-- Dashboard Core -->
    <link href="${pageContext.request.contextPath}/assets/css/dashboard.css" rel="stylesheet" />
    <script src="${pageContext.request.contextPath}/assets/js/dashboard.js"></script>
    <!-- c3.js Charts Plugin -->
    <link href="${pageContext.request.contextPath}/assets/plugins/charts-c3/plugin.css" rel="stylesheet" />
    <script src="${pageContext.request.contextPath}/assets/plugins/charts-c3/plugin.js"></script>
    <!-- Google Maps Plugin -->
    <link href="${pageContext.request.contextPath}/assets/plugins/maps-google/plugin.css" rel="stylesheet" />
    <script src="${pageContext.request.contextPath}/assets/plugins/maps-google/plugin.js"></script>
    <!-- Input Mask Plugin -->
    <script src="${pageContext.request.contextPath}/assets/plugins/input-mask/plugin.js"></script>
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
                            <form class="card" action="" method="post">
                                <div class="card-body p-6">
                                    <div class="card-title">Login to your account<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                                    </div>
                                    <div class="form-group">
                                        <label class="form-label">Email address</label>
                                        <input type="email" class="form-control" id="exampleInputEmail2" aria-describedby="emailHelp" placeholder="Enter email">
                                    </div>
                                    <div class="form-group">
                                        <label class="form-label">
                                            Password
                                            <a href="./forgot-password.html" class="float-right small">I forgot password</a>
                                        </label>
                                        <input type="password" class="form-control" id="exampleInputPassword2" placeholder="Password">
                                    </div>
                                    <div class="form-group">
                                        <label class="custom-control custom-checkbox">
                                            <input type="checkbox" class="custom-control-input" />
                                            <span class="custom-control-label">Remember me</span>
                                        </label>
                                    </div>
                                    <div class="form-footer">
                                        <button type="submit" class="btn btn-primary btn-block">Sign in</button>
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
                            <button class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myLoginModal">
                                SIGN IN!
                            </button>
                            <button class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myRegisterModal">
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
                                <a href="./index.html" class="nav-link active"><i class="fe fe-home"></i> Problems </a>
                            </li>
                            <li class="nav-item">
                                <a href="javascript:void(0)" class="nav-link" data-toggle="dropdown"><i class="fe fe-box"></i> Rank </a>
                                <div class="dropdown-menu dropdown-menu-arrow">
                                    <a href="${pageContext.request.contextPath}/rank/" class="dropdown-item "> Rank of all users</a>
                                    <a href="./charts.html" class="dropdown-item ">Charts</a>
                                    <a href="./pricing-cards.html" class="dropdown-item ">Pricing cards</a>
                                </div>
                            </li>
                            <li class="nav-item dropdown">
                                <a href="javascript:void(0)" class="nav-link" data-toggle="dropdown"><i class="fe fe-calendar"></i> Components</a>
                                <div class="dropdown-menu dropdown-menu-arrow">
                                    <a href="./maps.html" class="dropdown-item ">Maps</a>
                                    <a href="./icons.html" class="dropdown-item ">Icons</a>
                                    <a href="./store.html" class="dropdown-item ">Store</a>
                                    <a href="./blog.html" class="dropdown-item ">Blog</a>
                                </div>
                            </li>
                            <li class="nav-item dropdown">
                                <a href="javascript:void(0)" class="nav-link" data-toggle="dropdown"><i class="fe fe-file"></i> Pages</a>
                                <div class="dropdown-menu dropdown-menu-arrow">
                                    <a href="./profile.html" class="dropdown-item ">Profile</a>
                                    <a href="./login.html" class="dropdown-item ">Login</a>
                                    <a href="./register.html" class="dropdown-item ">Register</a>
                                    <a href="./forgot-password.html" class="dropdown-item ">Forgot password</a>
                                    <a href="./400.html" class="dropdown-item ">400 error</a>
                                    <a href="./401.html" class="dropdown-item ">401 error</a>
                                    <a href="./403.html" class="dropdown-item ">403 error</a>
                                    <a href="./404.html" class="dropdown-item ">404 error</a>
                                    <a href="./500.html" class="dropdown-item ">500 error</a>
                                    <a href="./503.html" class="dropdown-item ">503 error</a>
                                    <a href="./email.html" class="dropdown-item ">Email</a>
                                    <a href="./empty.html" class="dropdown-item ">Empty page</a>
                                    <a href="./rtl.html" class="dropdown-item ">RTL mode</a>
                                </div>
                            </li>
                            <li class="nav-item dropdown">
                                <a href="./form-elements.html" class="nav-link"><i class="fe fe-check-square"></i> Forms</a>
                            </li>
                            <li class="nav-item">
                                <a href="./gallery.html" class="nav-link"><i class="fe fe-image"></i> Gallery</a>
                            </li>
                            <li class="nav-item">
                                <a href="./docs/index.html" class="nav-link"><i class="fe fe-file-text"></i> Documentation</a>
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
                                        <th>Language</th>
                                        <th class="text-center">Score</th>
                                        <th>Activity</th>
                                        <th class="text-center">Satisfaction</th>
                                        <th class="text-center"><i class="icon-settings"></i></th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <td class="text-center">
                                            <div class="avatar d-block" style="background-image: url(${pageContext.request.contextPath}/demo/faces/female/26.jpg)">
                                                <span class="avatar-status bg-green"></span>
                                            </div>
                                        </td>
                                        <td>
                                            <div>Elizabeth Martin</div>
                                            <div class="small text-muted">
                                                Registered: Mar 9, 2018
                                            </div>
                                        </td>
                                        <td>
                                            <div class="clearfix">
                                                <div class="float-left">
                                                    <strong>42%</strong>
                                                </div>
                                                <div class="float-right">
                                                    <small class="text-muted">Jun 11, 2015 - Jul 10, 2015</small>
                                                </div>
                                            </div>
                                            <div class="progress progress-xs">
                                                <div class="progress-bar bg-yellow" role="progressbar" style="width: 42%"
                                                     aria-valuenow="42" aria-valuemin="0" aria-valuemax="100"></div>
                                            </div>
                                        </td>
                                        <td class="text-center">
                                            50
                                        </td>
                                        <td>
                                            <div class="small text-muted">Last login</div>
                                            <div>4 minutes ago</div>
                                        </td>
                                        <td class="text-center">
                                            <div class="mx-auto chart-circle chart-circle-xs" data-value="0.42" data-thickness="3" data-color="blue">
                                                <div class="chart-circle-value">42%</div>
                                            </div>
                                        </td>
                                        <td class="text-center">
                                            <div class="item-action dropdown">
                                                <a href="javascript:void(0)" data-toggle="dropdown" class="icon"><i class="fe fe-more-vertical"></i></a>
                                                <div class="dropdown-menu dropdown-menu-right">
                                                    <a href="javascript:void(0)" class="dropdown-item"><i class="dropdown-icon fe fe-tag"></i> Action </a>
                                                    <a href="javascript:void(0)" class="dropdown-item"><i class="dropdown-icon fe fe-edit-2"></i> Another action </a>
                                                    <a href="javascript:void(0)" class="dropdown-item"><i class="dropdown-icon fe fe-message-square"></i> Something else here</a>
                                                    <div class="dropdown-divider"></div>
                                                    <a href="javascript:void(0)" class="dropdown-item"><i class="dropdown-icon fe fe-link"></i> Separated link</a>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="text-center">
                                            <div class="avatar d-block" style="background-image: url(${pageContext.request.contextPath}/demo/faces/female/17.jpg)">
                                                <span class="avatar-status bg-green"></span>
                                            </div>
                                        </td>
                                        <td>
                                            <div>Michelle Schultz</div>
                                            <div class="small text-muted">
                                                Registered: Feb 21, 2018
                                            </div>
                                        </td>
                                        <td>
                                            <div class="clearfix">
                                                <div class="float-left">
                                                    <strong>0%</strong>
                                                </div>
                                                <div class="float-right">
                                                    <small class="text-muted">Jun 11, 2015 - Jul 10, 2015</small>
                                                </div>
                                            </div>
                                            <div class="progress progress-xs">
                                                <div class="progress-bar bg-red" role="progressbar" style="width: 0%"
                                                     aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"></div>
                                            </div>
                                        </td>
                                        <td class="text-center">
                                            0
                                        </td>
                                        <td>
                                            <div class="small text-muted">Last login</div>
                                            <div>5 minutes ago</div>
                                        </td>
                                        <td class="text-center">
                                            <div class="mx-auto chart-circle chart-circle-xs" data-value="0.0" data-thickness="3" data-color="blue">
                                                <div class="chart-circle-value">0%</div>
                                            </div>
                                        </td>
                                        <td class="text-center">
                                            <div class="item-action dropdown">
                                                <a href="javascript:void(0)" data-toggle="dropdown" class="icon"><i class="fe fe-more-vertical"></i></a>
                                                <div class="dropdown-menu dropdown-menu-right">
                                                    <a href="javascript:void(0)" class="dropdown-item"><i class="dropdown-icon fe fe-tag"></i> Action </a>
                                                    <a href="javascript:void(0)" class="dropdown-item"><i class="dropdown-icon fe fe-edit-2"></i> Another action </a>
                                                    <a href="javascript:void(0)" class="dropdown-item"><i class="dropdown-icon fe fe-message-square"></i> Something else here</a>
                                                    <div class="dropdown-divider"></div>
                                                    <a href="javascript:void(0)" class="dropdown-item"><i class="dropdown-icon fe fe-link"></i> Separated link</a>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="text-center">
                                            <div class="avatar d-block" style="background-image: url(${pageContext.request.contextPath}/demo/faces/female/21.jpg)">
                                                <span class="avatar-status bg-green"></span>
                                            </div>
                                        </td>
                                        <td>
                                            <div>Crystal Austin</div>
                                            <div class="small text-muted">
                                                Registered: Mar 28, 2018
                                            </div>
                                        </td>
                                        <td>
                                            <div class="clearfix">
                                                <div class="float-left">
                                                    <strong>96%</strong>
                                                </div>
                                                <div class="float-right">
                                                    <small class="text-muted">Jun 11, 2015 - Jul 10, 2015</small>
                                                </div>
                                            </div>
                                            <div class="progress progress-xs">
                                                <div class="progress-bar bg-green" role="progressbar" style="width: 96%"
                                                     aria-valuenow="96" aria-valuemin="0" aria-valuemax="100"></div>
                                            </div>
                                        </td>
                                        <td class="text-center">
                                            100
                                        </td>
                                        <td>
                                            <div class="small text-muted">Last login</div>
                                            <div>a minute ago</div>
                                        </td>
                                        <td class="text-center">
                                            <div class="mx-auto chart-circle chart-circle-xs" data-value="0.96" data-thickness="3" data-color="blue">
                                                <div class="chart-circle-value">96%</div>
                                            </div>
                                        </td>
                                        <td class="text-center">
                                            <div class="item-action dropdown">
                                                <a href="javascript:void(0)" data-toggle="dropdown" class="icon"><i class="fe fe-more-vertical"></i></a>
                                                <div class="dropdown-menu dropdown-menu-right">
                                                    <a href="javascript:void(0)" class="dropdown-item"><i class="dropdown-icon fe fe-tag"></i> Action </a>
                                                    <a href="javascript:void(0)" class="dropdown-item"><i class="dropdown-icon fe fe-edit-2"></i> Another action </a>
                                                    <a href="javascript:void(0)" class="dropdown-item"><i class="dropdown-icon fe fe-message-square"></i> Something else here</a>
                                                    <div class="dropdown-divider"></div>
                                                    <a href="javascript:void(0)" class="dropdown-item"><i class="dropdown-icon fe fe-link"></i> Separated link</a>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
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
