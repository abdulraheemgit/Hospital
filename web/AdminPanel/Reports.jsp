<jsp:include page="Header.jsp"></jsp:include>
    <div class="contentbody" style="background-color: #F7F7F7">
    <jsp:include page="UserOption.jsp"></jsp:include>
        <div class="pusher">
            <div class="ui grid">
                <div class="two wide column">                
                </div>
                <div class="twelve wide column">    
                    <div class="row">
                        <div class="col-sm-12 col-md-6">
                            <div class="ui form" >
                                <div class="field" style="margin-top: 25px;">
                                    <label>Enter patient ID</label>
                                    <div class="input-group">
                                        <input type="text" class="form-control" placeholder="Patient ID or NIC...">
                                        <span class="input-group-btn">
                                            <button class="btn btn-info" type="button">Search</button>
                                        </span>
                                    </div><!-- /input-group -->
                                    <div class="ui pointing label med" style="display: none;">
                                        <font color="#FF2E2E">Please enter medicine name</font>
                                    </div>
                                </div>
                                <div>

                                </div>
                            </div>
                            <div class="ui items">
                                <div class="item">
                                    <div class="content">
                                        <a class="header">Anobia Alstan [10515000]</a>
                                        <div class="meta">
                                            <span>anobiaalstan@gmail.com</span>
                                        </div>
                                        <div class="extra">
                                            0771234567
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="ui styled fluid accordion">
                                <div class="active title">
                                    <i class="dropdown icon"></i>
                                    Test 01
                                </div>
                                <div class="active content">
                                    <div class="row">
                                        <div class="col-md-6">
                                            Date Given: 12-sep-2015
                                        </div>
                                        <div class="col-md-6">
                                            <p>
                                                <button type="button" class="btn btn-info pull-right">Upload Report <span><i class="icon upload "></i></span></button>
                                            </p>
                                        </div>
                                    </div>

                                </div>
                                <div class="title">
                                    <i class="dropdown icon"></i>
                                    Test 02
                                </div>
                                <div class="content">
                                    <p>
                                        <button type="button" class="btn btn-info pull-right">Upload Report <span><i class="icon upload "></i></span></button>
                                    </p>
                                </div>
                                <div class="title">
                                    <i class="dropdown icon"></i>
                                    Test 03
                                </div>
                                <div class="content">

                                    <button type="button" class="btn btn-info pull-right">Upload Report <span><i class="icon upload "></i></span></button>
                                    <p></p>
                                </div>
                            </div>

                        </div>

                        <div class="col-sm-12 col-md-6">
                            <img src="IMAGES/lab2.png" style="width: 450px;">
                        </div>

                    </div>
                    <div class="row" style="margin-top: 25px;">
                        <div class="col-md-2"></div>
                        <div class="col-sm-12 col-md-8">
                            <div class="ui relaxed divided list">
                                <div class="item">
                                    <i class="large folder open outline middle aligned icon"></i>
                                    <div class="content">
                                        <a class="header">Blood Test </a>
                                        <div class="extra">Updated 10 mins ago</div>
                                    </div>
                                </div>
                                <div class="item">
                                    <i class="large folder open outline middle aligned icon"></i>
                                    <div class="content">
                                        <a class="header">Urine test</a>
                                        <div class="meta">Updated 10 mins ago</div>
                                    </div>
                                </div>
                            </div>
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
<script>
    $('.ui.accordion').accordion();
</script>
</body>
</html>