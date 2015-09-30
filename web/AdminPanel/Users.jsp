<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="Header.jsp"></jsp:include>
    <div class="contentbody" style="background-color: #F7F7F7">
    <jsp:include page="UserOption.jsp"></jsp:include>
        <div class="pusher">
            <div class="ui grid">
                <div class="two wide column">                
                </div>
                <div class="twelve wide column">
                    <div class="row"  style="margin-top: 25px; margin-bottom: 10px;"> 
                        <div class="col-xs-6 col-sm-4 col-md-3">
                            <div class="adduser">
                                <div class="ui segment">
                                    <div class="ui items" >
                                        <div class="item">
                                            <div class="ui tiny image">
                                                <img src="IMAGES/adduser.png" style="width: 70%;">
                                            </div>
                                            <div class="middle aligned content">
                                                <p class="header">View Users</p>
                                            </div>
                                        </div>   
                                    </div>
                                </div>
                            </div>
                            <div class="adduser">
                                <div class="ui segment">
                                    <div class="ui items" >
                                        <div class="item">
                                            <div class="ui tiny image">
                                                <img class="addicon" src="IMAGES/adduser.png" style="width: 70%;">
                                            </div>
                                            <div class="middle aligned content">
                                                <p class="header">Add User</p>
                                            </div>
                                        </div>   
                                    </div>
                                </div>
                            </div>
                            <div class="adduser">
                                <div class="ui segment">
                                    <div class="ui items" >
                                        <div class="item">
                                            <div class="ui tiny image">
                                                <img src="IMAGES/adduser.png" style="width: 70%;">
                                            </div>
                                            <div class="middle aligned content">
                                                <p class="header">Edit User</p>
                                            </div>
                                        </div>   
                                    </div>
                                </div>
                            </div>
                            <div class="adduser">
                                <div class="ui segment">
                                    <div class="ui items" >
                                        <div class="item">
                                            <div class="ui tiny image">
                                                <img src="IMAGES/adduser.png" style="width: 70%;">
                                            </div>
                                            <div class="middle aligned content">
                                                <p class="header">Remove User</p>
                                            </div>
                                        </div>   
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- right side-->
                        <div class="col-sm-12 col-md-9">
                            <div class="row">
                            <c:forEach step="1" begin="1" end="5">
                                <div class="col-sm-12 col-md-2">
                                    <div>
                                        <center><h3 class="usertypes">562</h3></center>
                                    </div>
                                    <div style="margin-top: 0px;">
                                        <center>Doctors</center>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>

                        <!-- user details-->
                        <div style="margin-top: 40px;">
                            <div style="margin-bottom: 20px;">
                                <h3 style="margin-bottom: -25px;">Add User</h3>
                                <div class="ui section divider"></div>
                            </div>
                            <div class="ui form">
                                <div class="field">
                                    <label>First Name</label>
                                    <input name="fname" placeholder="i.e. Albert" type="text">
                                </div>
                                <div class="field">
                                    <label>Last Name</label>
                                    <input name="lname" placeholder="Einstein" type="text">
                                </div>
                                <div class="field">
                                <label>Gender</label>
                                </div>
                                <div class="col-md-3">
                                    <div class="ui toggle checkbox checked" id="male">
                                        <input name="gender" checked="checked" type="radio">
                                        <label>Male</label>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="ui toggle checkbox" id="male">
                                        <input name="gender" type="radio">
                                        <label>Female</label>
                                    </div>
                                </div>
                                <div class="field">
                                    <label>Address Line 1</label>
                                    <input name="addr1" placeholder="Last Name" type="text">
                                </div>
                                <div class="field">
                                    <label>Address Line 2</label>
                                    <input name="addr2" placeholder="Last Name" type="text">
                                </div>
                                <div class="field">
                                    <label>Address Line 3</label>
                                    <input name="addr3" placeholder="Last Name" type="text">
                                </div>
                                <div class="field">
                                    <label>Contact No</label>
                                    <input name="addr1" placeholder="Primary" type="text">
                                    <input name="addr1" placeholder="Secondary (optional)" type="text">
                                </div>

                                <div class="row">
                                    <div class="col-md-3">
                                        <div class="ui toggle checkbox" id="male">
                                            <input name="usertype" checked="checked" type="radio">
                                            <label>Admin</label>
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <div class="ui toggle checkbox" id="male">
                                            <input name="usertype" type="radio">
                                            <label>Doctor</label>
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <div class="ui toggle checkbox" id="male">
                                            <input name="usertype" checked="checked" type="radio">
                                            <label>Patient</label>
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <div class="ui toggle checkbox" id="male">
                                            <input name="usertype" type="radio">
                                            <label>Nurse</label>
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <div class="ui toggle checkbox" id="male">
                                            <input name="usertype" type="radio">
                                            <label>PRO</label>
                                        </div>
                                    </div>
                                </div>

                                <button id="btnadduser" class="btn btn-info">Submit</button>
                            </div>
                        </div>
                    </div>
                </div>
                <div>
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
<script>
    $('.ui.checkbox').checkbox(function() {

    });
    $("#male").click(function() {

        $("#female").removeAttr('checked');
    });
    $("#female").click(function() {
        $("#male").removeAttr('checked');
    });
</script>


</body>
</html>