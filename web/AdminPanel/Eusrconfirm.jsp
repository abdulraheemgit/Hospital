<jsp:include page="Header.jsp"></jsp:include>
    <div class="contentbody" style="background-color: #F7F7F7">
    <jsp:include page="UserOption.jsp"></jsp:include>
        <div class="pusher">
            <div class="ui grid">
                <div class="two wide column">                
                </div>
                <div class="twelve wide column">         
                    <div class="row"  style="margin-top: 15px; margin-bottom: 10px;">
                        
                        <div class="col-sm-12 col-md-7" >
                           <h2>Submit Your Details</h2>
                            <form method="post" action="Dlist" class="ui form">
                                <div class="ui form" >
                                    <div class="ui form">
                                        
                                         <div class="field">
                                             <h3>Name</h3>
                                           <input type="text" class="form-control" id="lastname" >
                                        </div>
                                         <div class="field">
                                             <h3>Gender</h3>
                                          <input type="radio" name="sex" value="male" id="male">Male<br>
                                          <input type="radio" name="sex" value="female" id="female">Female
                                        </div>
                                         <div class="field">
                                             <h3>National ID</h3>
                                           <input type="text" class="form-control" id="Nid" >
                                        </div>
                                        <div class="field">
                                             <h3>E_Mail</h3>
                                           <input type="text" class="form-control" id="email" >
                                        </div>
                                         <div class="field">
                                             <h3>City</h3>
                                           <input type="text" class="form-control" id="City" >
                                        </div>
                                  
                                    </div>

                                    <button id="btnmedicine" class="btn btn-info">Submit</button>
                                </div>
                            </form>

                            <br>
                            <div class="alert alert-success" role="alert" style="display: none;">
                                <a href="#" class="alert-link">Well done! You have successfully added a medicine</a>
                            </div>
                            <div class="alert alert-danger" role="alert" style="display: none;">
                                <a href="#" class="alert-link">The medicine was not Added. Try again</a>
                            </div>
                        </div>
                    </div>
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