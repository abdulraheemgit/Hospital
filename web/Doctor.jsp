<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                    <div class="col-md-2"></div>
                    <div class="col-md-8 col-sm-12" style="box-shadow: 3px 3px 15px 4px #FFFFFF;">
                        <input id="doctorid" type="hidden" value="${doctor.doctorId}">
                        <a class="ui blue ribbon label" style="margin-top: 20px"><p style="font-size: 140%">DR. ${doctor.fName} ${doctor.lName}</p></a>
                        <div>
                            <div class="ui items">
                                <div class="item">
                                    <div class="image">
                                        <img src="IMAGES/doc.jpg">
                                    </div>
                                    <div class="content">
                                        <a class="header">${doctor.specialization}</a>
                                        <div class="meta">
                                            <span>Holy Cross Health Center</span>
                                        </div>
                                        <div class="description">
                                            <p>${doctor.specialDesc}</p>
                                        </div>
                                        <div class="extra">
                                            ${doctor.doctorNote}
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div style="padding-top: 20px;">
                            <div id="sessioncheck" style="display: none; padding:50px;">
                                <div class="ui buttons right floated">
                                    <button class="ui button btnlogin">Sign In</button>
                                    <div class="or"></div>
                                    <button class="ui positive button btnsignup">Sign Up</button>
                                </div>
                                You must be logged in to make appointments
                            </div>
                            <table class="ui very basic table">
                                <thead>
                                    <tr>
                                        <th class="tblfonts">Date</th>
                                        <th class="tblfonts">Day</th>
                                        <th class="tblfonts">Status</th>
                                        <th class="tblfonts">Time (24hrs)</th>
                                        <th class="tblfonts">Next Available Session</th>
                                        <th class="tblfonts">Make An Appointment</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:if test="${empty sessions}">
                                        <tr><h3>No Session Available</h3></tr>
                                    </c:if>
                                    <c:forEach items="${sessions}" var="session">
                                        <tr id="${session.doctorId}">
                                            <td>${session.date}</td>
                                            <td>${session.day}<input id="dayid" type="hidden" value="${session.dayId}"</td>
                                            <td>${session.status}</td>
                                            <td>${session.timeFrom} - ${session.timeTo}</td>
                                            <td>${session.nextSession}</td>
                                            <td>
<!--                                                <a href="/Hospital/Main?action=appointment&doctorid=${doctor.doctorId}&date=${session.date}">-->
                                                <a class="">
                                                    <div id="${session.date}" class="ui right floated basic button btnappointment" style="font-size: 75%;">
                                                        Make Appointment
                                                        <i class="right angle double icon"></i>
                                                    </div>
                                                </a>
                                                <!--</a>-->
                                                <input id="${session.doctorId}" type="hidden" value="${session.doctorId}>"
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
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
<style>
    .tblfonts{
        font-size: 85%;
        font-style: italic;
        font-weight: lighter;
    }
</style>
<script>
    $(document).ready(function (){
        $(".button.btnappointment").click(function (){
            if(${empty user.username}){
//                alert(this.ids);
                $("#sessioncheck").css("display","block");
                $("#signinmodal").find("#edoctorid").attr("value","${doctor.doctorId}");
                $("#signinmodal").find("#edate").attr("value",this.id);
//                $("#signinmodal").append("<input name='doctorid' type='hidden' value="+this.id);
                $("#signinmodal").attr("action", "/Hospital/Main?action=elogin");
                $("#signupmodal").attr("action", "/Hospital/Main?action=esignup");
                
                
            }else{
                url = "/Hospital/Main?action=appointment&doctorid=${doctor.doctorId}&date="+this.id;
                window.location.assign(url);
            }
    
            
        });
        $('.btnlogin').click(function() {
            $('.login').modal('show');
        });
        
        $('.btnsignup').click(function() {
            $('.signitup').modal('show');
        });
    });

</script>

</body>
</html>