<%-- 
    Document   : Tests
    Created on : Oct 28, 2015, 9:31:54 PM
    Author     : Anobiya
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="Header.jsp"></jsp:include>
    <div class="contentbody" style="background-color: #F7F7F7">
    <jsp:include page="UserOption.jsp"></jsp:include>
        <div class="pusher">
            <div class="ui grid">
                <div class="two wide column">                
                </div>
                <div class="twelve wide column">
                    <div class="row"  style="margin-top: 15px; margin-bottom: 10px;">
                        <div class="col-sm-12 col-md-5">
                            <img src="IMAGES/ttube.jpg" style="width: 400px;">
                        </div>
                        <div class="col-sm-12 col-md-7" >
                            <h2>Add Test</h2>
                            <div class="ui form" >
                                <div class="field">
                                    <label>Name of the test</label>
                                    <input id="txttest" class="form-control" type="text" name="test" placeholder="i.e. Full Blood Count">
                                    <div class="ui pointing label test" style="display: none;">
                                        <font color="#FF2E2E">Please enter test name</font>
                                    </div>
                                </div>

                                <button id="btntest" class="btn btn-info">Submit</button>
                            </div>
                            <br>
                            <div class="alert alert-success" role="alert" style="display: none;">
                                <a href="#" class="alert-link">Well done! You have successfully added a test</a>
                            </div>
                            <div class="alert alert-danger" role="alert" style="display: none;">
                                <a href="#" class="alert-link">The test was not Added. Try again</a>
                            </div>
                        </div>
                    </div>
                    <div>
                        <table class="ui celled table">
                            <thead>
                                <tr><th>id</th>
                                    <th>Test</th>
                                    <th>Action</th>
                                </tr></thead>
                            <tbody>
                            <c:choose>
                                <c:when test="${empty tests}">
                                    <tr>
                                        <td class="center aligned"><h2>No Records Found</h2></td>
                                    </tr>
                                </c:when>
                                <c:otherwise>
                                    <c:forEach items="${tests}" var="tests">
                                        <tr id="${tests.testId}">
                                            <td class="center aligned">${tests.testId}</td>
                                            <td class="center aligned testname">${tests.testName}</td>
                                            
                                            <td class="center aligned">
                                                <div class="ui buttons">
                                                    <div class="ui button"><i class="edit icon"></i></div>
                                                    <div class="ui floating dropdown icon button">
                                                        <i class="dropdown icon"></i>
                                                        <div class="menu">
                                                            <input class="testid" style="display: none" value="${tests.testId}">
                                                            <div id="${tests.testId}" class="item editmodal"><i class="edit icon"></i> Edit</div>
                                                            <div id="${tests.testId}" class="item delmodal"><i class="delete icon"></i> Remove</div>
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
            <p>Are you sure you want to remove the test "<font id="deltestname"></font>"</p>
            <input id="delid" style="display: none;" value="">
        </div>
    </div>
    <div class="actions">
        <div class="ui red basic inverted deny button">
            <i class="remove icon"></i>
            No
        </div>
        <div class="ui green basic inverted button approve btndeltest">
            <i class="checkmark icon"></i>
            Yes
        </div>
    </div>
</div>
<!-- edit modal-->
<div class="ui modal coupled edit">
    <i class="close icon"></i>
    <div class="header">
        Edit test
    </div>
    <div class="image content">
        <div class="ui medium image">
            <img src="IMAGES/ttube.jpg" style="width: 400px;">
        </div>
        <div class="description">
            <div class="ui form" >
                <input id="editid" style="display: none;" value="">
                <div class="field">
                    <label>Name of the test</label>
                    <input id="txtedittest" class="form-control" type="text" name="test" placeholder="i.e. Full Blood Count">
                    <div class="ui pointing label edittest" style="display: none;">
                        <font color="#FF2E2E">Please enter test name</font>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="actions">
        <div class="ui black deny button">
            Discard
        </div>
        <div class="ui positive left labeled icon button approve btnedittest">
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
                The test was successfully <p id="action"></p>
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
                Failed to <font id="action"></font> the test.
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
    test = "";
    id = "";
    txtedittest = "";
    $(".alldone").click(function() {
        location.reload(true);
    });
    $("#btntest").click(function() {
        test = $("#txttest").val();
        if (test != "") {
            $.post("MainBackEnd", {action: 'addtest', test: test}, function(responseJson) {
                if (responseJson != null || responseJson != "") {
                    $(".alert-success").css("display", "block");
                    $("tbody").html("");
                    $.each(responseJson, function(index, item) { // Iterate over the JSON array.
                        $("tbody").append("<tr><td class='center aligned'>" + item.testId + "</td>\n\
                                        <td class='center aligned'>" + item.test + "</td>\n\
                                        <td class='center aligned'><div class='ui buttons'>\n\
                                        <div class='ui button'><i class='edit icon'></i></div>\n\
                                        <div class='ui floating dropdown icon button'>\n\
                                        <i class='dropdown icon'></i><div class='menu'>\n\
                                        <input class='testid' style='display: none' value=" + item.test + ">\n\
                                        <div id=" + item.test + " class='item editmodal'><i class='edit icon'></i> Edit</div>\n\
                                        <div id=" + item.test + " class='item delmodal'><i class='delete icon'></i> Remove</div>\n\
                                        </div></div></div></td></tr>");

                    });
                    location.reload(true);
                } else {
                    $(".alert-danger").css("display", "block");
                }
            });
            return;
        }
        if (test == "") {
            $(".test").css("display", "block");
        } else {
            $(".test").css("display", "none");
        }
        console.log(test);
    });
    $('.ui.dropdown').dropdown();
    $('.editmodal').click(function() {
        id = this.id;
        $("#editid").val(id);
        txtedittest = $("#" + id).find('.testname').text();
        $("#txtedittest").val(txtedittest);
    });
    $('.delmodal').click(function() {
        id = this.id;
        $("#delid").val(id);
        txtedittest = $("#" + id).find('.testname').text();
        $("#deltestname").text(txtedittest);
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
    $('.btnedittest').click(function() {
        id = $("#editid").val();
        test = $("#txtedittest").val();
        if (test != "") {
            $.post("MainBackEnd", {action: 'edittest', testid: id, test: test}, function(responseJson) {
                if (responseJson != null || responseJson != "") {
                    $("#action").html("edited");
                    $('.coupled.modal').modal({
                        allowMultiple: true
                    });
                    $('.ui.modal.success').modal('show');
                    $("tbody").html("");
                    $.each(responseJson, function(index, item) { // Iterate over the JSON array.
                        $("tbody").append("<tr><td class='center aligned'>" + item.testId + "</td>\n\
                                        <td class='center aligned'>" + item.test + "</td>\n\
                                        <td class='center aligned'><div class='ui buttons'>\n\
                                        <div class='ui button'><i class='edit icon'></i></div>\n\
                                        <div class='ui floating dropdown icon button'>\n\
                                        <i class='dropdown icon'></i><div class='menu'>\n\
                                        <input class='testid' style='display: none' value=" + item.test + ">\n\
                                        <div id=" + item.test + " class='item editmodal'><i class='edit icon'></i> Edit</div>\n\
                                        <div id=" + item.test + " class='item delmodal'><i class='delete icon'></i> Remove</div>\n\
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
        if (test == "") {
            $(".edittest").css("display", "block");
        } else {
            $(".edittest").css("display", "none");
        }
    });
    $('.btndeltest').click(function() {
        alert("del");
        id = $("#delid").val();
        $.post("MainBackEnd", {action: 'deletetest', testid: id}, function(responseJson) {
            if (responseJson != null || responseJson != "") {
                $("#action").html("deleted");
                $('.coupled.modal').modal({
                    allowMultiple: true
                });
                $('.ui.modal.success').modal('show');
                $("tbody").html("");
                $.each(responseJson, function(index, item) { // Iterate over the JSON array.
                    $("tbody").append("<tr><td class='center aligned'>" + item.testId + "</td>\n\
                                        <td class='center aligned'>" + item.test + "</td>\n\
                                        <td class='center aligned'><div class='ui buttons'>\n\
                                        <div class='ui button'><i class='edit icon'></i></div>\n\
                                        <div class='ui floating dropdown icon button'>\n\
                                        <i class='dropdown icon'></i><div class='menu'>\n\
                                        <input class='testid' style='display: none' value=" + item.test + ">\n\
                                        <div id=" + item.test + " class='item editmodal'><i class='edit icon'></i> Edit</div>\n\
                                        <div id=" + item.test + " class='item delmodal'><i class='delete icon'></i> Remove</div>\n\
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