<jsp:include page="PharmacistsHeader.jsp"></jsp:include>
    <div class="contentbody" style="background-color: #F7F7F7">
    <jsp:include page="PharmacistsUserOption.jsp"></jsp:include>
        <div class="pusher">
            <div class="ui grid">
                <div class="two wide column">                
                </div>
                <div class="twelve wide column"> 


                    <form class="ui form" method="post" action="/Hospital/MainBackEnd?action=updatePharmacists">
                        
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
                        
                        <div class="field">
                            
                        </div>
                        <div class="fields">
                            <div class="seven wide field">
                                <label>Enter New Email Address</label>
                                <div style="color: #FF0000;">${emailerrorMessage}</div>
                                <input type="email" name="patientemail" maxlength="16" placeholder="abc@gmail.com">
                            </div>
                                <!--
                            <div class="seven wide field">
                                <label>Enter New Contact No</label>
                                <div style="color: #FF0000;">${contacterrorMessage}</div>
                                <input type="text" name="contactNo" maxlength="16" placeholder="07........">
                            </div>
                                -->
                            <div class="seven wide field">
                                <label>Enter New Password</label>
                                <input type="password" name="password" maxlength="16" required="">
                            </div>    
                            <div class="seven wide field">
                                <label>Conform New Password</label>
                                <div style="color: #FF0000;">${passworderrorMessage}</div>
                                <input type="password" name="conformpassword" maxlength="16" required="">
                            </div>
                            <div class="three wide field">
                                
                            </div>
                            <div class="six wide field">
                                
                            </div>
                        </div>
                       
                        <button class="btn btn-info" name="update">Submit</button>
                    </form>


                </div>
                <div class="two wide column">  
                    <div class="ui togglebar button black right floated">
                        <span class="glyphicon glyphicon-triangle-left" aria-hidden="true"></span>
                        <i class="tasks icon"></i>
                    </div>
                </div>

            </div>
        </div>
    </div>
<jsp:include page="Footer.jsp"></jsp:include>

</body>
</html>