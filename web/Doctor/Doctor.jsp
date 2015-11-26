<jsp:include page="DoctorHeader.jsp"></jsp:include>
    <div class="contentbody" style="background-color: #F7F7F7">
    <jsp:include page="DoctorOptions.jsp"></jsp:include>
        <div class="pusher">
            <div class="ui grid">
                <div class="two wide column">                
                </div>
                <div class="twelve wide column"> 

                    <div class="row">
                        <div class="col-md-2"></div>
                        <div class="col-md-8 col-sm-12">
                            <form style="margin-top:  100px;" class="ui form" method="post" action="/Hospital/MainBackEnd?action=searchpatientbyDoctor">
                                <label>Enter Patient Id</label>
                                <div style="color: #FF0000;">${errorMessage}</div>

                            <div class="input-group">
                                <input style="height: 50px;" type="text" name="patientId" class="form-control" placeholder="Enter patient ID" aria-describedby="basic-addon2">
                                <span style="height: 50px;" class="input-group-btn" id="basic-addon2" name="searchbtn"><button style="height: 50px;" class="btn btn-primary">Search</button></span>
                            </div>
                            
                            
                        </form>
                    </div>
                    <div class="col-md-2"></div>
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