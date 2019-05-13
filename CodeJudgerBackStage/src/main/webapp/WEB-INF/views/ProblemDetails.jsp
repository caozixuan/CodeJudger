<%@ page import="ssm.model.Problem" %><%--
  Created by IntelliJ IDEA.
  User: rickyzhang
  Date: 2019/4/7
  Time: 11:10 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en" dir="ltr" xmlns="http://www.w3.org/1999/html" xmlns="http://www.w3.org/1999/html">
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
    <!-- Markdown Parser -->
    <script src="${pageContext.request.contextPath}/markdown/marked.min.js"></script>

    <!-- Settings for CodeMirror-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/codemirror/lib/codemirror.css">
    <script src="${pageContext.request.contextPath}/codemirror/lib/codemirror.js"></script>
    <script src="${pageContext.request.contextPath}/codemirror/mode/javascript/javascript.js"></script>
    <script src="${pageContext.request.contextPath}/codemirror/addon/selection/active-line.js"></script>
    <script src="${pageContext.request.contextPath}/codemirror/addon/edit/matchbrackets.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/codemirror/addon/hint/show-hint.css">
    <script src="${pageContext.request.contextPath}/codemirror/addon/hint/show-hint.js"></script>

    <!--add code mode for CodeMirror-->
    <script src="${pageContext.request.contextPath}/codemirror/mode/clike/clike.js"></script>
    <script src="${pageContext.request.contextPath}/codemirror/mode/python/python.js"></script>
    <script src="${pageContext.request.contextPath}/codemirror/mode/javascript/javascript.js"></script>
    <script src="${pageContext.request.contextPath}/codemirror/mode/ruby/ruby.js"></script>
    <script src="${pageContext.request.contextPath}/codemirror/mode/swift/swift.js"></script>
    <script src="${pageContext.request.contextPath}/codemirror/mode/go/go.js"></script>
    <script src="${pageContext.request.contextPath}/codemirror/addon/mode/simple.js"></script>
    <script src="${pageContext.request.contextPath}/codemirror/mode/rust/rust.js"></script>
    <script src="${pageContext.request.contextPath}/codemirror/mode/php/php.js"></script>

    <!--add theme css for CodeMirror-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/codemirror/theme/3024-day.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/codemirror/theme/3024-night.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/codemirror/theme/abcdef.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/codemirror/theme/ambiance.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/codemirror/theme/base16-dark.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/codemirror/theme/bespin.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/codemirror/theme/base16-light.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/codemirror/theme/blackboard.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/codemirror/theme/cobalt.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/codemirror/theme/colorforth.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/codemirror/theme/dracula.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/codemirror/theme/duotone-dark.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/codemirror/theme/duotone-light.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/codemirror/theme/eclipse.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/codemirror/theme/elegant.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/codemirror/theme/erlang-dark.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/codemirror/theme/gruvbox-dark.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/codemirror/theme/hopscotch.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/codemirror/theme/icecoder.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/codemirror/theme/isotope.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/codemirror/theme/lesser-dark.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/codemirror/theme/liquibyte.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/codemirror/theme/lucario.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/codemirror/theme/material.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/codemirror/theme/mbo.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/codemirror/theme/mdn-like.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/codemirror/theme/midnight.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/codemirror/theme/monokai.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/codemirror/theme/neat.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/codemirror/theme/neo.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/codemirror/theme/night.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/codemirror/theme/nord.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/codemirror/theme/oceanic-next.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/codemirror/theme/panda-syntax.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/codemirror/theme/paraiso-dark.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/codemirror/theme/paraiso-light.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/codemirror/theme/pastel-on-dark.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/codemirror/theme/railscasts.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/codemirror/theme/rubyblue.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/codemirror/theme/seti.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/codemirror/theme/shadowfox.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/codemirror/theme/solarized.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/codemirror/theme/the-matrix.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/codemirror/theme/tomorrow-night-bright.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/codemirror/theme/tomorrow-night-eighties.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/codemirror/theme/ttcn.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/codemirror/theme/twilight.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/codemirror/theme/vibrant-ink.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/codemirror/theme/xq-dark.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/codemirror/theme/xq-light.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/codemirror/theme/yeti.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/codemirror/theme/idea.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/codemirror/theme/darcula.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/codemirror/theme/yonce.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/codemirror/theme/zenburn.css">


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

<%Problem pro = (Problem)request.getAttribute("problem");%>
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
                                <a href="${pageContext.request.contextPath}/problems/" class="nav-link active"><i class="fe fe-home"></i> Problems </a>
                            </li>
                            <li class="nav-item">
                                <a href="${pageContext.request.contextPath}/rank/" class="nav-link"><i class="fe fe-bar-chart"></i> Rank </a>
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
                        <%=pro.getName()%>
                    </h1>
                </div>
                <div class="row row-cards">
                    <div class="col-lg-6 ml-auto">
                        <p>Select a theme: <select onchange="selectTheme()" id="selectTheme">
                            <option selected>3024-day</option>
                            <option>3024-night</option>
                            <option>abcdef</option>
                            <option>ambiance</option>
                            <option>base16-dark</option>
                            <option>base16-light</option>
                            <option>bespin</option>
                            <option>blackboard</option>
                            <option>cobalt</option>
                            <option>colorforth</option>
                            <option>darcula</option>
                            <option>dracula</option>
                            <option>duotone-dark</option>
                            <option>duotone-light</option>
                            <option>eclipse</option>
                            <option>elegant</option>
                            <option>erlang-dark</option>
                            <option>gruvbox-dark</option>
                            <option>hopscotch</option>
                            <option>icecoder</option>
                            <option>idea</option>
                            <option>isotope</option>
                            <option>lesser-dark</option>
                            <option>liquibyte</option>
                            <option>lucario</option>
                            <option>material</option>
                            <option>mbo</option>
                            <option>mdn-like</option>
                            <option>midnight</option>
                            <option>monokai</option>
                            <option>neat</option>
                            <option>neo</option>
                            <option>night</option>
                            <option>nord</option>
                            <option>oceanic-next</option>
                            <option>panda-syntax</option>
                            <option>paraiso-dark</option>
                            <option>paraiso-light</option>
                            <option>pastel-on-dark</option>
                            <option>railscasts</option>
                            <option>rubyblue</option>
                            <option>seti</option>
                            <option>shadowfox</option>
                            <option>solarized dark</option>
                            <option>solarized light</option>
                            <option>the-matrix</option>
                            <option>tomorrow-night-bright</option>
                            <option>tomorrow-night-eighties</option>
                            <option>ttcn</option>
                            <option>twilight</option>
                            <option>vibrant-ink</option>
                            <option>xq-dark</option>
                            <option>xq-light</option>
                            <option>yeti</option>
                            <option>yonce</option>
                            <option>zenburn</option>
                        </select>
                        </p>

                        <p>Select a language:<select onchange="selectLanguage()" id="selectLanguage">
                            <option selected>C++</option>
                            <option>Java</option>
                            <option>Python</option>
                            <option>Python3</option>
                            <option>C</option>
                            <option>C#</option>
                            <option>JavaScript</option>
                            <option>Ruby</option>
                            <option>Swift</option>
                            <option>Go</option>
                            <option>Scala</option>
                            <option>Kotlin</option>
                            <option>Rust</option>
                            <option>PHP</option>
                        </select>
                        </p>
                        <form><textarea id="code" name="code">
function findSequence(goal) {
  function find(start, history) {
    if (start == goal)
      return history;
    else if (start > goal)
      return null;
    else
      return find(start + 5, "(" + history + " + 5)") ||
             find(start * 3, "(" + history + " * 3)");
  }
  return find(1, "1");
}</textarea></form>
                        <br>
                        <div class="row row-cards">
                            <div class="col-lg-8 ml-auto">
                            </div>
                            <div class="col-lg-2 ml-auto">
                                <button class="btn btn-outline-success" type="submit" form="code" value="RunCode">Run Code</button>
                            </div>
                            <div class="col-lg-2 ml-auto">
                                <button class="btn btn-gray-dark" type="submit" form="code" value="Submit" onclick="submitCode()">Submit</button>
                            </div>
                        </div>

                        <script>
                            var editor = CodeMirror.fromTextArea(document.getElementById("code"), {
                                indentUnit: 4,
                                lineNumbers: true,
                                lineWrapping: true,
                                styleActiveLine: true,
                                matchBrackets: true,
                                foldGutter: true,
                                gutters: ["CodeMirror-linenumbers", "CodeMirror-foldgutter"]
                            });

                            var inputTheme = document.getElementById("selectTheme");
                            var inputLanguage = document.getElementById("selectLanguage");
                            function submitCode() {
                                var code = editor.getDoc().getValue()
                                var dataToPost = {code: code, timeLimit: "<%=pro.getTimeLimit()%>", memoryLimit: "<%=pro.getMemoryLimit()%>"}
                                $.ajax({
                                    url:'${pageContext.request.contextPath}/problems/evaluate/<%=pro.getUuid()%>',
                                    type:'POST',
                                    data: dataToPost,
                                    contentType: "application/x-www-form-urlencoded",
                                    success:function (result, textStatus, request) {
                                        alert(request.responseText)
                                    }
                                })
                            }

                            function selectTheme() {
                                var theme = inputTheme.options[inputTheme.selectedIndex].textContent;
                                editor.setOption("theme", theme);
                            }
                            function selectLanguage() {
                                var language = inputLanguage.options[inputLanguage.selectedIndex].textContent;
                                switch(language){
                                    case "C++":
                                        editor.setOption("mode", "text/x-c++src");
                                        editor.setOption("value", "#include <iostream>\n" +
                                            "#include<string>\n" +
                                            "#include<vector>\n" +
                                            "\n" +
                                            "using namespace std;\n" +
                                            "\n" +
                                            "\n" +
                                            "\n" +
                                            "int main()\n" +
                                            "{\n" +
                                            "\t// Write Your Code\n" +
                                            "\n" +
                                            "\n" +
                                            "\treturn 0;\n" +
                                            "}")
                                        break;
                                    case "Java":
                                        editor.setOption("mode", "text/x-java");
                                        editor.setOption("value", "import java.util.*;\n" +
                                            "\n" +
                                            "public class Main {\n" +
                                            "    \n" +
                                            "    // Write Your Code\n" +
                                            "\n" +
                                            "\n" +
                                            "    public static void main(String[] args){\n" +
                                            "\n" +
                                            "    }\n" +
                                            "}")
                                        break;
                                    case "Python":
                                        editor.setOption("mode", {name: "python",
                                            version: 2,
                                            singleLineStringErrors: false});
                                        editor.setOption("value", "This is a python")
                                        break;
                                    case "Python3":
                                        editor.setOption("mode", {name: "python",
                                            version: 3,
                                            singleLineStringErrors: false});
                                        editor.setOption("value", "This is a python3")
                                        break;
                                    case "C":
                                        editor.setOption("mode", "text/x-csrc");
                                        editor.setOption("value", "This is a C")
                                        break;
                                    case "C#":
                                        editor.setOption("mode", "text/x-csharp");
                                        break;
                                    case "JavaScript":
                                        editor.setOption("mode", "text/javascript");
                                        break;
                                    case "Ruby":
                                        editor.setOption("mode", "text/x-ruby");
                                        break;
                                    case "Swift":
                                        editor.setOption("mode", "text/x-swift");
                                        break;
                                    case "Go":
                                        editor.setOption("mode", "text/x-go");
                                        break;
                                    case "Scala":
                                        editor.setOption("mode", "text/x-scala");
                                        break;
                                    case "Kotlin":
                                        editor.setOption("mode", "text/x-kotlin");
                                        break;
                                    case "Rust":
                                        editor.setOption("mode", "rust");
                                        break;
                                    case "PHP":
                                        editor.setOption("mode", "text/x-php");
                                        break;
                                    default:
                                        break;
                                }
                            }

                            editor.setSize('100%', '100%');

                            var mac = CodeMirror.keyMap.default == CodeMirror.keyMap.macDefault;
                            CodeMirror.keyMap.default[(mac ? "Cmd" : "Ctrl") + "-Space"] = "autocomplete";
                        </script>
                    </div>

                    <div class="col-lg-6 order-lg-first">
                        <div class="card">
                            <div class="card-body">
                                <h2 class="card-title"><%=pro.getProblemTypeID()%></h2>
                                <div class="card-text" id="description">
                                    ### This is a test description
                                </div>
                                <h5>Time Limit: <%=pro.getTimeLimit()%> &nbsp;&nbsp;&nbsp;&nbsp; Memory Limit: <%=pro.getMemoryLimit()%></h5>
                            </div>

                            <script>
                                var string = `<%=pro.getProblemContent()%>`;
                                document.getElementById('description').innerHTML =
                                    marked(string);

                            </script>

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

