<jsp:include page="Header.jsp"></jsp:include>
<div class="contentbody" style="background-color: #F7F7F7">
    <jsp:include page="UserOption.jsp"></jsp:include>
    <div class="pusher">
        <div class="ui grid">
            <div class="two wide column">                
            </div>
            <div class="twelve wide column">         
                jnxs
            </div>
            <div class="two wide column">  
            <c:if test="${!empty user.username}">
                <div class="ui togglebar button black right floated">
                    <span class="glyphicon glyphicon-triangle-left" aria-hidden="true"></span>
                            <i class="tasks icon"></i>
                </div>
            </c:if>
            </div>
        </div>
    </div>
</div>
<jsp:include page="Footer.jsp"></jsp:include>

</body>
</html>