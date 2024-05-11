/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

//$(document).ready(function() {
//    alert("document loaded");
//});



function doLike(pid, uid) {
    const data = {
        uid: uid,
        pid: pid,
        operation: 'like'
    };
    
    $.ajax({
        url: "Like",
        data: data,
        success: function (data, textStatus, jqXHR) {
            console.log(data);
            if (data.trim() == 'true') {
                let c = $(".like-counter").html();
                c++;
                $(".like-counter").html(" " + c);
            }
        },
        error: function (jqXHR, textStatus, errorThrown) {
            console.log(jqXHR.toLocaleString());
        }
    });
}