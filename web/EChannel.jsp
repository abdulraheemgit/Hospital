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
                                    <label>Doctor Name</label> <input type="text" name="doctor" placeholder="i.e. 'Perera'" />
                                </div>
                                <div class="field">
                                    <label>Specialty or Description</label> 
                                    <div class="ui search selection dropdown">
                                        <input id="specialty" type="hidden" name="specialty">
                                        <i class="dropdown icon"></i>
                                        <div class="default text">i.e. 'Dermologist' or 'Skin related..'</div>
                                        <div class="menu">
                                            <div class="item" data-value="1">Male</div>
                                            <div class="item" data-value="2">Female</div>
                                        </div>
                                    </div>
                                </div>
                                <c:if test="${!empty doctors}">
                                </div>
                                <div class="col-md-6 col-sm-12">
                                </c:if>
                                <div class="field">
                                    <label>Date or Day</label> <input type="text" name="daydate" placeholder="i.e. '25-12-2015' or 'Friday'"/>
                                </div>
                                <div class="field">
                                    <label>Time</label>
                                    <div class="ui selection dropdown">
                                        <input type="hidden" name="time">
                                        <i class="dropdown icon"></i>
                                        <div class="default text">Any</div>
                                        <div class="menu">
                                            <div class="item" data-value="1">Male</div>
                                            <div class="item" data-value="0">Female</div>
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
        $('.ui.dropdown')
                .dropdown()
                ;
        $("#search").click(function() {
            special = $("input.search").val();
            if(special !== "" && special !== null){
                $("input#specialty").val(special);
//                alert(special);
//                console.log(special);
            }
            console.log($("input#specialty").val());
        });

    </script>

</body>
</html>
