function myreset() {
    $("#defaultForm").data('bootstrapValidator').resetForm();
}


function mysubmit() {
    var bootstrapValidator = $('#defaultForm').data('bootstrapValidator');
    bootstrapValidator.validate();
    if (bootstrapValidator.isValid()) {
        $("#submit").attr("disabled", true);
        //表单提交的方法、比如ajax提交
        $.ajax(
            {
                type: "post",
                url: "jsp/AddMeetingRoom.jsp",
                timeout:3000,
                data: {
                    type:"regist",
                    roomnumber: $("#roomnumber").val(),
                    meetingroomname: $("#meetingroomname").val(),
                    capacity: $("#capacity").val(),
                    remark: $("#remark").val(),
                    state: $("#state").val(),

                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    swal("糟糕了", "服务器好像休息了", "error");

                },
                success: function () {
                    swal({
                            title: "添加成功",
                            type: "success",
                            confirmButtonText: '好的',
                            closeOnCancel: true,
                        },
                        function(){
                            location.reload(true);
                        });
                },
                complete: function () {
                    if(status=='timeout'){
                        alert("超时");
                    }
                }
            }
        );
    }
    return false;

}


var getdata;
$(document).on("change", 'select#position', function () {
    var thischoice = $(this).val();
});


$(document).ready(function () {
    $('#defaultForm').bootstrapValidator({
        message: 'This value is not valid',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            roomnumber: {
                trigger:'blur',
                validators: {
                    notEmpty: {
                        message: '门牌号不能为空'
                    },
                    regexp: {
                        regexp: /^[0-9]+$/,
                        message: '请使用纯数字'
                    },
                    stringLength: {
                        min: 3,
                        max: 6,
                        message: '请输入3-6个数字'
                    },
                    remote: {
                        url: 'jsp/AddMeetingRoom.jsp',
                        message: '门牌号不能重复',
                        data:function (validator) {
                            return{
                                type:"roomnumber",
                                roomnumber:$('#roomnumber').val()
                            };
                        },
                    },

                }
            },
            meetingroomname: {
                trigger:'blur',
                validators: {
                    notEmpty: {
                        message: '会议室名不能为空'
                    },
                    stringLength: {
                        min: 4,
                        max: 16,
                        message: '会议室名长度在4-16之间'
                    },
                    regexp: {
                        regexp: /^[\x21-\x7e\u4e00-\u9fa5a-zA-Z0-9\.]+$/,
                        message: '请勿使用特殊字符'
                    },
                    //todoit
                    remote: {
                        url: 'jsp/AddMeetingRoom.jsp',
                        message: '会议室名已存在',
                        data:function (validator) {
                            return{
                                type:"meetingroomname",
                                meetingroomname:$('#meetingroomname').val()
                            };
                        },
                    },
                }
            },
            capacity: {
                validators: {
                    notEmpty: {
                        message: '容纳人数不能为空'
                    },
                    digits: {message: '请填写正整数'},
                    greaterThan: {
                        value: 2,
                        message: '会议室最少可容纳2人'
                    },
                    lessThan: {
                        value: 500,
                        message: '会议室最多可容纳500人'
                    }
                }
            },
            remark: {
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

