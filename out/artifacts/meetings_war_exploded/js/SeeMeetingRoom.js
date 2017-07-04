var id;
$(function () {
    $.ajax({
        type: "POST",
        url: "jsp/SeeMeetingRoom.jsp",
        cache: false,
        data: {fun: 0},
        dataType: 'json',
        success: function (data) {
            $('#table').bootstrapTable('load', data);

        },
        error: function () {
            alert("error");
        }

    })
});

function mysubmit() {
        $.ajax(
            {
                type: "post",
                url: "jsp/SeeMeetingRoom.jsp",
                data: {
                    fun:1,
                    roomnumber: $("#roomnumber_modal").val(),
                    meetingroomname: $("#meetingroomname_modal").val(),
                    capacity: $("#capacity_modal").val(),
                    remark: $("#remark_modal").val(),
                    state: $("#state_modal").val(),
                    meetingRoomId :id
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    alert("error!");
                    alert(textStatus);
                    alert(errorThrown);

                },
                success: function () {
                    alert("注册成功");
                    location.reload(true);

                }
            }
        );

    return false;

}




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
                notEmpty: {
                    message: '备注不能为空'
                },
                regexp: {
                    regexp: /^[\x21-\x7e\u4e00-\u9fa5a-zA-Z0-9\.]+$/,
                    message: '请勿使用特殊字符'
                },
                stringLength: {
                    min: 5,
                    max: 200,
                    message: '最少输入5个字符'
                },

            }
        },
    }
});

$(document).ready(function () {

});

window.operateEvent = {

    'click .details': function (e, value, row, index) {
        $('#roomnumber_modal').val(row.roomNumbler);
        $('#meetingroomname_modal').val(row.meetingRoomName);
        $('#capacity_modal').val(row.capacity);
        $('#remark_modal').val(row.remark);
        $('#state_modal').val(row.currentAtate);
        $('#state_modal').selectpicker('refresh');
        id=row.meetingRoomId;

    }
};

