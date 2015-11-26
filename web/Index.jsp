<jsp:include page="Header.jsp"></jsp:include>
<div class="contentbody" style="background-color: #F7F7F7">
    <jsp:include page="UserOption.jsp"></jsp:include>
    
    <div class="pusher">
        <div class="ui grid">
            <div class="two wide column">                
            </div>
            <div class="twelve wide column">  
                <head>              
                <script type="text/javascript">

                var slideimages = new Array(); 
                slideimages[0] = new Image(); 
                slideimages[0].src = "IMAGES/n1.jpg"; 
                slideimages[1] = new Image();
                slideimages[1].src = "IMAGES/n2.jpg";
                slideimages[2] = new Image();
                slideimages[2].src = "IMAGES/n3.jpg";
                slideimages[3] = new Image();
                slideimages[3].src = "IMAGES/n4.jpg";
                slideimages[4] = new Image();
                slideimages[4].src = "IMAGES/n5.jpg";

                </script>
                </head>
                <body>
                <img src="IMAGES/img1.jpg" id="slide" width="1000" height="400" />

                <script type="text/javascript">

                
                var step=0;

                function slideit(){
 
                if (!document.images)
                 return;
                document.getElementById('slide').src = slideimages[step].src;
                if (step<4)
                step++;
                else
                step=0;
 
                setTimeout("slideit()",2500);
}

                slideit();

                </script>

                
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