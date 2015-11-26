<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="DoctorHeader.jsp"></jsp:include>
    <div class="contentbody" style="background-color: #F7F7F7">
    <jsp:include page="DoctorOptions.jsp"></jsp:include>
        <div class="pusher">
            <div class="ui grid">
                <div class="two wide column">                
                </div>
                <div class="twelve wide column"> 


                    <form class="ui form" method="post" action="/Hospital/MainBackEnd?action=sendMessage">

                        <div class="field">

                            <div class="fields">
                                <div class="twelve wide field">

                                </div>
                                <div class="four wide field">

                                </div>
                            </div>
                        </div>
                        <div class="ui form" >
                            <div style="color: #009900;">${successMessage}</div>
                        <div class="field">
                            <label> Subject </label>
                            <input id="subject" class="form-control" type="text" name="subject" required="">
                        </div>
                        <div class="field">
                            <label> Comment </label>
                            <textarea id="message" name="message" required=""></textarea>
                        </div>

                        <button id="btncomment" class="ui right floated primary button"> Send Comment <i class="right chevron icon"></i></button>
                    </div>
                </form>

                <div class="ui relaxed divided items">
                    <div class="field">
                        <div class="fields">
                            <div class="twelve wide field">
                            </div>
                        </div>
                    </div>
                    <div class="item"></div>
                    <div id="comment">
                        <c:choose>
                            <c:when test="${empty commentlist}">
                                <div class="content">
                                    <div class="meta"></div>
                                    <div class="description">
                                        <h2>No Records Found</h2>
                                    </div>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <c:forEach items="${commentlist}" var="comment">
                                    <div class="ui relaxed divided items">
                                        <div class="item">
                                            <div class="content">
                                                <p> Subject : <strong> ${comment.subject}</strong> </p>
                                                <div class="meta">
                                                    <p> Send Date : ${comment.dateAndTime}</p>
                                                </div>
                                                <div class="description">
                                                    <p> Comment : ${comment.message}</p>
                                                </div>
                                            </div>
                                        </div>
                                        <hr>
                                    </div>
                                </c:forEach>
                            </c:otherwise>
                        </c:choose>
                    </div>
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
<!--
<script>
    subject = "";
    message = "";

    $("#btncomment").click(function () {
        subject = this.subject;
        message = this.message;
        subject = $("#subject").val();
        message = $("#message").val();
        $.post("MainBackEnd", {action: 'sendMessage', subject: subject, message: message}, function (responseJson) {
            if (responseJson != null || responseJson != "") {
                $("#comment").html("");
                $.each(responseJson, function (index, item) { // Iterate over the JSON array.
                    $("#comment").append("<div class='ui relaxed divided items'><div class='item'><div class='content'><p> Subject : <strong>' + ${comment.subject} + '</strong> </p><div class='meta'><p> Send Date :' + ${comment.dateAndTime} + '</p></div><div class='description'><p> Comment :' + ${comment.message} + '</p></div></div></div><hr></div>");
                });
                location.reload(true);
            }
        });

    });
</script>
-->
</body>
</html>