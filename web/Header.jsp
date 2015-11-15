<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Hospital</title>
        <link href="CSS/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="CSS/semantic.css" rel="stylesheet" type="text/css"/>
        <link href="CSS/toastr.css" rel="stylesheet" type="text/css"/>
        <link href="CSS/custom.css" rel="stylesheet" type="text/css"/>
        <link href="CSS/datepicker.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div class="ui modal small thanku">
            <i class="close icon"></i>
            <div class="header">
                <p style="text-align: center;">Thank You!</p>
            </div>
            <div class="content" style="margin: 25px;">
                <div class="ui form">
                    <h4>You are successfully signed In.</h4>
                </div>
            </div>
            <div class="actions">
                <div class="ui button">Close</div>
            </div>
        </div>

        <!-- Login Model Form-->
        <div class="ui modal small login">
            <i class="close icon"></i>
            <div class="header">
                <p style="text-align: center;">Login Credentials</p>
            </div>
            <form method="post" action="/Hospital/Main?action=login" class="ui form">
                <div class="content" style="margin: 25px;">
                    <div class="ui form">
                        <div class="field">
                            <input type="text" placeholder="Username..." name="username"><br>
                        </div>
                        <div class="field">
                            <input type="password" placeholder="password... " name="password">
                        </div>
                    </div>
                </div>
                <div class="actions">
                    <input class="ui primary button" type="submit" value="Login">
                    <div class="ui button">Cancel</div>
                </div>
            </form>
        </div><!-- //Login Model Form ends here-->

        <!-- Sign up Model Form-->
        <div class="ui modal small signitup">

            <i class="close icon"></i>
            <div class="header">
                <p style="text-align: center;">Enter Credentials</p>
            </div>
            <form method="post" action="/Hospital/Main?action=signup" class="ui form">
                <div class="content" style="margin: 25px;">
                    <div class="ui form">
                        <div class="field">
                            <input id="username" type="text" placeholder="Username..." name="username"><br>
                            <div id="userdiv" class="right floated"></div>
                        </div>
                        <div class="field">
                            <input id="password" type="password" placeholder="password... " name="password">
                        </div>
                        <div class="field">
                            <input id="re-password" type="password" placeholder="Re-Enter password">
                            <div id="passdiv" class="right floated"></div>
                        </div>
                        <div class="field">
                            <input id="email" type="email" placeholder="e-mail" name="email">
                            <div id="maildiv" class="right floated"></div>
                        </div>
                        <div id="agreement" class="ui toggle checkbox">
                            <input id="agreements" type="checkbox">
                            <label id="lblagreement" style="font-size: 85%;">Agreed to the terms and conditions.</label>
                        </div>
                    </div>
                </div>
                <div class="actions">
                    <div id="btnsignup" class="ui primary button" >Submit</div>
                    <div class="ui button">Cancel</div>
                </div>
            </form>
        </div><!-- //Sign up Model Form-->


        <!-- header-->
        <div style="background-color: white; padding-bottom: 0px;">
            <div class="row" style="padding-bottom: 17px;padding-top: 13px;">
                <div class="col-md-1">  
                </div>            
                <div class="col-md-10"> 
                    <div class="row">
                        <div class="col-md-2 col-sm-3 col-xs-3">                      
                        </div>
                        <div class="col-md-3 col-sm-5  col-xs-5"> 
                            <p style="font-size:22px; margin-top: 60px; margin-bottom: 0px; margin-left: -30px;">H<span style="text-decoration: underline;">o</span>lycross H<span style="text-decoration: underline;">o</span>spital</p>
                        </div>
                        <div class="col-md-4 col-sm-4  col-xs-4" style="padding-left: 0px;">  
                            <img src="IMAGES/1.jpg" style="padding: 0px; width: 150px;  margin: 0px;margin-left: -20px;" alt="Logo">
                        </div>
                        <div class="col-md-3">  
                        </div>
                    </div>
                </div>
                <div class="col-md-1">   
                </div>
            </div>
            <div class="row" style="padding-bottom: 0px;">
                <div class="col-md-2 col-lg-1">
                </div>
                <div class="col-xs-12 col-md-8 col-lg-10">
                    <nav class="navbar navbar-default" role="navigation">
                        <div class="navbar-header">
                            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-collapse-01">
                                <span class="sr-only">Toggle navigation</span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                            </button>
                        </div>
                        <div class="collapse navbar-collapse" id="navbar-collapse-01">
                            <ul class="nav navbar-nav">           
                                <li class="active"><a href="#"><i class="home icon"></i> Home</a></li>
                                <li><a href="#"><i class="user icon"></i> About Us</a></li>
                                <li><a href="#"><i class="treatment icon"></i> Services</a></li>
                                <li class="dropdown">
                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><i class="openid icon"></i>Facilities</a>
                                    <ul class="dropdown-menu">
                                        <li><a href="/Hospital/Main?action=echannel">e-channel</a></li>
                                        <li><a href="#">Laboratory</a></li>
                                        <li><a href="/Hospital/Main">Test Reports</a></li>
                                    </ul>
                                </li>
                                <li><a href="#"><i class="help icon"></i> Help</a></li>
                            </ul>          
                            <c:choose>
                                <c:when test="${!empty user.username}">
                                    <ul class="nav navbar-right">
                                        <li><a href="#"><i class="angellist  icon"></i> Welcome ${user.username}</a></li>
                                    </ul>                                     
                                </c:when>
                                <c:otherwise>
                                    <ul class="nav navbar-right">
                                        <li class="btnsignup"><a href="#"><i class="angellist  icon"></i> Sign Up</a></li>
                                    </ul> 
                                    <ul class="nav navbar-right">
                                        <li class="btnlogin"><a href="#"><i class="angellist  icon"></i> Sign In</a></li>
                                    </ul> 
                                </c:otherwise>
                            </c:choose>
                        </div><!-- /.navbar-collapse -->
                    </nav><!-- /navbar -->
                </div>
                <div class="col-md-2 col-lg-1">
                </div>
            </div>
        </div><!-- header ends here-->