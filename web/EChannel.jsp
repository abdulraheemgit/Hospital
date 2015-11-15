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
                    <c:if test="${empty doctors}">
                        <div class="col-md-3">

                        </div>
                        <div class="col-md-6 col-sm-12">
                        </c:if>

                        <form method="post" action="/Hospital/Main?action=searchdoctors" class="ui form">
                            <div class="ui header center aligned a">Search Doctor</div>
                            <div class="ui divider"></div>
                            <c:if test="${!empty doctors}">
                                <div class="col-md-6 col-sm-12">
                                </c:if>
                                <div class="field">
                                    <c:if test="${!empty doctor}">
                                        <label>Doctor Name</label> <input id="doctor" type="text" name="doctor" value="${doctor}"/>
                                    </c:if>
                                    <c:if test="${empty doctor}">
                                        <label>Doctor Name</label> <input id="doctor" type="text" name="doctor" placeholder="i.e. 'Perera'" />
                                    </c:if>

                                </div>
                                <div class="field">
                                    <label>Specialty or Description</label> 
                                    <div class="ui search selection dropdown">
                                        <input id="specialty" type="hidden" name="specialty">
                                        <i class="dropdown icon"></i>
                                        <div class="default text">i.e. 'Dermatologist' or 'Skin related..'</div>
                                        <div class="menu">
                                            <c:forEach items="${specializations}" var="sp">
                                                <div class="selected item" data-value="${sp.id}">${sp.specialization}</div>
                                            </c:forEach>
                                        </div>
                                    </div>
                                </div>
                                <c:if test="${!empty doctors}">
                                </div>
                                <div class="col-md-6 col-sm-12">
                                </c:if>
                                <div class="ui accordion">
                                    <div class="title">
                                        <i class="dropdown icon"></i>
                                        <font style="text-decoration: underline">Advance Search</font>
                                    </div>
                                    <div class="content">
                                        <div class="ui buttons">
                                            <div id="btndate" class="ui button active">Date</div>
                                            <div class="or"></div>
                                            <div id="btnday" class="ui button teal">Day</div>
                                        </div>
                                        <div class="field">
                                            <label></label>
                                            <input id="date" type="text" name="daydate" placeholder="Click to add date"/>
                                            <div class="ui search selection dropdown day" style="display: none;">
                                                <input type="hidden" name="daydate">
                                                <i class="dropdown icon"></i>
                                                <div class="default text">i.e. Friday</div>
                                                <div class="menu">
                                                    <div class="item" data-value="1">Monday</div>
                                                    <div class="item" data-value="2">Tuesday</div>
                                                    <div class="item" data-value="3">Wednesday</div>
                                                    <div class="item" data-value="4">Thursday</div>
                                                    <div class="item" data-value="5">Friday</div>
                                                    <div class="item" data-value="6">Saturday</div>
                                                    <div class="item" data-value="7">Sunday</div>
                                                </div>
                                            </div>
                                        </div><br>
                                        <div class="field">
                                            <label>Time</label>
                                            <div class="ui selection dropdown">
                                                <input type="hidden" name="time">
                                                <i class="dropdown icon"></i>
                                                <div class="default text">Select time</div>
                                                <div class="menu">
                                                    <c:forEach items="${times}" var="time">
                                                        <div class="item" data-value="${time.timeId}">${time.time}</div>
                                                    </c:forEach>
                                                </div>
                                            </div>
                                        </div>
                                    </div>  
                                </div>

                                <div class="field" style="margin-top: 30px;">
                                    <input type="hidden" name="action" value="login" /> 
                                    <input id="search" class="form-control btn btn-info" type="submit" name="btnsubmit" value="Search" />
                                </div>
                            </div>
                        </form>
                        <c:if test="${empty doctors}">
                            <div class="col-md-3">
                            </div>
                        </c:if>
                    </div>
                    <!--search results for doctors-->
                    <div class="row" style="margin-top: 20px;">

                        <div class="col-md-2"></div>
                        <div class="col-md-8 col-sm-12" id="resultdiv">
                            <p id="searchresults" style="font-size: 150%;">${results}</p>
                            <h2>${norecords}</h2>
                            <div class="ui divided items">
                                <c:forEach items="${doctors}" var="doctor">
                                    <div class="item">
                                        <div class="image">
                                            <i class="massive inverted treatment icon"></i>
                                        </div>
                                        <div class="content">
                                            <a class="header">${doctor.fName} ${doctor.lName}</a>
                                            <div class="meta">
                                                <span class="cinema"><font style="text-decoration-style: italic;">${doctor.specialization}</font></span>
                                            </div>
                                            <div class="description">
                                                <p>${doctor.specialDesc}</p>
                                            </div>
                                            <div class="extra">
                                                <div class="ui right floated basic button">
                                                    View More
                                                    <i class="right chevron icon"></i>
                                                </div>
                                                <div style="padding-top: 10px;"><i class="h icon"></i>HolyCross Hospital</div>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>

                            </div>  

                        </div>
                        <div class="col-md-2"></div>
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
            count = 0;
            $('.ui.dropdown').dropdown();
            $('.ui.accordion').accordion();
            $("#search").click(function() {
                doctor = $("doctor").val();
                special = $("input.search").val();
                ddate = $("input.search").val();
                time = $("input.search").val();

                if (special !== "" && special !== null) {
                    $("input#specialty").val(special);
                }
                $("#searchresults").css("display", "block");
                count++;
                console.log($("input#specialty").val());
            });
            $("#btnday").click(function() {
                $("#date").css("display", "none");
                $(".day").css("display", "block");
            });
            $("#btndate").click(function() {
                $("#date").css("display", "block");
                $(".day").css("display", "none");
            });
    </script>
    <script>
        // When the document is ready
        $(document).ready(function() {

            $('#date').datepicker({
                format: "yyyy-mm-dd",
                startDate: new Date(), //to disable past dates
                //endDate: '2015-11-28' //to disable future dates
            });
        });
    </script>
</body>
</html>
