<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="Header.jsp"></jsp:include>
    <div class="contentbody" style="background-color: #F7F7F7">
    <jsp:include page="UserOption.jsp"></jsp:include>
        <div class="pusher">
            <div class="ui grid">
                <div class="two wide column">                
                </div>
                <div class="twelve wide column">
                    <div class="row"  style="margin-top: 25px; margin-bottom: 80px;"> 
                        <div class="col-xs-6 col-sm-6 col-md-3">
                            <div class="adduser">
                                <div class="ui segment">
                                    <div class="ui items" >
                                        <div class="item">
                                            <div class="ui tiny image">
                                                <img class="uimg" src="IMAGES/view.jpg" style="width: 70%;">
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
                                                <img src="IMAGES/update.jpg" style="width: 70%;">
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
                                                <img src="IMAGES/delete.jpg" style="width: 70%;">
                                            </div>
                                            <div class="middle aligned content">
                                                <p class="header">Remove User</p>
                                            </div>
                                        </div>   
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-xs-6 col-sm-6"></div>
                        <!-- right side-->
                        <div class="col-sm-12 col-md-9">
                            <div class="row" id="divcount">
                            <c:forEach items="${types}" var="type">
                                <div class="col-xs-6 col-sm-4 col-md-2">
                                    <div>
                                        <center><h3 class="usertypes">${type.count}</h3></center>
                                    </div>
                                    <div style="margin-top: 0px;">
                                        <center>${type.userType}</center>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>

                        <!--add user -->
                        <div id="adduserdiv" style="margin-top: 40px;">
                            <div style="margin-bottom: 20px;">
                                <h3 style="margin-bottom: -25px;">Add User</h3>
                                <div class="ui section divider"></div>
                            </div>
                            <form id="signup" method="POST" action="/Hospital/MainBackEnd">
                                <input hidden name="action" value="signup">
                                <div class="ui form">
                                    <div class="field">
                                        <label>First Name</label>
                                        <input name="fname" required placeholder="i.e. Albert" type="text">
                                    </div>
                                    <div class="field">
                                        <label>Last Name</label>
                                        <input name="lname" required placeholder="Einstein" type="text">
                                    </div>
                                    <div class="field">
                                        <label>Date Of Birth</label>
                                        <input id="date" type="text" required name="dob" placeholder="Click to add date"/>

                                    </div>
                                    <div class="field">
                                        <label>Email</label>
                                        <input id="email" required type="email" placeholder="example@gmail.com" name="email">
                                        <div id="maildiv" class="right floated"></div>
                                    </div>
                                    <div class="field">
                                        <label>NIC</label>
                                        <input name="nic" required placeholder="NIC/passport/driving licence" type="text">
                                    </div>
                                    <div class="field">
                                        <label>Gender</label>
                                    </div>
                                    <div class="col-md-3">
                                        <div class="ui toggle checkbox checked" id="male">
                                            <input name="gender" checked="checked" type="radio" value="m">
                                            <label>Male</label>
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <div class="ui toggle checkbox" id="male">
                                            <input name="gender" type="radio" value="f">
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
                                        <input name="contact" placeholder="Primary" type="text" required>
                                        <input name="contact" placeholder="Secondary (optional)" type="text">
                                    </div>
                                    <br>
                                    <div class="ui section divider"></div>
                                    <br>

                                    <div class="field">
                                        <label>User ID</label>
                                        <input id="userid" name="username" value="${lastid}" type="text" disabled>
                                    </div>
                                    <div class="field">
                                        <label>Username</label>
                                        <input id="username" type="text" placeholder="Username..." name="username" required><br>
                                        <div id="userdiv" class="right floated"></div>
                                    </div>
                                    <div class="field">
                                        <label>Password</label>
                                        <input id="password" type="password" placeholder="password... " name="password" required>
                                    </div>
                                    <div class="field">
                                        <label>Re-Enter Password</label>
                                        <input id="re-password" type="password" placeholder="Re-Enter password" required>
                                        <div id="passdiv" class="right floated"></div>
                                    </div>
                                    <!--user types-->
                                    <div class="row">
                                        <div class="col-md-3">
                                            <div class="ui toggle checkbox">
                                                <input name="usertype" checked="checked" type="radio" value="1">
                                                <label>Admin</label>
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="ui toggle checkbox">
                                                <input id="rddoctor" name="usertype" type="radio" value="2">
                                                <label>Doctor</label>
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="ui toggle checkbox">
                                                <input name="usertype" checked="checked" type="radio" value="3">
                                                <label>Patient</label>
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="ui toggle checkbox">
                                                <input name="usertype" type="radio" value="5">
                                                <label>Nurse</label>
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="ui toggle checkbox">
                                                <input name="usertype" type="radio" value="6">
                                                <label>PRO</label>
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="ui toggle checkbox">
                                                <input name="usertype" type="radio" value="7">
                                                <label>Pharmacist</label>
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="ui toggle checkbox">
                                                <input name="usertype" type="radio" value="8">
                                                <label>Lab Assistant</label>
                                            </div>
                                        </div>
                                    </div>
                                    <div id="doctordiv" style="display: none;">
                                        <div class="field">
                                            <label>Specialization</label> 
                                            <div class="ui search selection dropdown">
                                                <input id="specialty" type="hidden" name="Specialization">
                                                <i class="dropdown icon"></i>
                                                <div class="default text">Click to add specialization</div>
                                                <div class="menu">
                                                    <c:forEach items="${specializations}" var="sp">
                                                        <div class="selected item" data-value="${sp.id}">${sp.specialization}</div>
                                                    </c:forEach>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="field">
                                            <label>Type</label> 
                                            <div class="ui search selection dropdown">
                                                <input id="specialty" type="hidden" name="doctortype">
                                                <i class="dropdown icon"></i>
                                                <div class="default text">Select Type</div>
                                                <div class="menu">
                                                    <div class="selected item" data-value="Permanent">Permanent</div>
                                                    <div class="selected item" data-value="Visiting">Visiting</div>
                                                    <div class="selected item" data-value="Trainee">Trainee</div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="field">
                                            <label>Qualifications</label>
                                            <input  type="text" placeholder="i.e. MBBS (united kigndom)" name="qualification[]">
                                        </div>
                                    </div>   
                                    <div id="addq" class="ui left labeled icon button" style="margin-bottom: 15px;margin-top: 15px;display: none;">
                                        <i class="add icon"></i>
                                        Add Another Qualification
                                    </div><br>
                                    <input type="submit" id="btnadduser" class="btn btn-info" value="Submit">
                                </div>
                            </form>
                        </div><!--add user ends-->

                        <!--view user-->
                        <div id="viewusediv">

                        </div><!--view user ends-->

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
        $('.ui.checkbox').checkbox();

    </script>
    <script>
        // When the document is ready
        $(document).ready(function() {
            $('.ui.dropdown').dropdown();
            $('#date').datepicker({
                format: "yyyy-mm-dd",
                //startDate: new Date(), //to disable past dates
                endDate: new Date() //to disable future dates
            });
            i = 0;
            $("#addq").click(function() {
                $("#doctordiv").append(" <div class='field'>"
                        + "<label>Qualifications</label>"
                        + "<input  type='text' placeholder='i.e. MBBS (united kigndom)' name='qualification[" + ++i + "]'>"
                        + "</div>");
            });
        });
        $("#signup").submit(function(event) {
            if (error !== 1) {
                return;
            }
            event.preventDefault();
        });
        $('input:radio').change(function() {
            if ($('#rddoctor').is(':checked')) {
                $("#doctordiv").css("display", "block");
                $("#addq").css("display", "block");
            } else {
                $("#doctordiv").css("display", "none");
                $("#addq").css("display", "none");
            }
        });
        if (${addsuccess == 1}) {
            toastr.success("User added successfully");
        }if(${addsuccess == 0}){
            toastr.error("Failed could not add user");
        }

</script>

</body>
</html>