<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="Header.jsp"></jsp:include>
    <div class="contentbody" style="background-color: #F7F7F7">
    <jsp:include page="NurseUserOption.jsp"></jsp:include>
        <div class="pusher">
            <div class="ui grid">
                <div class="two wide column">                
                </div>
                <div class="twelve wide column">
                    <div class="row"  style="margin-top: 15px; margin-bottom: 10px;">
                        <div class="col-sm-12 col-md-5">
                            <img class="ui centered medium image" src="IMAGES/AdmitPatient.png">
                            <!--<img class="" src="IMAGES/Admit.png" >-->
                        </div>
                        <div class="col-sm-12 col-md-7" >
                            <h2>Admit Patient</h2>
                            <div class="ui form" >
                                <div class="field">
                                    <label>Patient id</label>
                                    <input id="txtmedicine" class="form-control" type="text" name="medicine" placeholder="i.e. 0001">
                                    <div class="ui pointing label med" style="display: none;">
                                        <font color="#FF2E2E">Please enter patient id</font>
                                    </div>
                                </div>
                                <div class="field">
                                    <label>Date Admitted</label>
                                    <input id="txtdosage"  class="form-control" type="text" name="dosage" placeholder="i.e. 2015-01-20">
                                    <div class="ui pointing label dos" style="display: none;">
                                        <font color="#FF2E2E">Please enter Date</font>
                                    </div>
                                </div>
                                
                                <div class="field">
                                    <label>Ward No</label>
                                    <input id=""  class="form-control" type="text" name="" placeholder="i.e. 021">
                                    <div class="ui pointing label dos" style="display: none;">
                                        <font color="#FF2E2E">Please enter Ward No</font>
                                    </div>
                                </div>
                                
                                 <div class="field">
                                    <label>Bed NO</label>
                                    <input id=""  class="form-control" type="text" name="" placeholder="i.e. 001">
                                    <div class="ui pointing label dos" style="display: none;">
                                        <font color="#FF2E2E">Please enter Bed No</font>
                                    </div>
                                </div>
                                
                                

                                <button id="btnmedicine" class="btn btn-info">Confirm</button>
                            </div>
                            <br>
                            <div class="alert alert-success" role="alert" style="display: none;">
                                <a href="#" class="alert-link">Patient Added</a>
                            </div>
                            <div class="alert alert-danger" role="alert" style="display: none;">
                                <a href="#" class="alert-link"> Try again</a>
                            </div>
                        </div>
                    </div>
                    <div>
                        <table class="ui celled table">
                            <thead>
                                <tr><th>id</th>
                                    <th>Patient id</th>
                                    <th>Date Admitted</th>
                                    <th>Discharge</th>
                                </tr></thead>
                            <tbody>
                            <c:choose>
                                <c:when test="${empty admit}">
                                    <tr>
                                        <td class="center aligned"><h2>No Records Found</h2></td>
                                    </tr>
                                </c:when>
                                <c:otherwise>
                                    <c:forEach items="${admit}" var="admit">
                                        <tr id="${admit.inPatientId}">
                                            <td class="center aligned">${admit.inPatientId}</td>
                                            <td class="center aligned meddicinename">${admit.patientId}</td>
                                            <td class="center aligned medicinevolume">${admit.dateAdmitted}</td>
                                            <td class="center aligned">
                                                <div class="ui buttons">
                                                    <div class="ui button"><i class="edit icon"></i></div>
                                                    <div class="ui floating dropdown icon button">
                                                        <i class="dropdown icon"></i>
                                                        <div class="menu">
                                                            <input class="medicineid" style="display: none" value="${admit.inPatientId}">
                                                            <div id="${admit.inPatientId}" class="item editmodal"><i class="edit icon"></i> Edit</div>
                                                            <div id="${admit.inPatientId}" class="item delmodal"><i class="delete icon"></i> Remove</div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </c:otherwise>
                            </c:choose>
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
<!-- delete modal-->
<div class="ui basic modal coupled del">
    <i class="close icon"></i>
    <div class="header">
        Warning
    </div>
    <div class="image content">
        <div class="image">
            <i class="warning sign icon"></i>
        </div>
        <div class="description">
            <p>Do you Want to discharge? "<font id="delmedicinename"></font>"</p>
            <input id="delid" style="display: none;" value="">
        </div>
    </div>
    <div class="actions">
        <div class="ui red basic inverted deny button">
            <i class="remove icon"></i>
            No
        </div>
        <div class="ui green basic inverted button approve btndelmedicine">
            <i class="checkmark icon"></i>
            Yes
        </div>
    </div>
</div>
<!-- edit modal-->
<div class="ui modal coupled edit">
    <i class="close icon"></i>
    <div class="header">
        Edit 
    </div>
    <div class="image content">
        <div class="ui medium image">
            <img src="IMAGES/pills.jpg" style="width: 400px;">
        </div>
        <div class="description">
            <div class="ui form" >
                <input id="editid" style="display: none;" value="">
                <div class="field">
                    <label>Patient ID</label>
                    <input id="txteditmedicine" class="form-control" type="text" name="medicine" placeholder="i.e. 0001">
                    <div class="ui pointing label editmed" style="display: none;">
                        <font color="#FF2E2E">Please enter ID</font>
                    </div>
                </div>
                <div class="field">
                    <label>Date</label>
                    <input id="txteditdosage"  class="form-control" type="text" name="dosage" placeholder="i.e. 001">
                    <div class="ui pointing label editdos" style="display: none;">
                        <font color="#FF2E2E">Please enter Patient ID</font>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="actions">
        <div class="ui black deny button">
            Discard
        </div>
        <div class="ui positive left labeled icon button approve btneditmedicine">
            Save
            <i class="checkmark icon"></i>
        </div>
    </div>
</div>
<!-- success modal-->
<div class="ui modal small success coupled">
    <i class="close icon"></i>
    <div class="header">
        Success
    </div>
    <div class="image content">
        <div class="ui tiny image">
        </div>
        <div class="ui small image">
            <i class="thumbs outline up icon"></i>
        </div>
        <div class="description">
            <div>
                The medicine was successfully <p id="action"></p>
            </div>   
        </div>
    </div>
    <div class="actions">    
        <div class="ui positive left labeled icon deny button alldone">
            All done
            <i class="checkmark icon"></i>
        </div>
    </div>
</div>
<!-- failed modal-->
<div class="ui modal small failed coupled">
    <i class="close icon"></i>
    <div class="header">
        Failed
    </div>
    <div class="image content">
        <div class="ui tiny image">
        </div>
        <div class="ui small image center aligned">
            <i class="info icon"></i>
        </div>
        <div class="description">
            <div>
                Failed to <font id="action"></font> the medicine.
            </div>   
        </div>
    </div>
    <div class="actions">    
        <div class="ui positive left labeled icon deny button alldone">
            <i class="long arrow left icon"></i>
            Back

        </div>
    </div>
</div>

<jsp:include page="Footer.jsp"></jsp:include>
<script>
    medicine = "";
    dosage = "";
    id = "";
    txteditmedicine = "";
    txtdosage = "";
    $(".alldone").click(function() {
        location.reload(true);
    });
    $("#btnmedicine").click(function() {
        medicine = $("#txtmedicine").val();
        dosage = $("#txtdosage").val();
        if (medicine != "" && dosage != "") {
            $.post("MainBackEnd", {action: 'addinpatient',patientId: medicine, dateAdmitted: dosage}, function(responseJson) {
                if (responseJson != null || responseJson != "") {
                    $(".alert-success").css("display", "block");
                    $("tbody").html("");
                    $.each(responseJson, function(index, item) { // Iterate over the JSON array.
                        $("tbody").append("<tr><td class='center aligned'>" + item.inPatientId + "</td>\n\
                                        <td class='center aligned'>" + item.patientId + "</td>\n\
                                        <td class='center aligned'>" + item.dateAdmitted + "</td>\n\
                                        <td class='center aligned'><div class='ui buttons'>\n\
                                        <div class='ui button'><i class='edit icon'></i></div>\n\
                                        <div class='ui floating dropdown icon button'>\n\
                                        <i class='dropdown icon'></i><div class='menu'>\n\
                                        <input class='medicineid' style='display: none' value=" + item.patientId + ">\n\
                                        <div id=" + item.patientId + " class='item editmodal'><i class='edit icon'></i> Edit</div>\n\
                                        <div id=" + item.patientId + " class='item delmodal'><i class='delete icon'></i> Remove</div>\n\
                                        </div></div></div></td></tr>");

                    });
                    location.reload(true);
                } else {
                    $(".alert-danger").css("display", "block");
                }
            });
            return;
        }
        if (medicine == "") {
            $(".med").css("display", "block");
        } else {
            $(".med").css("display", "none");
        }
        if (dosage == "") {
            $(".dos").css("display", "block");
        }
        else {
            $(".dos").css("display", "none");
        }
        console.log(medicine);
    });

    $('.ui.dropdown').dropdown();
    $('.editmodal').click(function() {
        id = this.id;
        $("#editid").val(id);
        txteditmedicine = $("#" + id).find('.meddicinename').text();
        txtdosage = $("#" + id).find('.medicinevolume').text();
        $("#txteditmedicine").val(txteditmedicine);
        $("#txteditdosage").val(txtdosage);
    });
    $('.delmodal').click(function() {
        id = this.id;
        $("#delid").val(id);
        txteditmedicine = $("#" + id).find('.meddicinename').text();
        txtdosage = $("#" + id).find('.medicinevolume').text();
        $("#delmedicinename").text(txteditmedicine + " " + txtdosage);
    });
    $('.ui.modal.edit').modal({
        onApprove: function() {
            return false;
        }
    }).modal('attach events', '.editmodal', 'show');
    $('.ui.basic.modal.del').modal({
        onApprove: function() {
            return false;
        }
    }).modal('attach events', '.delmodal', 'show');
    $('.btneditmedicine').click(function() {
        id = $("#editid").val();
        medicine = $("#txteditmedicine").val();
        dosage = $("#txteditdosage").val();
        if (medicine != "" && dosage != "") {
            $.post("MainBackEnd", {action: 'editmedicine', medicineid: id, medicine: medicine, dosage: dosage}, function(responseJson) {
                if (responseJson != null || responseJson != "") {
                    $("#action").html("edited");
                    $('.coupled.modal').modal({
                        allowMultiple: true
                    });
                    $('.ui.modal.success').modal('show');
                    $("tbody").html("");
                    $.each(responseJson, function(index, item) { // Iterate over the JSON array.
                        $("tbody").append("<tr><td class='center aligned'>" + item.medicineId + "</td>\n\
                                        <td class='center aligned'>" + item.medicine + "</td>\n\
                                        <td class='center aligned'>" + item.dosage + "</td>\n\
                                        <td class='center aligned'><div class='ui buttons'>\n\
                   <div class='ui button'><i class='edit icon'></i></div>\n\
                                        <div class='ui floating dropdown icon button'>\n\
                                        <i class='dropdown icon'></i><div class='menu'>\n\
                                        <input class='medicineid' style='display: none' value=" + item.medicine + ">\n\
                                        <div id=" + item.medicine + " class='item editmodal'><i class='edit icon'></i> Edit</div>\n\
                                        <div id=" + item.medicine + " class='item delmodal'><i class='delete icon'></i> Remove</div>\n\
                                        </div></div></div></td></tr>");
                    });

                } else {
                    $('.coupled.modal').modal({
                        allowMultiple: true
                    });
                    $("#action").html("edit");
                    $('.ui.modal.failed').modal('show');
                }

            });
            return;
        }
        if (medicine == "") {
            $(".editmed").css("display", "block");
        } else {
            $(".editmed").css("display", "none");
        }
        if (dosage == "") {
            $(".editdos").css("display", "block");
        }
        else {
            $(".editdos").css("display", "none");
        }
    });
    $('.btndelmedicine').click(function() {
        alert("del");
        id = $("#delid").val();
        $.post("MainBackEnd", {action: 'deletemedicine', medicineid: id}, function(responseJson) {
            if (responseJson != null || responseJson != "") {
                $("#action").html("deleted");
                $('.coupled.modal').modal({
                    allowMultiple: true
                });
                $('.ui.modal.success').modal('show');
                $("tbody").html("");
                $.each(responseJson, function(index, item) { // Iterate over the JSON array.
                    $("tbody").append("<tr><td class='center aligned'>" + item.medicineId + "</td>\n\
                                        <td class='center aligned'>" + item.medicine + "</td>\n\
                                        <td class='center aligned'>" + item.dosage + "</td>\n\
                                        <td class='center aligned'><div class='ui buttons'>\n\
                                        <div class='ui button'><i class='edit icon'></i></div>\n\
                                        <div class='ui floating dropdown icon button'>\n\
                                        <i class='dropdown icon'></i><div class='menu'>\n\
                                        <input class='medicineid' style='display: none' value=" + item.medicine + ">\n\
                                        <div id=" + item.medicine + " class='item editmodal'><i class='edit icon'></i> Edit</div>\n\
                                        <div id=" + item.medicine + " class='item delmodal'><i class='delete icon'></i> Remove</div>\n\
                                        </div></div></div></td></tr>");
                });
            } else {
                $('.coupled.modal').modal({
                    allowMultiple: true
                });
                $("#action").html("delete");
                $('.ui.modal.failed').modal('show');
            }
        });
    });
</script>
</body>
</html>