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
                        
                        <h2 style="padding-left: 70px;font-size: 250%;">My Profile</h2>
                        <div class="col-md-2"></div>
                        <div class="col-md-8 col-sm-12">
                            <table class="ui celled table">
                                <tbody>
                                    
                                    <tr>
                                        <td><p class="ui ribbon label">User Id</p></td>
                                        <td class="center aligned">${user.userID}</td>
                                    </tr>
                                    <tr>
                                        <td><p class="ui ribbon label">User Name</p></td>
                                        <td class="center aligned">${user.username}</td>
                                    </tr>
                                    <tr>
                                        <td><p class="ui ribbon label">E-Mail</p></td>
                                        <td class="center aligned">${user.email}</td>
                                    </tr>
                                    <tr>
                                        <td><p class="ui ribbon label">Joined Date</p></td>
                                        <td class="center aligned">${user.signUpDate}</td>
                                    </tr>
                                    <tr>
                                        <td><p class="ui ribbon label">First Name</p></td>
                                        <td class="center aligned">${user.fName}</td>
                                    </tr>
                                    <tr>
                                        <td><p class="ui ribbon label">Last Name</p></td>
                                        <td class="center aligned">${user.lName}</td>
                                    </tr>
                                    <tr>
                                        <td><p class="ui ribbon label">NIC</p></td>
                                        <td class="center aligned">${user.nic}</td>
                                    </tr>
                                    <tr>
                                        <td><p class="ui ribbon label">Gender</p></td>
                                        <td class="center aligned">${user.gender}</td>
                                    </tr>
                                    <tr>
                                        <td><p class="ui ribbon label">Address</p></td>
                                        <td class="center aligned">${user.address1} ${user.address2} ${user.address3}</td>
                                    </tr>
                                    <tr>
                                        <td><p class="ui ribbon label">Contact No</p></td>
                                        <td class="center aligned">
                                        <c:forEach items="${user.contacts}" var="contact">
                                            ${contact.contactNo}  &nbsp
                                        </c:forEach>
                                        </td>
                                    </tr>
                            </tbody>
                        </table>
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


</body>
</html>