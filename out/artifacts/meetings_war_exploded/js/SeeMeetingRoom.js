var id;
$(function () {
    $.ajax({
        type: "POST",
        url: "jsp/SeeMeetingRoom.jsp",
        timeout:3000,
        complete: function () {
            if(status=='timeout'){
                alert("超时");
            }
        },
        cache: false,
        data: {fun: 2},
        dataType: 'json',
        success: function (data) {
            if(data.level!="2"){
                $('#modify').hide();
                $('#remark_modal').attr("disabled",true);
                $('#state_modal').attr("disabled",true);

            }
        },
        error: function () {
            swal("糟糕了", "服务器好像休息了", "error");

        }
    })
});
$(function () {
    $.ajax({
        type: "POST",
        url: "jsp/SeeMeetingRoom.jsp",
        timeout:3000,
        complete: function () {
            if(status=='timeout'){
                alert("超时");
            }
        },
        cache: false,
        data: {fun: 0},
        dataType: 'json',
        success: function (data) {
            $('#table').bootstrapTable('load', data);
        },
        error: function () {
            swal("糟糕了", "服务器好像休息了", "error");

        }
    })
});

function mysubmit() {
    var bootstrapValidator = $('#defaultForm').data('bootstrapValidator');
    bootstrapValidator.validate();
    if (bootstrapValidator.isValid()) {
        $.ajax(
            {
                timeout:3000,
                complete: function () {
                    if(status=='timeout'){
                        alert("超时");
                    }
                },
                type: "post",
                url: "jsp/SeeMeetingRoom.jsp",
                data: {
                    fun: 1,
                    roomnumber: $("#roomnumber_modal").val(),
                    meetingroomname: $("#meetingroomname_modal").val(),
                    capacity: $("#capacity_modal").val(),
                    remark: $("#remark_modal").val(),
                    state: $("#state_modal").val(),
                    meetingRoomId: id
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    swal("糟糕了", "服务器好像休息了", "error");

                },
                success: function () {
                    swal({
                            title: "修改成功",
                            type: "success",
                            confirmButtonText: '好的',
                            closeOnCancel: true,
                        },
                        function(){
                            location.reload(true);
                        });

                }
            }
        );
    }
    else {
        alert("不成功");

        return false;

    }
}


$(document).ready(function () {
    $('#defaultForm').bootstrapValidator({
        message: 'This value is not valid',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            remark_modal: {
                validators: {
                    stringLength: {
                        max: 200,
                        message: '请输入不超过200字符'
                    }
                }
            },
        }
    });
});


window.operateEvent = {

    'click .details': function (e, value, row, index) {
        $('#roomnumber_modal').val(row.roomNumbler);
        $('#meetingroomname_modal').val(row.meetingRoomName);
        $('#capacity_modal').val(row.capacity);
        $('#remark_modal').val(row.remark);
        $('#state_modal').val(row.currentAtate);
        $('#state_modal').selectpicker('refresh');
        id = row.meetingRoomId;

    }
};

