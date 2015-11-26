<jsp:include page="PharmacistsHeader.jsp"></jsp:include>
    <div class="contentbody" style="background-color: #F7F7F7">
    <jsp:include page="PharmacistsUserOption.jsp"></jsp:include>
        <div class="pusher">
            <div class="ui grid">
                <div class="two wide column">                
                </div>
                <div class="twelve wide column"> 
                    
                   
                    <div class="six wide column">
                        <table class="ui celled table">
                            <tbody>
                                <tr>
                                    <td>
                                        <div class="ui ribbon label">User Name</div>
                                    </td>
                                    <td>${pharmacist.username}</td>
                                </tr>
                                <tr>
                                    <td>User Id</td>
                                    <td>${pharmacist.userID}</td>
                                </tr>
                                <tr>
                                    <td>Email</td>
                                    <td>${pharmacist.email}</td>
                                </tr>
                                <tr>
                                    <td>First Name</td>
                                    <td>${pharmacist.fName}</td>
                                </tr>
                                <tr>
                                    <td>Last Name</td>
                                    <td>${pharmacist.lName}</td>
                                </tr>
                                <tr>
                                    <td>Gender</td>
                                    <td>${pharmacist.gender}</td>
                                </tr>
                                <tr>
                                    <td>Address</td>
                                    <td>${pharmacist.address1}</td>
                                </tr>
                                <tr>
                                    <td>Contact No</td>
                                    <td>${pharmacist.signUpDate}</td>
                                </tr>
                            </tbody>
                        </table>
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