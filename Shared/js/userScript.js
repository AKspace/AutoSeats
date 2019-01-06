$(document).ready(function () {
    $("input").click(function () {
        $(this).removeClass('errorBorder');

    });

});
 

function requiredField(element) {
    var x = document.getElementById(element);
    if (x.value === "") {
        x.className += " errorBorder";
    }
    else {
        var y = x.className;
        y = y.split(' ');
        x.className = y[0];
    }
}
function resetField() {
    document.getElementById("txtEmail").value = "";
    document.getElementById("txtPassword").value = "";
}
