<jsp:include page="Header.jsp"></jsp:include>
    <div class="contentbody" style="background-color: #F7F7F7">
    <jsp:include page="UserOption.jsp"></jsp:include>
        <div class="pusher">
            <div class="ui grid">
                <div class="two wide column">                
                </div>
                <div class="twelve wide column">
                    <div class="row"  style="margin-top: 15px; margin-bottom: 10px;"> 
                        <div class="col-md-2"></div>
                        <div class="col-md-8 col-sm-12">
                        <!--Admin Dashboard-->
                        <c:if test="${user.typeId == '1'}">
                            <div>
                                <!--Edit Here-->
                            </div>
                        </c:if><!--end Admin Dashboard-->
                        
                        
                        <!--Doctor Dashboard-->
                        <c:if test="${user.typeId == '2'}">
                            <div>
                                <!--Edit Here-->
                            </div>
                        </c:if><!--end Doctor Dashboard-->
                        
                        
                        <!--Nurse Dashboard-->
                        <c:if test="${user.typeId == '5'}">
                            <div>
                                <!--Edit Here-->
                            </div>
                        </c:if><!--end Nurse Dashboard-->
                        
                        
                        <!--PRO Dashboard-->
                        <c:if test="${user.typeId == '6'}">
                            <div style="padding-top: 30px;">
                                <!--Edit Here-->
                                <div class="ui two column middle aligned very relaxed stackable grid">
                                    <div class="column">
                                        <a href="/Hospital/MainBackEnd?action=checkechnanneling">
                                            <h2 class="ui icon header">
                                              <i class="teal world icon"></i>
                                              <div class="content">
                                                Check E-Channeling
                                                <div class="sub header">Send conformation to pending requests</div>
                                                <h6 class="sub header" style="font-size: 50%;">12 pending requests</h6>
                                              </div>
                                            </h2>
                                        </a>
                                    </div>
                                    <div class="ui vertical divider">
                                      Or
                                    </div>
                                    <div class="center aligned column">
                                        <h2 class="ui center aligned icon header">
                                            <i class="teal add user icon"></i>
                                            Add Patient
                                        </h2>
                                        <div class="ui big default labeled button">
                                            <a href="/Hospital/MainBackEnd?action=users">
                                                <i class="teal angle double right icon"></i>
                                                <i class="teal angle double right icon"></i>
                                                <i class="teal angle double right icon"></i>
                                            </a>
                                        </div>
                                    </div>
                                  </div>
                            </div>
                        </c:if><!--end PRO Dashboard-->
                        
                        
                        <!--Pharmacist Dashboard-->
                        <c:if test="${user.typeId == '7'}">
                            <div>
                                <!--Edit Here-->
                            </div>
                        </c:if><!--end Pharmacist Dashboard-->
                        
                        
                        <!--Lab Assistant Dashboard-->
                        <c:if test="${user.typeId == '8'}">
                            <div>
                                <!--Edit Here-->
                            </div>
                        </c:if><!--end Lab Assistant Dashboard-->
                        </div>
                        <div class="col-md-2"></div>
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