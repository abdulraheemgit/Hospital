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

                        <div class="row">
                            <div class="col-md-2"></div>
                            <div class="col-md-8 col-sm-12" style="margin-bottom: 25px;">
                                <div style="padding-top: 20px;padding-right: 50px;">
                                    <h2><div class="ui header">Channel Description</div></h2>
                                    <div class="row" style="padding-top: 20px; padding-bottom: 20px;">
                                        <div class="col-md-6" style="text-align: right;">
                                            <p>Doctor Name :</p>
                                            <p>Specialization :</p>
                                            <p>Date :</p>
                                            <p>Session Time :</p>
                                            <p>Appointment No :</p>
                                            <p>Doctor Note :</p>
                                        </div>
                                        <div class="col-md-6">
                                            <p>DR. ${doctor.fName} ${doctor.lName}</p>
                                        <p>${doctor.specialization}</p>
                                        <p>${channeldetails.date}</p>
                                        <p>${channeldetails.nextSession}</p>
                                        <p>${channeldetails.appointments}</p>
                                        <p>${doctor.doctorNote}</p>
                                    </div>
                                </div>
                            </div>
                            <div class="ui form">
                                <div class="field">
                                    <label>Patient's First Name*</label>
                                    <input id="fname" type="text" placeholder="i.e. Steve" name="fname"><br>
                                    <div id="fnamediv" class="right floated"></div>
                                </div>
                                <div class="field">
                                    <label>Patient's Last Name</label>
                                    <input id="lname" type="text" placeholder="i.e. jobs" name="lname"><br>
                                    <div id="lnamediv" class="right floated"></div>
                                </div>
                                <div class="field">
                                    <label>National Identification Card (NIC)</label>
                                    <input id="nic" type="text" placeholder="i.e. 930003939V" name="nic"><br>
                                    <div id="nicdiv" class="right floated"></div>
                                </div>
                                <div class="field">
                                    <label>Contact No*</label>
                                    <input id="contact" type="text" placeholder="i.e. 0771234567" name="contact"><br>
                                    <div id="contactdiv" class="right floated"></div>
                                </div>
                                <div class="field">
                                    <label>E-Mail*</label>
                                    <input id="email1" type="text" placeholder="i.e. stevejobs@gmail.com" name="email"><br>
                                    <div id="emaidiv" class="right floated"></div>
                                </div>
                                <div class="field">
                                    <label>Special Notes</label>
                                    <textarea id="spnotes" type="email" placeholder="i.e. " name="spnotes"></textarea><br>
                                    <div id="spdiv" class="right floated"></div>
                                </div>
                                <p style="font-size: 65%">* Required</p>
                                <div class="field" style="margin-top: 30px;">
                                    <input type="hidden" name="action" value="login" /> 
                                    <input id="btnappointment" class="form-control btn btn-info" type="submit" name="btnappointment" value="Make Appointment" />
                                </div>
                                <div id="altsuccess" style="display: none" class="alert alert-success alert-dismissible" role="alert">
                                    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                    <strong>Thank You</strong><p> Appointment was placed successfully</p><p> confirmation will sent in a while</p>
                                </div>
                                <div id="altfailed" style="display: none" class="alert alert-danger alert-dismissible" role="alert">
                                    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                    <strong>Sorry</strong> Appointment was not placed successfully
                                </div>
                            </div>
                        </div>
                        <div class="col-md-2"></div>
                    </div>

                </div>
                <div>
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
    $("#btnappointment").click(function (){
       fname = $("#fname").val(); 
       lname = $("#lname").val(); 
       nic = $("#nic").val(); 
       contact = $("#contact").val(); 
       email = $("#email1").val(); 
       notes = $("#spnotes").val(); 
       err = 0;
       
       if(fname == '' || nic == '' || contact == '' || email == ''){
           toastr.warning("please fill in the details");           
       }else if(!isEmail(email)){
           toastr.warning("Invalid e-mail");   
       }else if(!isnumber(contact)){
            toastr.warning("contact number must be numeric");
       }else{
           console.log("fine");
           $.post('Main',{action: 'channel', doctorid: '${doctor.doctorId}',date:'${channeldetails.date}',time:'${channeldetails.nextSession}',fname:fname,lname:lname,nic:nic,contact:contact,email:email,notes:notes},function(z){
               console.log(z);
               if(z=='1'){
                   $("#altsuccess").css("display", "block");
                }else{
                    $("#altfailed").css("display", "block");
                }
           });
       }
       console.log(fname+lname+nic);
       console.log(contact+email+notes);
    });
</script>

</body>
</html>