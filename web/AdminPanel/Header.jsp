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
    </head>
    <body>
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
                                <li class="active"><a href="/Hospital/MainBackEnd?action=admindash"><i class="dashboard icon"></i> Dashboard</a></li>
                                <li><a href="/Hospital/MainBackEnd?action=users"><i class="user icon"></i> Users</a></li>
                                <!--<li><a href="#"><i class="mail icon"></i> Messages</a></li>-->
                                <li class="dropdown">
                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><i class="fork icon"></i>Functions</a>
                                    <ul class="dropdown-menu">
                                        <li><a href="/Hospital/MainBackEnd?action=medicine">Medicine</a></li>
                                        <li><a href="/Hospital/MainBackEnd?action=test">Tests</a></li>
                                        <li><a href="/Hospital/MainBackEnd?action=addreport">Test Reports</a></li>
                                    </ul>
                                </li>
                            </ul>          
                            <ul class="nav navbar-right">
                                <li><a href="#"><i class="angellist  icon"></i> Hi ${user.username}</a></li>
                            </ul>
                        </div><!-- /.navbar-collapse -->
                    </nav><!-- /navbar -->
                </div>
                <div class="col-md-2 col-lg-1">
                </div>
            </div>
        </div><!-- header ends here-->
