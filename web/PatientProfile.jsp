<%-- 
    Document   : PatientProfile
    Created on : Nov 18, 2015, 9:54:59 PM
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
                    <div class="row"  style="margin-top: 15px; margin-bottom: 10px;"> 
                    <!--Edit Here-->
                    <h2>My Profile</h2>
                    <div class="six wide column">
                        <table class="ui celled table">
                            <tbody>
                                <tr>
                                    <td>
                                        <div class="ui ribbon label">User Name</div>
                                    </td>
                                    <td>${user.username}</td>
                                </tr>
                                <tr>
                                    <td>User Id</td>
                                    <td>${user.userID}</td>
                                </tr>
                                <tr>
                                    <td>First Name</td>
                                    <td>${user.fName}</td>
                                </tr>
                                <tr>
                                    <td>Last Name</td>
                                    <td>${user.lName}</td>
                                </tr>
                                <tr>
                                    <td>Gender</td>
                                    <td>${user.gender}</td>
                                </tr>
                                <tr>
                                    <td>Address</td>
                                    <td>${user.address1}</td>
                                </tr>
                                <tr>
                                    <td>Contact No</td>
                                    <td>${user.contactNo}</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    </div>
                <div class="ui vertically divided grid">
                        <div class="row">
                            <div class="six wide column">
                                <a class="btn btn-info" href="Medication.jsp"> Medications</a>
                            </div>
                            <div class="six wide column">
                                <a class="btn btn-info" href="Tests.jsp"> Test Details</a>
                            </div>
                        </div>
                    </div>    
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