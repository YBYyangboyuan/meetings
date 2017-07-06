

function mysubmit() {

    return false;

}
function operateFormatter(value, row, index) {
    return [
        '<button type="button" class="details nooutline RoleOfC btn btn-default  btn-sm" data-toggle="modal" data-target="#myModal">查看详情</button>',

    ].join('');
}

$(document).ready(function () {

    $(function () {
        $.ajax({//未来七天我要参加的会议
            type: "POST",
            url: "jsp/MyMeeting.jsp",
            cache: false,
            timeout:3000,
            complete: function () {
                if(status=='timeout'){
                    alert("超时");
                }
            },
            data: {fun: 0,},
            dataType: 'json',
            success: function (data) {
                $('#tableResver').bootstrapTable('load', data);
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                swal("糟糕了", "服务器好像休息了", "error");

            }
        });

    });
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

