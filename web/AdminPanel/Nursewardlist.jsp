<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="NurseHeader.jsp"></jsp:include>
    <div class="contentbody" style="background-color: #F7F7F7">
    <jsp:include page="NurseUserOption.jsp"></jsp:include>
        <div class="pusher">
            <div class="ui grid">
                <div class="two wide column">                
                </div>
                <div class="welve wide column"> 


                    <table class="ui celled table">
                        <thead>
                            <tr>
                                <th class='center aligned'>Ward NO</th>
                                <th class='center aligned'>Status</th>
                                <th class='center aligned'>Patient ID</th>
                              
                              
                               
                            </tr>
                        </thead>
                        
                        <tbody>
                        <c:choose>
                            <c:when test="${empty wardlist}">
                            <tr>
                                <td class="center aligned"><h2>No wards Found</h2></td>
                            </tr>
                            </c:when>
                            <c:otherwise>
                                <c:forEach var="ward" items="${wardlist}">
                                    <tr id="${ward.wardid}">
                                        <td class="center aligned meddicationId"><c:out value="${ward.wardid}"/></td>
                                        <td class="center aligned patientId"><c:out value="${ward.status}"/></td>
                                        <td class="center aligned patientId"><c:out value="${ward.patientid}"/></td>
                                        
                                      
                                        <td class="center aligned">
                                            <div class="ui buttons">
                                                <div class="ui button"><i class="edit icon"></i></div>
                                                <div class="ui floating dropdown icon button">
                                                    <i class="dropdown icon"></i>
                                                    <div class="menu">
                                                        <input class="medicineid" style="display: none" value="${ward.wardid}">                                               
                                                            <div id="${ward.wardid}" class="item issuemodal"><i class="payment icon"></i> Available </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </c:otherwise>
                        </c:choose>
                        </tbody>
                   
                    </table>
        
                        <tfoot>
                            <tr>
                                <th colspan="6">
                                    <div class="ui right floated pagination menu">
                                        <a class="icon item">
                                            <i class="left chevron icon"></i>
                                        </a>
                                        <a class="item">1</a>
                                        <a class="item">2</a>
                                        
                                        <a class="icon item">
                                            <i class="right chevron icon"></i>
                                        </a>
                                    </div>
                                </th>
                            </tr>
                        </tfoot>
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
        
        


    <div class="actions">    
        <div class="ui positive left labeled icon deny button alldone">
            <i class="long arrow left icon"></i>
            Back

        </div>
    </div>
</div>


<jsp:include page="Footer.jsp"></jsp:include>

</body>
</html>