<%@page import="java.sql.ResultSet"%>
<%@page import="Model.Users"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="Header.jsp"></jsp:include>
    <div class="contentbody" style="background-color: #F7F7F7">
    <jsp:include page="UserOption.jsp"></jsp:include>
        <div class="pusher">
            <div class="ui grid">
                <div class="two wide column">                
                </div>
                <div class="twelve wide column">
                    <div class="row"  style="margin-top: 25px; margin-bottom: 10px;"> 
                        <div class="col-xs-6 col-sm-4 col-md-3">
                           
                            <div class="adduser">
                                <div class="ui segment">
                                    <div class="ui items" >
                                        <div class="item">
                                            <div class="ui tiny image">
                                                <img class="addicon" src="IMAGES/adduser.png" style="width: 70%;">
                                            </div>
                                            <div class="middle aligned content">
                                                <p class="header"><a button name="funcUser" value =2 id="addUser">Add User</a></p>
                                            </div>
                                        </div>   
                                    </div>
                                </div>
                            </div>
                             <div class="adduser">
                                <div class="ui segment">
                                    <div class="ui items" >
                                        <div class="item">
                                            <div class="ui tiny image">
                                                <img src="IMAGES/view.jpg" style="width: 70%;">
                                            </div>
                                            <div class="middle aligned content">
                                                <p class="header"><a button name="funcUser" value =1 id="viewUser">View Users</a></p>
                                            </div>
                                        </div>   
                                    </div>
                                </div>
                            </div>
                            <div class="adduser">
                                <div class="ui segment">
                                    <div class="ui items" >
                                        <div class="item">
                                            <div class="ui tiny image">
                                                <img src="IMAGES/update.jpg" style="width: 70%;">
                                            </div>
                                            <div class="middle aligned content">
                                                <p class="header"><a button name="funcUser" id="editUser">Edit User</a></p>
                                            </div>
                                        </div>   
                                    </div>
                                </div>
                            </div>
                            <div class="adduser">
                                <div class="ui segment">
                                    <div class="ui items" >
                                        <div class="item">
                                            <div class="ui tiny image">
                                                <img src="IMAGES/delete.jpg" style="width: 70%;">
                                            </div>
                                            <div class="middle aligned content">
                                                <p class="header"><a button name="funcUser" id="removeUser">Remove User</a></p>
                                            </div>
                                        </div>   
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- right side-->
                      <div class="col-sm-12 col-md-9">
                          <div class="row" >
                          
                        </div>
                          <!--view User-->
                          <form method="post" name="viewUserForm" id="viewUserForm" action="/Hospital/MainBackEnd?action=viewUser">
                               <div style="margin-top: 40px;">
                            <div style="color:#0CC7BF"><h1>${errorview}</h1></div>
                        
                            <div style="margin-bottom: 20px;">
                                
                                <h3 style="margin-bottom: -25px;">View User</h3>
                                <div class="ui section divider"></div>
                            </div>
                            <div class="ui form">
                                <div class="field">
                                    <label>User ID or NIC</label>
                                    <div style="color: #FF0000;">${errorview}</div>
                                      <input name="userId" id="userId" placeholder="i.e. " type="text">
                                      
                                </div>
                                      
                            </div>
                          </div>
                                      <br>
                                <button id="btnviewuser" class="btn btn-info">View</button>
                            <h2> All Users </h2>
                            
                            <%Users user=new Users();
                            ResultSet rs=user.getAllUsers();
                            %>
                            <table class="ui celled table">
                            <thead>
                                <tr><th>User ID</th>
                                    <th>Name</th>
                                    <th>User Name</th>
                                    <th>Email</th>
                                    <th>User Type</th>
                                    <th>Action </th>
                                </tr></thead>
                            <tbody>
                            <% while(rs.next()){ %>
                            <TR>
                                <TD> <%= rs.getString(1) %></TD>
                                <TD> <%= rs.getString(2) %> <%= rs.getString(3) %></TD>
                                <TD> <%= rs.getString(4) %></TD>
                                <TD> <%= rs.getString(5) %></TD>
                                <TD> <%= rs.getString(6) %></TD>
                                <TD>
                                 <div class="ui buttons">
                                                    <div class="ui button">view</div>
                                                  
                                
                                </TD>
               
                                </TR>
                                <% } %>
                       
                        </tbody>
                        <tfoot>
                            <tr><th colspan="4">
                        <div class="ui right floated pagination menu">
                            <a class="icon item">
                                <i class="left chevron icon"></i>
                            </a>
                            <a class="item">1</a>
                            <a class="item">2</a>
                            <a class="item">3</a>
                            <a class="item">4</a>
                            <a class="icon item">
                                <i class="right chevron icon"></i>
                            </a>
                        </div>
                        </th>
                        </tr></tfoot>
                    </table>
                                
                   
                              
                          </form>
                           <!--edit User-->
                           <form method="post" name="editUserForm" id="editUserForm" style="display: none">
                               <div style="margin-top: 40px;">
                            <div style="color:#0CC7BF"><h1>${errorEdit}</h1></div>
                        
                            <div style="margin-bottom: 20px;">
                                
                                <h3 style="margin-bottom: -25px;">Edit User</h3>
                                <div class="ui section divider"></div>
                            </div>
                            <div class="ui form">
                                <div class="field">
                                    <label>User ID or NIC</label>
                                    <div style="color: #FF0000;">${erroredit}</div>
                                      <input name="userId" id="userId" placeholder="i.e. " type="text">
                                </div>
                                      
                            </div>
                          </div>
                                      <br>
                                <button id="btnviewuser" class="btn btn-info">Edit</button>
                              
                          </form>
                                       <!--remove User-->
                                       <form method="post" name="removeUserForm" id="removeUserForm" action="/Hospital/MainBackEnd?action=removeUser"  style="display: none">
                               <div style="margin-top: 40px;">
                            <div style="color:#0CC7BF"><h1>${errorRemove}</h1></div>
                        
                            <div style="margin-bottom: 20px;">
                                
                                <h3 style="margin-bottom: -25px;">Remove User</h3>
                                <div class="ui section divider"></div>
                            </div>
                            <div class="ui form">
                                <div class="field">
                                    <label>User ID or NIC</label>
                                    <div style="color: #FF0000;">${errorRem}</div>
                                      <input name="userId" id="userId" placeholder="i.e. " type="text">
                                </div>
                                      
                            </div>
                          </div>
                                      <br>
                                <button id="btnviewuser" class="btn btn-info">remove</button>
                              
                          </form>
                          
                        <!-- user details-->
                        <form method="post" name="theform" id="theform" action="/Hospital/MainBackEnd?action=registerUser" class="ui form" style="display: none">
                        <div style="margin-top: 40px;">
                            <div style="color:#0CC7BF"><h1>${errorRegi}</h1></div>
                        
                            <div style="margin-bottom: 20px;">
                                
                                <h3 style="margin-bottom: -25px;">Add User</h3><br>
                                <div class="ui section divider"></div>
                            </div>
                            <div class="ui form">
                                <div class="field">
                                    <label>First Name<a style="color:red">*</a></label>
                                    <div style="color: #FF0000;">${errorfname}</div>
                                      <input name="fname" id="fname" placeholder="i.e. Albert" type="text">
                                </div>
                                <div class="field">
                                    <label>Last Name<a style="color:red">*</a></label>
                                   <div style="color: #FF0000;">${errorlname}</div>
                                    <input name="lname" placeholder="Einstein" type="text">
                                </div>
                                 <div class="field">
                                    <label>NIC Number<a style="color:red">*</a></label>
                                    <div style="color: #FF0000;">${errorNIC}</div>
                                    <input name="validId" placeholder="913015525V" type="text" maxlength="10">
                                </div>
                           <!--     <div class="field">
                                    <label>User Id</label>
                                    <input name="userId" placeholder="001" type="text">
                                </div>-->
                                  <div class="field">
                                    <label>User Name<a style="color:red">*</a></label>
                                    <div style="color: #FF0000;">${errorUserName}</div>
                                    <input name="userName" placeholder="" type="text">
                                </div>
                                <div class="field">
                                <label>Gender<a style="color:red">*</a></label>
                                
                                
                                 <div style="color: #FF0000;">${errorGender}</div>
                                
                                </div>
                                <div class="col-md-3">
                                    <div class="ui toggle checkbox checked" id="male">
                                        <input name="gender" checked="checked" type="radio" value="m">
                                        <label>Male</label>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="ui toggle checkbox" id="male">
                                        <input name="gender" type="radio" value="f">
                                        <label>Female</label>
                                    </div>
                                </div>
                                  <div class="field">
                                    <label>Email</label>
                                    
                                    <input name="email" placeholder="example@gmail.com" type="email">
                                </div>
                                <div class="field">
                                    <label>Birthday<a style="color:red">*</a></label>
                                    <div style="color: #FF0000;">${errorBirthday}</div>
                                    <input name="bday" type="date">
                                </div>
                                <div class="field">
                                    <label>Address Line 1<a style="color:red">*</a></label>
                                    <div style="color: #FF0000;">${errorAddress}</div>
                                    <input name="addr1" placeholder="Line 1" type="text">
                                </div>
                                <div class="field">
                                    <label>Address Line 2</label>
                                    <input name="addr2" placeholder="Line 2" type="text">
                                </div>
                                <div class="field">
                                    <label>Address Line 3</label>
                                    <input name="addr3" placeholder="Line 3" type="text">
                                </div>
                                <div class="field">
                                    <label>Contact No<a style="color:red">*</a></label>
                                    <div style="color: #FF0000;">${errorContactNo}</div>
                                    <input name="phone1" placeholder="Primary" type="text" maxlength="10">
                                    <input name="phone2" placeholder="Secondary (optional)" type="text" maxlength="10">
                                </div>
                                <div style="color: #FF0000;">${errorUType}</div>
                                
                                <div class="field">
                                    <label for="userType">User Type<a style="color:red">*</a></label>
                                    <select id="userType" required="" name="usertype">
                                         <option value="0"> -- Select User Type --</option>
                                        <option value="1">Admin</option>
                                        <option value="2">Doctor</option>
                                        <option value="4">Patient</option>
                                        <option value="6">Nurse</option>
                                        <option value="3">Pharmacist</option>
                                        <option value="8">PRO</option>
                                        <option value="7">Lab Assistant</option>
                                     </select>                    
                                    <div class="ui pointing label dos" style="display: none;">
                                        <font color="#FF2E2E">Please select user type</font>
                                        
                                    </div>
                                </div>
                                
                                
                          <!--      
                                <div class="row">
                                   
                                    <div class="col-md-3">
                                        <div class="ui toggle checkbox" id="userType">
                                            
                                            <input name="usertype" checked="checked" type="radio" value="1" >
                                            <label>Admin</label>
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <div class="ui toggle checkbox" id="userType">
                                            <input name="usertype" type="radio" value="2" id="userType">
                                            <label>Doctor</label>
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <div class="ui toggle checkbox" id="userType">
                                            <input name="usertype" checked="checked" type="radio" value="4" >
                                            <label>Patient</label>
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <div class="ui toggle checkbox" id="userType">
                                            <input name="usertype" type="radio" value="6">
                                            <label>Nurse</label>
                                        </div>
                                    </div>
                                     <div class="col-md-3">
                                        <div class="ui toggle checkbox" id="userType">
                                            <input name="usertype" type="radio" value="3">
                                            <label>pharmacist</label>
                                        </div>
                                    </div>
                                     <div class="col-md-3">
                                        <div class="ui toggle checkbox" id="userType">
                                            <input name="usertype" type="radio" value="7">
                                            <label>Lab Assistant</label>
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <div class="ui toggle checkbox" id="userType">
                                            <input name="usertype" type="radio" value="8">
                                            <label>PRO</label>
                                        </div>
                                    </div>
                                </div>
                                
                                -->
                                         <p>
                                         <label for="specialization">Specialization of the doctor<a style="color:red">*</a></label>
                                   
                                         <select name="doctorType" id="doctorType">
                                           <option value="0">-- Select --</option>                                 
                                            <option value="Accident and emergency medicine">Accident and emergency medicine</option>
                                            <option value="Allergology">Allergology</option>
                                            <option value="Anaesthetics">Anaesthetics</option>
                                            <option value="Biological hematology">Biological hematology</option>
                                            <option value="Cardiology">Cardiology</option>
                                            <option value="Child psychiatry">Child psychiatry</option>
                                            <option value="Clinical biology">Clinical biology</option>
                                            <option value="Clinical chemistry">Clinical chemistry</option>
                                            <option value="Clinical neurophysiology">Clinical neurophysiology</option>
                                            <option value="Craniofacial surgery">Craniofacial surgery</option>
                                            <option value="Dental, oral and maxillo-facial surgery">Dental, oral and maxillo-facial surgery</option>
                                            <option value="Dermato-venerology">Dermato-venerology</option>
                                            <option value="Dermatology">Dermatology</option>
                                            <option value="Endocrinology">Endocrinology</option>
                                            <option value="Gastro-enterologic surgery">Gastro-enterologic surgery</option>
                                            <option value="Gastroenterology">Gastroenterology</option>
                                            <option value="General hematology">General hematology</option>
                                            <option value="General Practice">General Practice</option>
                                            <option value="General surgery">General surgery</option>
                                            <option value="Geriatrics">Geriatrics</option>
                                            <option value="Immunology">Immunology</option>
                                            <option value="Infectious diseases">Infectious diseases</option>
                                            <option value="Internal medicine">Internal medicine</option>
                                            <option value="Laboratory medicine">Laboratory medicine</option>
                                            <option value="Maxillo-facial surgery">Maxillo-facial surgery</option>
                                            <option value="Microbiology">Microbiology</option>
                                            <option value="Nephrology">Nephrology</option>
                                            <option value="Neuro-psychiatry">Neuro-psychiatry</option>
                                            <option value="Neurology">Neurology</option>
                                            <option value="Neurosurgery">Neurosurgery</option>
                                            <option value="Nuclear medicine">Nuclear medicine</option>
                                            <option value="Obstetrics and gynecology">Obstetrics and gynecology</option>
                                            <option value="Occupational medicine">Occupational medicine</option>
                                            <option value="Ophthalmology">Ophthalmology</option>
                                            <option value="Orthopaedics">Orthopaedics</option>
                                            <option value="Otorhinolaryngology">Otorhinolaryngology</option>
                                            <option value="Paediatric surgery">Paediatric surgery</option>
                                            <option value="Paediatrics">Paediatrics</option>
                                            <option value="Pathology">Pathology</option>
                                            <option value="Pharmacology">Pharmacology</option>
                                            <option value="Physical medicine and rehabilitation">Physical medicine and rehabilitation</option>
                                            <option value="Plastic surgery">Plastic surgery</option>
                                            <option value="Podiatric Surgery">Podiatric Surgery</option>
                                            <option value="Psychiatry">Psychiatry</option>
                                            <option value="Public health and Preventive Medicine">Public health and Preventive Medicine</option>
                                            <option value="Radiology">Radiology</option>
                                            <option value="Radiotherapy">Radiotherapy</option>
                                            <option value="Respiratory medicine">Respiratory medicine</option>
                                            <option value="Rheumatology">Rheumatology</option>
                                            <option value="Stomatology">Stomatology</option>
                                            <option value="Thoracic surgery">Thoracic surgery</option>
                                            <option value="Tropical medicine">Tropical medicine</option>
                                            <option value="Urology">Urology</option>
                                            <option value="Vascular surgery">Vascular surgery</option>
                                            <option value="Venereology">Venereology</option>
                                           </select>
                                          
                                         
                                         
                                         </p>
                                         
                                   <p>
                              
                                    <label>Medical council registration number<a style="color:red">*</a></label>
                                     <input name="docId" type="text" id="docId"  placeholder="eg:" >
                                    </p>
                                     <!-- delete this-->    
                                     <p>
                              
                                    <label>errrrrrrrrrrrrrrrr</label>
                                     <input name="doc" type="text" id="doc">
                                    </p><!--until-->
                     <button id="btnadduser" class="btn btn-info">Submit</button>
                     
                   
                     
                     
                     
                            </div>
                        </div>
                        </form>
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
    $('.ui.checkbox').checkbox(function() {

    });
    $("#male").click(function() {

        $("#female").removeAttr('checked');
    });
    $("#female").click(function() {
        $("#male").removeAttr('checked');
    });
</script>



<script type="text/javascript" src="JS/jquery-1.11.3.min.js"> </script>
   
 <script type="text/javascript">
    $(document).ready(function(){

    $("#addUser").click(function(e) {
    $("#theform").show();
    $("#viewUserForm").hide();
    $("#editUserForm").hide();
    $("#removeUserForm").hide();

    e.preventDefault();
});
    });
</script>
<script type="text/javascript">
    $(document).ready(function(){

    $("#viewUser").click(function(e) {
    $("#viewUserForm").show();
    $("#theform").hide();
    $("#editUserForm").hide();
    $("#removeUserForm").hide();
    e.preventDefault();
});
    });
</script>
<script type="text/javascript">
    $(document).ready(function(){

    $("#removeUser").click(function(e) {
    $("#viewUserForm").hide();
    $("#theform").hide();
    $("#editUserForm").hide();
    $("#removeUserForm").show();
    e.preventDefault();
});
    });
</script>
<script type="text/javascript">
    $(document).ready(function(){

    $("#editUser").click(function(e) {
    $("#viewUserForm").hide();
    $("#theform").hide();
    $("#editUserForm").show();
    $("#removeUserForm").hide();
    e.preventDefault();
});
    });
</script>
<script>
    $(function(){
        var doctor=$('#doctorType');
        var docId=$('#docId');
       
      
      doctor.attr('disabled');
      doctor.parent('p').hide();
		
      docId.attr('disabled');
      docId.parent('p').hide();
      
        $('#userType').change(function(e){
            var val=$(this).val();
         
            doctor.attr('disabled');
            doctor.parent('p').hide();
            
            docId.attr('disabled');
            docId.parent('p').hide();
            
            if(val=='2'){
                      //  both.removeAttr('disabled','disabled');
                      //  both.prev('label').text('Spetialize');
                      //  both.parent('a').show();
                      doctor.removeAttr('disabled');
                      //doctor.prev('label').text('Spetialize');
                      doctor.parent('p').show();
                      
                      docId.removeAttr('disabled');
                     // docId.prev('label').text('Medical council registration number');
                      docId.parent('p').show();
                    }
        });
        
    });
    
    
    
    
</script>
<script>
    $(function(){
        
        var doc=$('#doc');
      doc.attr('disabled');
      doc.parent('p').hide();
      
     
      
        $('#mvale').change(function(e){
            var val=$(this).val();
          doc.attr('disabled');
      doc.parent('p').hide();
           
            
            if(val=="f"){
                      //  both.removeAttr('disabled','disabled');
                      //  both.prev('label').text('Spetialize');
                      //  both.parent('a').show();
                      doc.removeAttr('disabled');
                      //doctor.prev('label').text('Spetialize');
                      doc.parent('p').show();
                      
                     
                    }
        });
        
    });
    
    
    
    
</script>

</body>
</html>