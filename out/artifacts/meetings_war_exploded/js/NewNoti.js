$(function () {

    $.ajax({//未来七天我要参加的会议
        type: "POST",
        url: "jsp/NewNoti.jsp",
        cache: false,
        timeout:3000,
        complete: function () {
            if(status=='timeout'){
                alert("超时");
            }
        },
        data: {fun: 0},
        dataType: 'json',
        success: function (data) {
            $('#tablefuture').bootstrapTable('load', data);

        },
        error: function () {
            swal("糟糕了", "服务器好像休息了", "error");
        }
    });
    $.ajax({//已经取消的会议
        type: "POST",
        url: "jsp/NewNoti.jsp",
        cache: false,
        timeout:3000,
        complete: function () {
            if(status=='timeout'){
                swal("糟糕了", "服务器好像休息了", "error");
            }
        },
        data: {fun: 1},
        dataType: 'json',
        success: function (data) {
            $('#tableconcel').bootstrapTable('load', data);

        },
        error: function () {
            alert("error");
        }
    });

});

function mysubmit() {

    return false;

}


$(document).ready(function () {


});




window.operateEvent = {
    'click .details': function (e, value, row, index) {
        $('#meetingName_modal').val(row.meetingName);
        $('#peopleNum_modal').val(row.peopleNum);
        $('#starttime_modal').val(row.starttime);
        $('#endtime_modal').val(row.endtime);
        $('#meetingNotes_modal').val(row.meetingNotes);
        $('#table').bootstrapTable('load', row.data);
    }
};

