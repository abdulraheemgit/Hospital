<%-- 
    Document   : patientsetting
    Created on : Nov 17, 2015, 8:18:27 PM
    Author     : Anobiya
--%>

<jsp:include page="Header.jsp"></jsp:include>
    <div class="contentbody" style="background-color: #F7F7F7">
    <jsp:include page="UserOption.jsp"></jsp:include>
        <div class="pusher">
            <div class="ui grid">
                <div class="two wide column">                    
                </div>
                <div class="twelve wide column">
                    <div class="row" style="margin-top: 15px; margin-bottom: 10px;">
                        <form class="ui form" method="post" action="Main?action=updatePatients">
                        
                        <div class="field">
                            
                            <div class="fields">
                                <div class="twelve wide field">
                                    <div style="color: #009900;">${updateSuccessMessage}</div>
                                </div>
                                <div class="four wide field">
                                    <div style="color: #FF0000;">${updateErrorMessage}</div>
                                </div>
                            </div>
                        </div>
                                <div>
                                    <label>Settings</label>
                                </div>
                        
                        <div class="fields">
                            <div class="twelve wide field">
                                <label>Enter New Email Address</label>
                                <div style="color: #FF0000;">${emailerrorMessage}</div>
                                <input type="email" name="patientemail" maxlength="16" placeholder="abc@gmail.com">
                            </div>
                            <div class="twelve wide field" >
                                <label>Current Password</label>
                                <div style="color: #FF0000;">${passworderrorMessage}</div>
                                <input type="password" name="currentpassword">
                            </div> 
                            <div class="twelve wide field">
                                <label>New Password</label>
                                <input type="password" name="password" maxlength="16" required="">
                            </div>    
                            <div class="twelve wide field">
                                <label>Confirm New Password</label>
                                <div style="color: #FF0000;">${passworderrorMessage}</div>
                                <input type="password" name="confirmpassword" maxlength="16" required="">
                            </div>
                            <div class="six wide field"></div>
                        </div>
                       
                        <button class="btn btn-info" name="update">Submit</button>
                    </form>
                    </div>
                </div>
                <div class="two wide column">
                    <div class="ui togglebar button black right floated">
                        <span class="glyphicon glyphicon-triangle-left" aria-hidden="true"></span>
                        <i class="tasks icon"> </i>
                    </div>
                </div>
            </div>
        </div>
    </div>
<jsp:include page="Footer.jsp"></jsp:include>