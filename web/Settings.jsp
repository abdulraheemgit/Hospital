<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="Header.jsp"></jsp:include>
    <div class="contentbody" style="background-color: #F7F7F7">
    <jsp:include page="UserOption.jsp"></jsp:include>
        <div class="pusher">
            <div class="ui grid">
                <div class="two wide column">                
                </div>
                <div class="twelve wide column">
                    <div class="row"  style="margin-top: 15px; margin-bottom: 30px;"> 
                        <!--Edit Here-->

                        <h2 style="padding-left: 70px;font-size: 250%;">My Profile</h2>
                        <div class="col-md-2"></div>
                        <div class="col-md-8 col-sm-12">
                            <div class="ui top attached tabular menu fluid">
                                <a class="item active" data-tab="profile">Profile Settings</a>
                                <a class="item fluid" data-tab="account">Account Settings</a>                                
                            </div>
                            
                            <div class="ui bottom attached tab segment active" style="padding-left: 30px;margin-bottom: 15px;" data-tab="profile">
                                <form id="frmprofile" method="GET" action="/Hospital/Main?action=profilesettings">
                                <table class="ui celled table">
                                    <tbody>
                                        <tr>
                                            <td><p class="ui ribbon label">First Name</p></td>
                                            <td class="ui input fluid" class="center aligned"><input class="center aligned" name="fname" type="text" value="${user.fName}"></td>
                                        </tr>
                                        <tr>
                                            <td><p class="ui ribbon label">Last Name</p></td>
                                            <td class="ui input fluid" class="center aligned"><input class="center aligned" name="lname" type="text" value="${user.lName}"></td>
                                        </tr>
                                        <tr>
                                            <td><p class="ui ribbon label">NIC</p></td>
                                            <td class="center aligned">${user.nic}</td>
                                        </tr>
                                        <tr>
                                            <td><p class="ui ribbon label">Gender</p></td>
                                            <td class="ui input fluid center aligned">
                                                <div class="ui selection dropdown">
                                                    <input type="hidden" name="gender" value="${user.gender}">
                                                    <i class="dropdown icon"></i>
                                                    <div class="default text">Gender</div>
                                                    <div class="menu">
                                                      <div class="item" data-value="M">Male</div>
                                                      <div class="item" data-value="F">Female</div>
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td><p class="ui ribbon label">Address Line 1</p></td>
                                            <td class="center aligned ui input fluid"><input class="center aligned" name="address1" type="text" value="${user.address1}"></td>
                                        </tr>
                                        <tr>
                                            <td><p class="ui ribbon label">Address Line 2</p></td>
                                            <td class="center aligned ui input fluid"><input class="center aligned" name="address2" type="text" value="${user.address2}"></td>
                                        </tr>
                                        <tr>
                                            <td><p class="ui ribbon label">Address Line 3</p></td>
                                            <td class="center aligned ui input fluid"><input class="center aligned" name="address3" type="text" value="${user.address3}"></td>
                                        </tr>
                                        <tr>
                                            <td><p class="ui ribbon label">Contact No</p></td>
                                            <td class="ui input fluid center aligned">                                        
                                                <input id="contact1" class="center aligned" name="contact1" type="text" value="${user.contacts[0].contactNo}">  &nbsp;
                                                <input id="contact2" class="center aligned" name="contact2" type="text" value="${user.contacts[1].contactNo}">  &nbsp;
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                                <input id="btnprofile" class="btn btn-info form-control" disabled type="submit" value="Save Changes">
                                </form>
                            </div>
                            <div class="ui bottom attached tab segment" style="padding-left: 30px;margin-bottom: 15px;" data-tab="account">
                                <form id="frmaccount" method="GET" action="/Hospital/Main?action=accountsettings">
                                <table class="ui celled table">
                                    <tbody>
                                        <tr>
                                            <td><p class="ui ribbon label">User Id</p></td>
                                            <td class="center aligned ui input fluid"><input style="border: 0px;" id="userid" class="center aligned" name="userid" type="text" value="${user.userID}"></td>
                                        </tr>
                                        <tr>
                                            <td><p class="ui ribbon label">User Name</p></td>
                                            <td class="center aligned">${user.username}</td>
                                        </tr>
                                        <tr>
                                            <td><p class="ui ribbon label">Old Password</p></td>
                                            <td class="center aligned ui input fluid"><input id="oldpassword" class="center aligned" name="oldpassword" type="text" placeholder="Old Password"></td>
                                        </tr>
                                        <tr>
                                            <td><p class="ui ribbon label">New Password</p></td>
                                            <td class="ui input center aligned fluid">                                        
                                                <input id="editnewpassword" class="center aligned" name="editpassword" type="text" placeholder="New Password">  &nbsp;
                                                <input id="editrepassword" class="center aligned" name="editre-password" type="text" placeholder="Re-Enter Password">  &nbsp;
                                            </td>
                                        </tr>
                                        <tr>
                                            <td><p class="ui ribbon label">E-Mail</p></td>
                                            <td class="ui input fluid" class="center aligned"><input id="editemail" class="center aligned" name="email" type="text" value="${user.email}"></td>
                                        </tr>
                                        <tr>
                                            <td><p class="ui ribbon label">Joined Date</p></td>
                                            <td class="center aligned">${user.signUpDate}</td>
                                        </tr>
                                    </tbody>
                                </table>
                                <input id="btnaccount" class="btn btn-info form-control" disabled type="submit" value="Save Changes">
                                </form>
                            </div>
                        </div>
                    <div class="col-md-2"></div>
                </div>
            </div>
            <div class="two wide column">  
                <c:choose>
                    <c:when test="${empty user.username}"></c:when>
                    <c:otherwise>
                        <div class="ui togglebar button black right floated">
                            <span class="glyphicon glyphicon-triangle-left" aria-hidden="true"></span>
                            <i class="tasks icon"></i>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </div>
</div>
<jsp:include page="Footer.jsp"></jsp:include>
<script>
    $('.menu .item').tab();
    $(".ui.dropdown").dropdown();
    $("#frmprofile :input").change(function() {
        $("#btnprofile").removeAttr("disabled");
    });
    $("#frmaccount :input").change(function() {
        $("#btnaccount").removeAttr("disabled");
    });
    $("#frmaccount").submit(function (event){
        a = $("#editemail").val();
        
        if(isEmail(a) && $("#editnewpassword").val() === $("#editrepassword").val()){
            alert("sdsd");
            if($("#editnewpassword").val() !== "" && $("#oldpassword").val() === ""){
                alert("pp");
                event.preventDefault();
            }else{
                return;
            }
        }
        event.preventDefault();
    });
    $("#frmprofile").submit(function (event){
        
        if($("#contact1").val() !== ""){
            alert("1");
            if(isnumber($("#contact1").val())){
                alert("2");
                if($("#contact2").val() !== ""){
                    alert("3");
                    if(isnumber($("#contact2").val())){
                        return;
                    }else{
                        alert("4");
                        event.preventDefault();
                    }
                }else{
                    return;
                }
            }
        }
        event.preventDefault();
    });
    
    $("#oldpassword").blur(function(){
        
    });
    $("#btnprofile").click(function(){
        $("#frmprofile").submit(function (event){
            
        });
    });
    $("#btnaccount").click(function(){
        $("#frmaccount").submit(function (event){
            
        });
    });
</script>

</body>
</html>