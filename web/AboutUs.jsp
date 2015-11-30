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
                        <br>
                        <p>You are visiting the web site of HolyCross hospital leading tertiary medical 
                            center with qualified medical staff, supported by over 100 
                            extraordinary nurses and staff members.The history of Holy Cross Health Center is long and illustrious.  
                            Founded in 1983 November 17<sup>th</sup>by the sisters of holy family under the guidance of <b>Rev.Sis Edmenta</b><p>
                            <br><br>
                        <div class="six wide column">
                            <h1><font color="blue"><b>VISION</b></font></h1>
                            <img src="IMAGES/vision.png" height="175" width="200">
                            <b>"By our selfless service we provide the best possible care for all..."</b>
                        </div>
                        <div class="six wide column">
                            <h1><font color="blue"><b>MISSION</b></font></h1>
                            <img src="IMAGES/mission.jpg" height="175" width="200">
                            <b>"We are christ centered community of professional health carers providing holistic healing..."</b>
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


</body>
</html>
