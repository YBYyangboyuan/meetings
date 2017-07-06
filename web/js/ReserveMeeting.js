var mybookname;
function myblur() {
        if($("#datetimepicker1").val()!=""&&$("#datetimepicker2").val()!=""&&$("#meetingnum").val()!=""){
            //请求可用会议室
            $.ajax({
                type: "POST",
                url: "jsp/ShowAllMeetingRoom.jsp",
                cache: false,
                dataType: 'json',
                timeout:3000,
                complete: function () {
                    if(status=='timeout'){
                        alert("超时");
                    }
                },
                data:{
                    fun:0,
                    starttime:$('#datetimepicker1').val(),
                    endtime:$('#datetimepicker2').val(),
                    nownumber:$('#meetingnum').val(),
                },
                success: function (data) {
                    $('#meetingroonnames').empty();
                    $.each(data, function (i) {
                        $('#meetingroonnames').append("<option value=" + data[i].meetingRoomId + ">" + data[i].meetingRoomName + "</option>");
                    });
                    $('#meetingroonnames').selectpicker('refresh');
                },
                error: function () {
                    swal("糟糕了", "服务器好像休息了", "error");

                }

            });
            //请求人员
            $.ajax({
                type: "POST",
                timeout:3000,
                complete: function () {
                    if(status=='timeout'){
                        alert("超时");
                    }
                },
                url: "jsp/ReserveMeeting.jsp",
                cache: false,
                data:{
                    fun:0,
                    starttime:$('#datetimepicker1').val(),
                    endtime:$('#datetimepicker2').val(),
                },
                dataType: 'json',
                success: function (data) {
                    $('#staff').empty();
                    $.each(data, function (i) {
                        {/*<optgroup label="Condiments">*/
                        }
                        var myid = data[i].department.departmentName;
                        $('#staff').append("<optgroup id=" + myid + " label=" + data[i].department.departmentName + ">");

                        $.each(data[i].stafflist, function (j) {

                            $('#' + myid).append("<option value=" + data[i].stafflist[j].staffId + ">" + data[i].stafflist[j].name + "</option>");
                        });
                    });
                    $('#staff').selectpicker('refresh');
                },
                error: function () {
                    swal("糟糕了", "服务器好像休息了", "error");

                }

            })

        }

}
$(document).ready(function () {
    $.ajax({
        type: "POST",
        url: "jsp/ReserveMeeting.jsp",
        cache: false,
        dataType: 'json',
        timeout:3000,
        complete: function () {
            if(status=='timeout'){
                alert("超时");
            }
        },
        data:{
            fun:2,
        },
        success: function (data) {
            mybookname=data.bookname;
        },
        error: function () {
            swal("糟糕了", "服务器好像休息了", "error");

        }

    });

    $(function () {

    });
    $(function () {
        $('#datetimepicker1').datetimepicker({
            format: 'YYYY/MM/DD HH:mm:ss',
            locale: 'zh-cn',
            minDate: new Date(),
        });
        $('#datetimepicker2').datetimepicker({
            format: 'YYYY/MM/DD HH:mm:ss',
            locale: 'zh-cn',
            minDate: new Date(),
            useCurrent: false //Important! See issue #1075
        });
        $("#datetimepicker1").on("dp.change", function (e) {
            $('#datetimepicker2').data("DateTimePicker").minDate(e.date);
        });
        $("#datetimepicker2").on("dp.change", function (e) {
            $('#datetimepicker1').data("DateTimePicker").maxDate(e.date);
        });
    });
    $('#defaultForm').bootstrapValidator({
        message: 'This value is not valid',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },

        fields: {
            meetingname: {
                validators: {
                    notEmpty: {
                        message: '会议室名称不能为空',
                    },
                    regexp: {
                        regexp: /^[\u4e00-\u9fa5a-zA-Z0-9\.]+$/,
                        message: '请勿使用特殊字符'
                    },
                    stringLength: {
                        min: 2,
                        max: 32,
                        message: '请输入2-32个字符'
                    }

                }
            },

            meetingnum: {
                validators: {
                    notEmpty: {
                        message: '预计参加人数不能为空'
                    },
                    digits: {message: '请填写正整数'},
                    greaterThan: {
                        value:2,
                        message: '预计参加人数不少于2人'
                    },
                    lessThan: {
                        value: 500,
                        message: '预计参加人数不大于500人'
                    }
                }
            },
            meetingroonnames: {
                validators: {
                    notEmpty: {
                        message: '会议室不能为空'
                    },
                }
            },

            starttime: {
                validators: {
                    notEmpty: {
                        message: '会议开始时间不能为空'
                    },
                }
            },
            endtime: {
                validators: {
                    notEmpty: {
                        message: '会议结束时间不能为空'
                    },
                }
            },
            meetingnotes: {
                validators: {
                    stringLength: {
                        max: 200,
                        message: '请输入不超过200字符'
                    }
                }
            },
            staff: {
                validators: {
                    notEmpty: {
                        message: '参会人员不能为空'
                    },
                }
            },
        }
    });
    $('.mysubmit').click(function () {
        var bootstrapValidator = $('#defaultForm').data('bootstrapValidator');
        bootstrapValidator.validate();
        if (bootstrapValidator.isValid()) {
            $(".mysubmit").attr("disabled", true);
            var myid = JSON.stringify($('#staff').val());
            $.ajax(
                {
                    type: "post",
                    url: "jsp/ReserveMeeting.jsp",
                    timeout:3000,
                    complete: function () {
                        if(status=='timeout'){
                            alert("超时");
                        }
                    },
                    data: {
                        fun: 1,
                        bookname: mybookname,
                        meetingname: $("#meetingname").val(),
                        meetingnotes: $("#meetingnotes").val(),
                        meetingnum: $("#meetingnum").val(),
                        meetingroomid: $("#meetingroonnames").val(),
                        starttime: $("#datetimepicker1").val(),
                        endtime: $("#datetimepicker2").val(),
                        staffid: myid,
                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        swal("糟糕了", "服务器好像休息了", "error");


                    },
                    success: function (data) {
                        swal({
                                title: "预订成功",
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
    });

    $('.myreset').click(function () {
        $("#defaultForm").data('bootstrapValidator').resetForm();
        $('#staff').val('');
        $('#staff').selectpicker('val', '还没有选择');   //重置bootstrap-select显示  5
        $('#staff').find("option").attr("selected", false);                    //重置原生select的值  6
    });
    $('#staff').on('change', function () {
        $('#meetingnum').val($('#staff').val().length);
    });

});

