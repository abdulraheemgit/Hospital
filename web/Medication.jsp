<%-- 
    Document   : Medication
    Created on : Nov 19, 2015, 2:52:43 PM
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
                    <h2>Medication</h2>
                    <!-- history modal-->
                        <table class="ui celled table">
                            <thead>
                                <tr>
                                    <!--<th class="center aligned">Date</th>-->
                                    <th class="center aligned">Medicine</th>
                                    <th class="center aligned">dosage</th>
                                </tr></thead>
                            <tbody>
                            <c:choose>
                                <c:when test="${empty medicines}">
                                    <tr>
                                        <td class="center aligned"><h2>No Records Found</h2></td>
                                    </tr>
                                </c:when>
                                <c:otherwise>
                                    <c:forEach items="${medicines}" var="medicines">
                                            <td class="center aligned meddicinename">${medicines.medicine}</td>
                                            <td class="center aligned medicinevolume">${medicines.dosage}</td>
                                        </tr>
                                    </c:forEach>
                                </c:otherwise>
                            </c:choose>
                        </tbody>
                        <tfoot>
                            <tr><th colspan="3">
                        <div class="ui right floated pagination menu">
                            <a class="icon item">
                                <i class="left chevron icon"></i>
                            </a>
                            <a class="item">1</a>
                            <a class="item">2</a>
                            <a class="item">3</a>
                            <a class="item">4</a>
                            <a class="icon item">
                                <i class="right chevron icon"></i>
                            </a>
                        </div>
                        </th>
                        </tr></tfoot>
                    </table>
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


</body>
</html>