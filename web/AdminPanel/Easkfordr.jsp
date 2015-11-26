<%-- 
    Document   : E_channel_askfordr
    Created on : Sep 17, 2015, 10:57:50 PM
    Author     : User
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
                        
                        <div class="col-sm-12 col-md-7" >
                           <h2>Make Appointment Here</h2>
                            <form method="post" action="Easkfrdr" class="ui form">
                                <div class="ui form" >
                                    <div class="ui form">
                                        
                                         <div class="field">
                                             <h3>Doctor Name</h3>
                                           <input type="text" class="form-control" id="lastname" name="lastname">
                                        </div>
                                        <div class="field">
                                            <h3>Special in</h3>
                                            <select name="DoctorType">
                                                <option value="Any">Any</option>
                                                <option value="Audiologist">Audiologist</option>
                                                <option value="Cardiologist">Cardiologist</option>
                                                <option value="Dentist">Dentist</option>
                                                <option value="Dermatologist">Dermatologist</option>
                                                <option value="Immunologist">Immunologist</option>
                                                <option value="Neurosurgeon">Neurosurgeon</option>
                                                <option value="ENTSpecialist">ENT Specialist</option>
                                                <option value="Physiologist">Physiologist</option>
                                                <option value="Radiologist">Radiologist</option>
                                                <option value="Surgeon">Surgeon</option>
                                            </select>
                                        </div>
                                        <div class="field">
                                            <h3>Date</h3>
                                           <input type="date" class="form-control" name="date" id="Date" placeholder="mm/dd/yy">
                                        </div>
                                  
                                    </div>

                                    <button id="btnmedicine" class="btn btn-info">Confirm</button>
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