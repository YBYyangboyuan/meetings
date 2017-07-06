function operateFormatter(value, row, index) {
    return [
        '<button type="button" class="details nooutline RoleOfC btn btn-default  btn-sm" data-toggle="modal" data-target="#myModal">查看详情</button>',

    ].join('');
}

$(function () {
    $('#bookstarttime').datetimepicker({
        format: 'YYYY/MM/DD',
        locale: 'zh-cn'

    });
    $('#bookendtime').datetimepicker({
        format: 'YYYY/MM/DD',
        locale: 'zh-cn',
        useCurrent: false,

    });
    $("#bookstarttime").on("dp.change", function (e) {
        $('#bookendtime').data("DateTimePicker").minDate(e.date);
    });
    $("#bookendtime").on("dp.change", function (e) {
        $('#bookstarttime').data("DateTimePicker").maxDate(e.date);
    });
});


$(function () {
    $('#starttime').datetimepicker({
        format: 'YYYY/MM/DD',
        locale: 'zh-cn'

    });
    $('#endtime').datetimepicker({
        format: 'YYYY/MM/DD',
        locale: 'zh-cn',
        useCurrent: false,
    });
    $("#starttime").on("dp.change", function (e) {
        $('#endtime').data("DateTimePicker").minDate(e.date);
    });
    $("#endtime").on("dp.change", function (e) {
        $('#starttime').data("DateTimePicker").maxDate(e.date);
    });
});



$(document).ready(function () {

    //请求会议
    $.ajax({
        type: "POST",
        url: "jsp/SearchMeeting.jsp",
        cache: false,
        timeout:3000,
        complete: function () {
            if(status=='timeout'){
                alert("超时");
            }
        },
        dataType: 'json',
        data: {
            fun: 1,
            nownumber: $('#meetingnum').val(),
        },
        success: function (data) {
            $('#meetingroonname').empty();
            $('#meetingroonname').append("<option value=" + "-1" + ">" + "所有会议室" + "</option>");
            $.each(data, function (i) {
                $('#meetingroonname').append("<option value=" + data[i].meetingRoomId + ">" + data[i].meetingRoomName + "</option>");
            });
            $('#meetingroonname').selectpicker('refresh');
        },
        error: function () {
            swal("糟糕了", "服务器好像休息了", "error");

        }

    });
    //请求人员
    $.ajax({
        type: "POST",
        url: "jsp/SearchMeeting.jsp",
        cache: false,
        timeout:3000,
        complete: function () {
            if(status=='timeout'){
                alert("超时");
            }
        },
        data: {
            fun: 0,
        },
        dataType: 'json',
        success: function (data) {
            $('#staff').empty();
            $('#staff').append("<option value=" + "-1" + ">" + "所有员工" + "</option>");
            $.each(data, function (i) {
                $('#staff').append("<option value=" + data[i].username + ">" + data[i].name + "</option>");
            });
            $('#staff').selectpicker('refresh');
        },
        error: function () {
            swal("糟糕了", "服务器好像休息了", "error");

        }

    });

    $('#searchmeet').click(function () {
        $.ajax(
            {
                type: "post",
                url: "jsp/SearchMeeting.jsp",
                timeout:3000,
                complete: function () {
                    if(status=='timeout'){
                        alert("超时");
                    }
                },
                data: {
                    fun: 2,//查询数据
                    meetingname: $('#meetingname').val(),
                    meetingroonname: $('#meetingroonname').val(),
                    staff: $('#staff').val(),
                    bookstarttime: $('#bookstarttime').val(),
                    bookendtime: $('#bookendtime').val(),
                    starttime: $('#starttime').val(),
                    endtime: $('#endtime').val(),

                },
                dataType: 'json',
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    swal("糟糕了", "服务器好像休息了", "error");


                },
                success: function (data) {
                    $('#tableReserve').bootstrapTable('load', data);
                    $("#collapse").collapse({
                            toggle: true
                        }
                    );
                }
            }
        );

    });//查询会议

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