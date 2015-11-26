error = 0;
username = "";
password = "";
email = "";
$("#username").blur(function() {
    username = $("#username").val();
    if (username == '' || username == null) {
        $("#userdiv").html("<font color='#FF2F00' style='font-size:80%;'>username cannot be empty</font>");
        error = 1;
    } else {
        $.post("Main", {action: "checkusername", username: username}, function(z) {
            $("#userdiv").html(z);
        });
        error = 0;
    }
});
$("#re-password").blur(function() {
//    alert(email);
    pass1 = $("#password").val();
    pass2 = $("#re-password").val();
    if (pass1 == '' || pass1 == null) {
        $("#passdiv").html("<font color='#FF2F00' style='font-size:80%;'>passwords cannot be empty</font>");
        error = 1;
    } else {
        if (pass1 == pass2) {
            $("#passdiv").html("<font color='#008080' style='font-size:80%;'>Passwords are matching</font>");
            error = 0;
        } else {
            $("#passdiv").html("<font color='#FF2F00' style='font-size:80%;'>Passwords are not matching</font>");
            error = 1;
        }
    }
});
$("#email").blur(function() {
    email = $("#email").val();
//    alert(email);
    if (email == '' || email == null) {
        $("#maildiv").html("<font color='#FF2F00' style='font-size:80%;'>Emial cannot be empty</font>");
        error = 1;
    } else {
        if (!isEmail(email)) {
            $("#maildiv").html("<font color='#FF2F00' style='font-size:80%;'>Invalid email address</font>");
            error = 1;
        } else {
            $("#maildiv").html("<font color='#008080' style='font-size:80%;'>valid email address</font>");
            error = 0;
        }
    }

});
function isEmail(email) {
    var regex = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/;
    return regex.test(email);
}

function isnumber(str) {
    var n = ~~Number(str);
    return String(n) === str && n > 0;
}



$("#btnsignup").click(function() {

    if (!$('#agreements').prop('checked')) {
        $("#lblagreement").css("color", "#FF2F00");
        error = 1;
    } else {
        $("#lblagreement").css("color", "#5bbd72");
        error = 0;
    }
    if (error == 1) {
        toastr.error('Incomplete Form');
    } else {
        username = $("#username").val();
        password = $("#password").val();
        repassword = $("#re-password").val();
        email = $("#email").val();
        if (username == "" || username == null || password == "" || password == null || repassword == "" || repassword == null || email == "" || email == null) {
            toastr.error('Incomplete Form');
        } else {
            $.post("Main", {action: "signup", username: username, password: password, email: email}, function(z) {
//                alert(z);
//            $("#userdiv").html(z);
                if (z == null || z == "") {
                    toastr.error('Error')
                } else if (true) {
                    $(".navbar-right > li.btnsignup > a").html("Welcome " + z[2]);
                    $(".navbar-right > li.btnlogin > a").html("");
                    $(".rightdiv").html("<div class='ui togglebar button black right floated'>"
                            + "<span class='glyphicon glyphicon-triangle-left' aria-hidden='true'></span>"
                            + "<i class='tasks icon'></i></div>");
                    toastr.success('Thank you for signin up');
//                    $.post("Main", {action: "login", username: username, password: password}, function(z) {
//                        
//                    });
                }
            });
        }
    }
});
$("#agreement").checkbox();