//
// function myccc() {
//     $.ajax(
//         {
//             type: "post",
//             url: "jsp/login.jsp",
//             data: {username: $('#username').val(),password: hex_md5($("#password").val()),},
//
//
//            error: function (XMLHttpRequest, textStatus, errorThrown) {
//                 alert(XMLHttpRequest.status);
//                 alert(textStatus);
//                 alert(errorThrown);
//
//             },
//             success: function (username) {
//                 if(username==-1){
//                     $("#defaultForm").data('bootstrapValidator').resetForm();
//                     $("#password").val("");
//                     // $("#error-lable").show();
//                 }
//                 else {
//                     window.location.href = "MyMeeting.html";
//                 }
//             }
//         }
//     );
// }

