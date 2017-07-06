var concelid;

function mysubmit() {

    return false;

}
function operateFormatter(value, row, index) {
    return [
        '<button type="button" class="details nooutline RoleOfC btn btn-default  btn-sm" data-toggle="modal" data-target="#myModal">查看/撤销</button>',

    ].join('');
}

$(document).ready(function () {
    $('#concelbtn').click(function () {

        var bootstrapValidator = $('#defaultForm').data('bootstrapValidator');
        bootstrapValidator.validate();
        if (bootstrapValidator.isValid()) {
            swal({
                    title: "确定撤销会议吗",
                    text: "撤销会议将不可恢复，请谨慎",
                    type: "warning",
                    showCancelButton: true,
                    confirmButtonColor: "#DD6B55",
                    confirmButtonText: "是的，撤销会议!",
                    closeOnConfirm: false,
                    cancelButtonText: "取消",
                },
                function () {
                    alert(2);
                    $.ajax({//未来七天我要参加的会议
                        type: "POST",
                        url: "jsp/MyResver.jsp",
                        timeout:3000,
                        complete: function () {
                            if(status=='timeout'){
                                alert("超时");
                            }
                        },
                        cache: false,
                        data: {
                            fun: 1,
                            cancelnotes:$('#concel_modal').val(),
                            meetingid:concelid,
                        },//取消会议
                        //dataType: 'json',
                        success: function (data) {
                            // $('#tableResver').bootstrapTable('load', data);
                            swal({
                                    title: "撤销成功",
                                    type: "success",
                                    confirmButtonText: '好的',
                                    closeOnCancel: true,
                                },
                                function(){
                                    location.reload(true);
                                });
                        },
                        error: function (XMLHttpRequest, textStatus, errorThrown) {
                            swal("糟糕了", "服务器好像休息了", "error");
                        }
                    });

                });

        }

    });

    $('#defaultForm').bootstrapValidator({
        message: 'This value is not valid',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            concel_modal: {
                validators: {
                    notEmpty: {
                        message: '撤销理由不能为空'
                    },
                    stringLength: {
                        min: 5,
                        max: 200,
                        message: '请输入5-200个字符'
                    },
                }
            },
        }
    });


    $(function () {
        $.ajax({//未来七天我要参加的会议
            type: "POST",
            url: "jsp/MyResver.jsp",
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
        concelid=row.meetingId;
        if(row.status=="已取消"){
            $('#concelbtn').disabled();
            $('#concelbtn').attr('disabled',"true");
        }

    }
};

