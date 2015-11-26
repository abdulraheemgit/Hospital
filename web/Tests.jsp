<%-- 
    Document   : Tests
    Created on : Nov 19, 2015, 9:11:04 PM
    Author     : Anobiya
--%>

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
                    <div class="ui styled fluid accordion">
                        <div class="active title">
                            <i class="dropdown icon"></i>
                                1. Full Blood Count
                        </div>
                        <div class="content">
                            <p>
                                <a href=#><button type="button" class="btn btn-info pull-right">View Report<span><i class="icon upload "></i></span></button></a>
                            </p>        
                        </div>
                        <div class="title">
                            <i class="dropdown icon"></i>
                            2. Chemical Pathology Test
                        </div>        
                        <div class="content">
                            <p>
                            <a href=#><button type="button" class="btn btn-info pull-right">View Report<span><i class="icon upload "></i></span></button></a>
                            </p>
                        </div>        
                    </div>
                    </div>
                    <div>
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