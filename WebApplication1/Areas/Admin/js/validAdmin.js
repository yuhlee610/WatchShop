$(document).ready(function () {
    $("#create").click(function () {
        if (checkNull()) {
            $("#alert").removeClass("d-none");
            $("#alert").html("Error occured");
            return;
        }
        var m = $("#inputEmailAddress").val();
        if (emailIsValid(m) == false) {
            console.log("aaa");
            $("#alert").removeClass("d-none");
            $("#alert").html("Your email not valid");
            return;
        }
        var name = $("#inputName").val();
        var mail = $("#inputEmailAddress").val();
        var pass = $("#inputPassword").val();
        $.ajax({
            url: "/Admin/Admin/registerAdmin",
            data: { name: name, mail: mail, pass: pass },
            success: function (response) {
                if (response == "fail") {
                    $("#alert").removeClass("d-none");
                    $("#alert").html("Account exists");
                }
                else {
                    $("#alert").removeClass("d-none");
                    $("#alert").html("Success");
                }
            }
        });
    });

    function checkNull() {
        var name = $("#inputName").val();
        var mail = $("#inputEmailAddress").val();
        var pass = $("#inputPassword").val();
        var confpass = $("#inputConfirmPassword").val();
        if (name == "" || mail == "" || pass == "" || confpass == "" || pass != confpass) {
            return true;
        }
        return false;
    }

    function emailIsValid(email) {
        return /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email);
    }



});
