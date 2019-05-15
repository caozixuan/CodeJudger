<%@ page import="ssm.model.Submit" %>
<%@ page import="java.util.List" %>
<%@ page import="ssm.model.UserInformation" %><%--
  Created by IntelliJ IDEA.
  User: zsh
  Date: 2019-05-08
  Time: 23:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Profile</title>
    <script src="${pageContext.request.contextPath}/heatmap/d3.v3.min.js"></script>
    <script src="${pageContext.request.contextPath}/heatmap/cal-heatmap.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/heatmap/cal-heatmap.css">
    <!--    <script type="text/javascript" src="//d3js.org/d3.v3.min.js"></script>-->
    <!--    <script type="text/javascript" src="//cdn.jsdelivr.net/cal-heatmap/3.3.10/cal-heatmap.min.js"></script>-->
    <!--    <link rel="stylesheet" href="//cdn.jsdelivr.net/cal-heatmap/3.3.10/cal-heatmap.css" />-->
    <script src="${pageContext.request.contextPath}/assets/plugins/fullcalendar/js/moment.min.js"></script>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

    <script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/require.min.js"></script>
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
    <!-- c3.js Charts Plugin -->
    <link href="${pageContext.request.contextPath}/assets/plugins/charts-c3/plugin.css" rel="stylesheet" />
    <script src="${pageContext.request.contextPath}/assets/plugins/charts-c3/plugin.js"></script>
    <style>
        .graph-domain{
            overflow: visible !important;,
        }
        .subdomain-text{
            font-size: 8px !important;
        }
    </style>
</head>
<body>
<div class="page">
    <div class="container">
        <div class="row">
            <div class="col-lg-4">
                <div class="card">
                    <div class="card-header">
                        <h3 class="card-title">My Profile</h3>
                    </div>
                    <div class="card-body">
                        <form>
                            <div class="row">
                                <div class="col-auto">
                                    <span class="avatar avatar-xl" style="background-image: url(${pageContext.request.contextPath}demo/faces/female/9.jpg)"></span>
                                </div>
                                <div class="col">
                                    <div class="form-group">
                                        <label class="form-label">Email-Address</label>
                                        <input class="form-control" placeholder="your-email@domain.com"/>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="form-label">Bio</label>
                                <textarea class="form-control" rows="5">Big belly rude boy, million dollar hustler. Unemployed.</textarea>
                            </div>
                            <div class="form-footer">
                                <button class="btn btn-primary btn-block">Save</button>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="card">
                    <div class="card-header">
                        <h3 class="card-title">Progress</h3>
                    </div>
                    <div class="card-body">
                        <table class="table card-table table-vcenter">
                            <tbody>
                            <tr>
                                <td><i class="fa fa-question"></i>&nbsp;&nbsp;Solved Question</td>
                                <td><span class="tag tag-green tag-rounded"><%=request.getAttribute("solvedProblemsCount")%> / <%=request.getAttribute("totalProblemsCount")%></span></td>
                            </tr>

                            <tr>
                                <td><i class="fa fa-cog"></i>&nbsp;&nbsp;Accepted Submission</td>
                                <%UserInformation currentUserInfo = (UserInformation) request.getAttribute("userInfo");%>
                                <td><span class="tag tag-green tag-rounded"><%=currentUserInfo.getTotalRightCount()%> / <%=currentUserInfo.getTotalSubmitCount()%></span></td>
                            </tr>
                            <tr>
                                <td><i class="fa fa-check"></i>&nbsp;&nbsp;Acceptance Rate</td>
                                <td><span class="tag tag-azure tag-rounded"><%=((double) currentUserInfo.getTotalRightCount()) * 100 / currentUserInfo.getTotalSubmitCount()%> %</span></td>
                            </tr>
                            </tbody>
                        </table>
                        <div id="chart-pie" style="height: 16rem"></div>
                    </div>
                </div>
                <script>
                    require(['c3', 'jquery'], function(c3, $) {
                        $(document).ready(function(){
                            var chart = c3.generate({
                                bindto: '#chart-pie', // id of chart wrapper
                                data: {
                                    columns: [
                                        // each columns data
                                        ['data1', 63],
                                        ['data2', 34],
                                        ['data3', 12],
                                        ['data4', 14],
                                        ['data5', 10]
                                    ],
                                    type: 'pie', // default type of chart
                                    colors: {
                                        'data1': tabler.colors["green"],
                                        'data2': tabler.colors["red"],
                                        'data3': tabler.colors["orange"],
                                        'data4': tabler.colors["yellow"],
                                        'data5': tabler.colors["pink"]
                                    },
                                    names: {
                                        // name of each serie
                                        'data1': 'Accepted',
                                        'data2': 'Wrong Answer',
                                        'data3': 'Runtime Error',
                                        'data4': 'Time Limited',
                                        'data5': 'Compile Error',
                                    }
                                },
                                axis: {
                                },
                                legend: {
                                    show: false, //hide legend
                                },
                                padding: {
                                    bottom: 0,
                                    top: 0
                                },
                            });
                        });
                    });
                </script>
            </div>
            <div class="col-lg-8">
                <div class="card">
                    <div class="card-header">
                        <h3 class="card-title">Submission Activity</h3>
                    </div>
                    <div class="card-body align-content-center">
                        <div id="cal-heatmap" class="align-self-center" style="height: 100rem"></div>
                        <script type="text/javascript">
                            var cal = new CalHeatMap();
                            let nowDate = new Date();
                            let startDate = new Date(nowDate.getFullYear()-1, nowDate.getMonth(), nowDate.getDate());
                            let currentMonth = new Date(nowDate.getFullYear()-1, nowDate.getMonth(), nowDate.getDate());

                            cal.init({
                                itemSelector: "#cal-heatmap",
                                itemName:["Submission", "Submissions"],
                                domain: "week",
                                domainLabelFormat:function (date) {
                                    let md = moment(date);
                                    //only show the label for the first domain of the month
                                    if (md.month() === currentMonth)
                                        return "";
                                    //reset the current month
                                    currentMonth = md.month();
                                    //return the label
                                    return md.format("MMM");
                                },
                                subDomain:"day",
                                data: <%=request.getAttribute("submitsByUuidJSON")%>,
                                start: startDate,
                                cellSize: 10,
                                range: 53,
                                legend: [1, 2, 3, 4],
                                highlight: "now",
                                label: {
                                    offset:{x:20}
                                }
                            });
                        </script>
                    </div>
                </div>

                <div class="card">
                    <div class="card-header">
                        <h3 class="card-title">Solve Activity</h3>
                    </div>
                    <div class="table-responsive">
                        <table class="table card-table table-striped table-vcenter">
                            <thead>
                            <tr>
                                <th>Problem</th>
                                <th>Date</th>
                                <th>State</th>
                            </tr>
                            </thead>
                            <tbody>
                            <%for(Submit submit: (List<Submit>) request.getAttribute("submits")) {%>
                                <tr>
                                <td class="text-center"><%=submit.getProblemName()%></td>
                                <td class="text-center"><%=submit.getSubmitDate()%></td>
                                <td class="text-center"><span class="tag tag-rounded tag-azure"><%=submit.getCodeLanguage()%></span>&nbsp;&nbsp;
                                    <%if (submit.isPassed()) {%>
                                        <span class="tag tag-rounded tag-green">Accepted</span></td>
                                    <%}
                                    else {%>
                                        <span class="tag tag-rounded tag-red">Wrong Answer</span></td>
                                    <% }%>
                            </tr>
                            <%}%>
                            <%--<tr>--%>
                                <%--<td>Problem2</td>--%>
                                <%--<td class="text-nowrap">Apr 19, 2018</td>--%>
                                <%--<td><span class="tag tag-rounded tag-azure">C++</span>&nbsp;&nbsp;<span class="tag tag-rounded tag-red">Wrong Answer</span></td>--%>
                            <%--</tr>--%>
                            <%--<tr>--%>
                                <%--<td>Problem3</td>--%>
                                <%--<td class="text-nowrap">Nov 22, 2018</td>--%>
                                <%--<td><span class="tag tag-rounded tag-azure">Python</span>&nbsp;&nbsp;<span class="tag tag-rounded tag-pink">Compile Error</span></td>--%>
                            <%--</tr>--%>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>

</body>
</html>

