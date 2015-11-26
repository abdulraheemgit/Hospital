<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="PharmacistsHeader.jsp"></jsp:include>
    <div class="contentbody" style="background-color: #F7F7F7">
    <jsp:include page="PharmacistsUserOption.jsp"></jsp:include>
        <div class="pusher">
            <div class="ui grid">
                <div class="two wide column">                
                </div>
                <div class="twelve wide column"> 


                    <table class="ui celled table">
                        <thead>
                            <tr>
                                <th class='center aligned'>Patient ID</th>
                                <th class='center aligned'>Date</th>
                                <th class='center aligned'>Time</th>
                                <th class='center aligned'>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                        <c:choose>
                            <c:when test="${empty listMedications}">
                            <tr>
                                <td class="center aligned"><h2>No Appoinments Found</h2></td>
                            </tr>
                            </c:when>
                            <c:otherwise>
                                <c:forEach var="medicine" items="${listMedications}">
                                    <tr id="${medicine.madicationId}">
                                        <td class="center aligned meddicationId"><c:out value="${medicine.madicationId}"/></td>
                                        <td class="center aligned patientId"><c:out value="${medicine.patientId}"/></td>
                                        <td class="center aligned "><c:out value="${medicine.doctorId}"/></td>
                                        <td class="center aligned "><c:out value="${medicine.dateGiven}"/></td>
                                        <td class="center aligned "><c:out value="${medicine.status}"/></td>
                                        <td class="center aligned">
                                            <div class="ui buttons">
                                                <div class="ui button"><i class="edit icon"></i></div>
                                                <div class="ui floating dropdown icon button">
                                                    <i class="dropdown icon"></i>
                                                    <div class="menu">
                                                        <input class="medicineid" style="display: none" value="${medicine.madicationId}">                                               
                                                            <div id="${medicine.madicationId}" class="item issuemodal"><i class="payment icon"></i> Issue </div>
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
                            <tr>
                                <th colspan="6">
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
                            </tr>
                        </tfoot>
                    </table>


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
        
        
<!-- issue modal-->
<div class="ui basic modal coupled del">
    <div class="image content">
        <div class="image">
            <i class="success sign icon"></i>
        </div>
        <div class="description">
            <p>Did You Issue Medicine "<font id="delmedicinename"></font>" ? </p>
            <input id="issueid" style="display: none;" value="">
        </div>
    </div>
    <div class="actions">
        <div class="ui red basic inverted deny button">
            <i class="remove icon"></i>
            No
        </div>
        <div class="ui green basic inverted button approve btnissuelmedicate">
            <i class="checkmark icon"></i>
            Yes
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
    id = "";
    pid = "";
    
    $('.ui.dropdown').dropdown();
    
    $('.issuemodal').click(function() {
        id = this.id;
        pid = this.pid;
        $("#issueid").val(id);
        $("pid").val(pid);
        txtmedicate = $("#" + id).find('.meddicationId');
        txtpid = $("#" + pid).find('.patientId').text();
    });
    $('.ui.basic.modal.del').modal({
        onApprove: function() {
            return false;
        }
    }).modal('attach events', '.issuemodal', 'show');
    $('.btnissuelmedicate').click(function() {
        id = $("#issueid").val();
        pid = $("pid").val();
        $.post("MainBackEnd", {action: 'issuemedicine', medicineid: id, patientid: pid}, function(responseJson) {
            if (responseJson != null || responseJson != "") {
                $("#action").html("issued");
                $('.coupled.modal').modal({
                    allowMultiple: true
                });
                $('.ui.modal.success').modal('show');
                $("tbody").html("");
                $.each(responseJson, function(index, item) { // Iterate over the JSON array.
                    $("tbody").append("<tr><td class='center aligned'>" + item.madicationId + "</td>\n\
                                        <td class='center aligned'>" + item.patientId + "</td>\n\
                                        <td class='center aligned'>" + item.doctorId + "</td>\n\\n\
                                        <td class='center aligned'>" + item.dateGiven + "</td>\n\\n\
                                        <td class='center aligned'>" + item.status + "</td>\n\
                                        <td class='center aligned'><div class='ui buttons'>\n\
                                        <div class='ui button'><i class='edit icon'></i></div>\n\
                                        <div class='ui floating dropdown icon button'>\n\
                                        <i class='dropdown icon'></i><div class='menu'>\n\
                                        <input class='medicineid' style='display: none' value=" + item.madicationId + ">\n\
                                        <div id=" + item.madicationId + " class='item issuemodal'><i class='payment icon'></i> Issued </div>\n\
                                        </div></div></div></td></tr>");
                });
                location.reload(true);
            } else {
                $('.coupled.modal').modal({
                    allowMultiple: true
                });
                $("#action").html("issue");
                $('.ui.modal.failed').modal('show');
            }
        });
    });
    
    
</script>

</body>
</html>