<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Control Panel</title>
        <link href="CSS/semantic.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div class="ui page grid">
            <div class="ui  grid">
                <div class="centered row" style="padding-top: 20%;">
                    <div class="six wide column" style="background:#eee;padding:1em;">
                        <form method="post" action="/Hospital/MainBackEnd?action=login" class="ui form">
                            <div class="ui header center aligned">Login Credentials</div>
                            <div class="ui divider"></div>
                            <div style="color: #FF0000;">${error}</div>
                            <div class="field">
                                <label>Username</label> <input type="text" name="username" placeholder="Username here..." />
                            </div>
                            <div class="field">
                                <label>Password</label> <input type="password" name="password" placeholder="Password here..."/>
                            </div>
                            <div class="ui divider"></div>
                            <div class="field">
                                <input type="hidden" name="action" value="login" /> 
                                <input class="fluid ui green button" type="submit" name="btnsubmit" value="Sign In" />
                            </div>
                        </form>
                        <div class="ui divider"></div>
                        <div class="field">
                            <a href="/Hospital/MainBackEnd?action=fpassword"><p>Forgot password?</p></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <script src="JS/jquery-1.11.3.min.js" type="text/javascript"></script>
        <script src="JS/semantic.min.js" type="text/javascript"></script>
        <script src="JS/toastr.js"></script>

        <!--<script>	
            $(document).ready(function(){
                _error = '${error}';
               if(_error != '') {
                       toastr.error(_error);
               }			
            });
	</script>-->
    </body>
</html>
