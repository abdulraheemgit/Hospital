<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="Header.jsp"></jsp:include>
    <div class="contentbody" style="background-color: #F7F7F7">
    <jsp:include page="UserOption.jsp"></jsp:include>
        <div class="pusher">
            <div class="ui grid">
                <div class="two wide column">                
                </div>
                <div class="twelve wide column">         
                ${user.username}
            </div>
            <div class="two wide column rightdiv">  
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
        $(document).ready(function() {
            if ( ${!empty error}) {
                toastr.error("${error}");
            }
        });
</script>
</body>
</html>