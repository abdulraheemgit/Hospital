<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<jsp:include page="DoctorHeader.jsp"></jsp:include>
    <div class="contentbody" style="background-color: #F7F7F7">
    <jsp:include page="DoctorOptions.jsp"></jsp:include>
        <div class="pusher">
            <div class="ui grid">
                <div class="two wide column">                
                </div>
                <div class="twelve wide column"> 

                    <div class="ui vertically divided grid">
                        <div class="row">
                            <div class="three wide column">
                                <a class="btn btn-info" href="/Hospital/MainBackEnd?action=addmedications"><i class="add icon"></i> Add Medication</a>
                            </div>
                            <div class="three wide column">
                                <button class="btn btn-info"><i class="search icon"></i> View Reports</button>
                            </div>
                            <div class="three wide column">
                                <a class="btn btn-info" href="/Hospital/MainBackEnd?action=addcomment"><i class="write icon"></i> Give Comments</a>
                            </div> 
                            <!--
                            <div class="three wide column">
                                <button class="btn btn-info"><i class="mail icon"></i> Give Health Tips</button> 
                            </div>
                            -->
                            <div class="three wide column">
                                <a class="btn btn-info" href="/Hospital/MainBackEnd?action=requestReport"><i class="lab icon"></i> Request Test Report</a> 
                            </div>
                        </div>
                    </div>


                    <h2>Medication History</h2>
                    <!-- history modal-->
                        <table class="ui celled table">
                            <thead>
                                <tr>
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