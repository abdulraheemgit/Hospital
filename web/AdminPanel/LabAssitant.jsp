<jsp:include page="PharmacistsHeader.jsp"></jsp:include>
    <div class="contentbody" style="background-color: #F7F7F7">
    <jsp:include page="PharmacistsUserOption.jsp"></jsp:include>
        <div class="pusher">
            <div class="ui grid">
                <div class="two wide column">                
                </div>
                <div class="twelve wide column"> 


                    <form class="ui form" method="post" action="/Hospital/MainBackEnd?action=searchpatient">
                        
                        <div class="field">
                            
                            <div class="fields">
                                <div class="twelve wide field">
                                    
                                </div>
                                <div class="four wide field">
                                    
                                </div>
                            </div>
                        </div>
                        
                        <div class="field">
                            
                        </div>
                        <div class="fields">
                            <div class="seven wide field">
                                <label>Enter Patient Id</label>
                                <div style="color: #FF0000;">${errorMessage}</div>
                                <input type="text" name="patientId" maxlength="16" placeholder="Patient Id">
                            </div>
                            <div class="three wide field">
                                
                            </div>
                            <div class="six wide field">
                                
                            </div>
                        </div>
                       
                        <button class="btn btn-info" name="searchbtn">Search</button>
                    </form>


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