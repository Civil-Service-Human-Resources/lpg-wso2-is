<%--
  ~ Copyright (c) 2016, WSO2 Inc. (http://www.wso2.org) All Rights Reserved.
  ~
  ~  WSO2 Inc. licenses this file to you under the Apache License,
  ~  Version 2.0 (the "License"); you may not use this file except
  ~  in compliance with the License.
  ~  You may obtain a copy of the License at
  ~
  ~    http://www.apache.org/licenses/LICENSE-2.0
  ~
  ~ Unless required by applicable law or agreed to in writing,
  ~ software distributed under the License is distributed on an
  ~ "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
  ~ KIND, either express or implied.  See the License for the
  ~ specific language governing permissions and limitations
  ~ under the License.
  --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ page import="org.owasp.encoder.Encode" %>
<%@ page import="org.wso2.carbon.identity.mgt.endpoint.IdentityManagementEndpointUtil" %>
<%@ page import="org.wso2.carbon.identity.mgt.endpoint.IdentityManagementEndpointConstants" %>

<%
    boolean error = IdentityManagementEndpointUtil.getBooleanValue(request.getAttribute("error"));
    String errorMsg = IdentityManagementEndpointUtil.getStringValue(request.getAttribute("errorMsg"));
    String callback = (String) request.getAttribute("callback");
    String tenantDomain = (String) request.getAttribute(IdentityManagementEndpointConstants.TENANT_DOMAIN);
    if (tenantDomain == null) {
        tenantDomain = (String) session.getAttribute(IdentityManagementEndpointConstants.TENANT_DOMAIN);
    }

%>

<fmt:bundle basename="org.wso2.carbon.identity.mgt.endpoint.i18n.Resources">
    <html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Create a pas
    sword - Learning Platform for Government</title>

        <link rel="icon" href="images/favicon.png" type="image/x-icon"/>
        <!-- <link href="libs/bootstrap_3.3.5/css/bootstrap.min.css" rel="stylesheet">
        <link href="css/Roboto.css" rel="stylesheet">
        <link href="css/custom-common.css" rel="stylesheet"> -->

        <!--[if lt IE 9]>-->
        <!-- <script src="js/html5shiv.min.js"></script>
        <script src="js/respond.min.js"></script> -->
        <!-- <![endif]-->

        <link href="css/styles.css" rel="stylesheet">

    </head>

    <body>

    <!-- cookie-message -->
    <!-- <div id="global-cookie-message">
        <p>GOV.UK uses cookies to make the site simpler. <a href="https://www.gov.uk/help/cookies">Find out more about cookies</a></p>
    </div> -->
    <!-- /cookie-message -->

    <header class="with-proposition" id="global-header">
        <div class="header-wrapper">
            <div class="header-global">
                <div class="header-logo">
                    <a class="content" href="/" id="logo">Learning Platform for Government</a>
                </div>
            </div>
        </div>
    </header><!-- header-bar -->
    <div id="global-header-bar"></div><!-- /header-bar -->
    <main id="content">
        <!-- phase-banner -->
        <div class="phase-banner">
            <p><strong class="phase-tag">BETA</strong> <span>This is a new service – your <a href="#">feedback</a> will help us to improve it.</span></p>
        </div><!-- /phase-banner -->


        <div class="main-content">
            <div class="container">

                <div class="grid-row">
                    <div class="column-two-thirds">

                        <h1 class="heading-xlarge heading heading--page-heading"><span class="heading-secondary">Learning Platform for Government</span> Create a password</h1>
                        <% if (error) { %>
                            <div class="alert alert-danger" id="server-error-msg">
                                <%= Encode.forHtmlContent(errorMsg) %>
                            </div>
                        <% } %>

                    </div>
                </div>

                <div class="grid-row">
                    <div class="column-two-thirds">

                        <p class="lede">Create a password to complete your registration on the Civil Service Learning Platform.</p>

                        <div class="u-space-b30">
                            <p>Your password must have:</p>
                            <ul class="list-bullet criteria__list">
                                <li>8 or more characters</li>
                                <li>at least 1 number or symbol</li>
                                <li>upper and lower case letters</li>
                            </ul>
                        </div>

                        <form method="post" action="completepasswordreset.do" id="passwordResetForm">


                            <div class="alert alert-danger" id="error-msg" hidden="hidden"></div>

                            <div class="form-group required">
                                <label class="form-label" for="reset-password">Create a password</label>
                                <input class="form-control" id="reset-password" type="password" name="reset-password" value="" required="">
                            </div>

                            <%
                                if (callback != null) {
                            %>
                            <div>
                                <input type="hidden" name="callback" value="<%=callback %>"/>
                            </div>
                            <% } %>
                            <% if (tenantDomain != null) { %>
                            <div>
                                <input type="hidden" name="tenantdomain" value="<%=tenantDomain %>"/>
                            </div>
                            <% } %>


                            <div class="form-group required">
                                <label class="form-label  " for="reset-password2">Retype your password</label>
                                <input class="form-control" id="reset-password2" type="password" name="reset-password2" value="" data-match="reset-password" required="">
                            </div>


                            <div class="form-group">
                                <%--<input class="button" id="submit" type="submit" value="Continue">--%>
                                <button id="submit" class="button" type="submit">Continue</button>
                            </div>


                        </form>

                    </div>
                </div>
            </div>
        </div>

    </main>

    <footer class="group js-footer" id="footer" role="contentinfo">
        <div class="footer-wrapper">
            <%--<div class="footer-meta">--%>
                <%--<div class="footer-meta-inner">--%>
                    <%--<div class="open-government-licence">--%>
                        <%--<p class="logo"><a href="https://www.nationalarchives.gov.uk/doc/open-government-licence/version/3/" rel="license">Open Government Licence</a></p>--%>
                        <%--<p>All content is available under the <a href="https://www.nationalarchives.gov.uk/doc/open-government-licence/version/3/" rel="license">Open Government Licence v3.0</a> , except where otherwise stated</p>--%>
                    <%--</div>--%>
                <%--</div>--%>
                <%--<div class="copyright">--%>
                    <%--<a href="https://www.nationalarchives.gov.uk/information-management/re-using-public-sector-information/copyright-and-re-use/crown-copyright/">© Crown copyright</a>--%>
                <%--</div>--%>
            <%--</div>--%>
    <br><br><br><br><br><br>
        </div>
    </footer>







    <!-- OLD STUFF BELOW -->



    <script src="libs/jquery_1.11.3/jquery-1.11.3.js"></script>
    <script src="libs/bootstrap_3.3.5/js/bootstrap.min.js"></script>

    <script type="text/javascript">
        $(document).ready(function () {

            $("#passwordResetForm").submit(function (e) {

                var password = $("#reset-password").val();
                var password2 = $("#reset-password2").val();
                var error_msg = $("#error-msg");

                if (!password || 0 === password.length) {
                    error_msg.text("Password cannot be empty.");
                    error_msg.show();
                    $("html, body").animate({scrollTop: error_msg.offset().top}, 'slow');
                    return false;
                }

                if (password != password2) {
                    error_msg.text("Passwords did not match. Please try again.");
                    error_msg.show();
                    $("html, body").animate({scrollTop: error_msg.offset().top}, 'slow');
                    return false;
                }

                return true;
            });
        });

    </script>
    </body>
    </html>
</fmt:bundle>
