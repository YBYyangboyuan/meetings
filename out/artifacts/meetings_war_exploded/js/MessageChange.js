var nametor;
var usernametor;
var staffidtor;
function myreset() {
    $("#defaultForm").data('bootstrapValidator').resetForm();
    $(function () {
        $.ajax({
            type: "POST",
            url: "jsp/ShowAllDepartment.jsp",
            cache: false,
            timeout:5000,
            complete: function () {
                if(status=='timeout'){
                    alert("超时");
                }
            },
            dataType: 'json',
            success: function (data) {
                getdata = data;
                $.each(data, function (i) {
                    $('#position').append("<option>" + data[i].departmentName + "</option>");
                });
                document.getElementById('departmentid').value = data[0].departmentId;
                $('#position').selectpicker('refresh');
                $.ajax({
                    type: "POST",
                    timeout:5000,
                    complete: function () {
                        if(status=='timeout'){
                            alert("超时");
                        }
                    },
                    url: "MessageChange.jsp",
                    cache: false,
                    data:{fun : 0,},
                    dataType: 'json',
                    success: function (data) {
                        pass=data.password;
                        nametor=data.name;
                        usernametor=data.username;
                        staffidtor=data.staffId;
                        $('#name').val(data.name);
                        $('#username').val(data.username);
                        $('#telephone').val(data.telephone);
                        $('#email').val(data.email);
                        $('#position').val("张徐日部");
                        $('#position').selectpicker('refresh');

                    },
                    error: function () {
                        alert("error");

                    }

                })


            },
            error: function () {
                alert("error");

            }

        });
    });

}


function mysubmit() {
    var bootstrapValidator = $('#defaultForm').data('bootstrapValidator');
    bootstrapValidator.validate();
    if (bootstrapValidator.isValid()) {
        //表单提交的方法、比如ajax提交
        $.ajax(
            {
                type: "post",
                url: "MessageChange.jsp",
                timeout:3000,
                complete: function () {
                    if(status=='timeout'){
                        alert("超时");
                    }
                },
                data: {
                    fun:1,
                    staffid:staffidtor,
                    username: $("#username").val(),
                    password: hex_md5($("#password").val()),
                    name: $("#name").val(),
                    telephone: $("#telephone").val(),
                    email: $("#email").val(),
                    departmentid: $("#departmentid").val(),
                    position: $("#position").val()
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
    return false;

}


var getdata;
$(document).on("change", 'select#position', function () {
    var thischoice = $(this).val();
    $.each(getdata, function (i) {
        if (thischoice == getdata[i].departmentName) {
            document.getElementById('departmentid').value = getdata[i].departmentId;
        }
    })
});


$(document).ready(function () {
    var pass;
    $(function () {
        $.ajax({
            type: "POST",
            timeout:3000,
            complete: function () {
                if(status=='timeout'){
                    alert("超时");
                }
            },
            url: "jsp/ShowAllDepartment.jsp",
            cache: false,
            dataType: 'json',
            success: function (data) {
                getdata = data;
                $.each(data, function (i) {
                    $('#position').append("<option>" + data[i].departmentName + "</option>");
                });
                document.getElementById('departmentid').value = data[0].departmentId;
                $('#position').selectpicker('refresh');
                $.ajax({
                    type: "POST",
                    timeout:3000,
                    complete: function () {
                        if(status=='timeout'){
                            alert("超时");
                        }
                    },
                    url: "MessageChange.jsp",
                    cache: false,
                    data:{fun : 0,},
                    dataType: 'json',
                    success: function (data) {
                        pass=data.password;
                        nametor=data.name;
                        usernametor=data.username;
                        staffidtor=data.staffid;
                        $('#name').val(data.name);
                        $('#username').val(data.username);
                        $('#telephone').val(data.telephone);
                        $('#email').val(data.email);
                        $('#position').val("张徐日部");
                        $('#position').selectpicker('refresh');

                    },
                    error: function () {
                        swal("糟糕了", "服务器好像休息了", "error");

                    }

                })


            },
            error: function () {
                swal("糟糕了", "服务器好像休息了", "error");

            }

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
            name: {
                validators: {
                    notEmpty: {
                        message: '姓名不能为空'
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
            username: {
                trigger: 'blur',
                message: 'The username is not valid',
                validators: {
                    notEmpty: {
                        message: '账户名不能为空'
                    },
                    stringLength: {
                        min: 6,
                        max: 32,
                        message: '账号名长度在6-32之间'
                    },
                    regexp: {
                        regexp: /^[a-zA-Z0-9_\.]+$/,
                        message: '请勿使用特殊字符'
                    },

                    remote: {
                        url: 'jsp/checkUsername.jsp',
                        message: '账户名已存在',
                        data: function (validator) {
                            return {
                                username: $('#username').val()
                            };
                        },
                    },
                }
            },
            email: {
                validators: {
                    emailAddress: {
                        message: '请输入有效的邮箱地址'
                    }
                }
            },
            passwordold: {
                validators: {
                    notEmpty: {
                        message: '密码不能为空'
                    },
                    different: {
                        field: 'username',
                        message: '密码不能与用户名相同'
                    },
                    regexp: {
                        regexp: /^[a-zA-Z0-9_\.]+$/,
                        message: '请勿使用特殊字符'
                    },
                    stringLength: {
                        min: 6,
                        max: 32,
                        message: '请输入6-32个字符'
                    },
                    callback: {
                        message: '',
                        callback: function (value, validator, $field) {
                            if (value === '') {
                                return true;
                            }

                            // The password doesn't contain any uppercase character
                            if (value === value.toLowerCase()) {
                                return {
                                    valid: false,
                                    message: '必须包含大写字母'
                                }
                            }

                            // The password doesn't contain any uppercase character
                            if (value === value.toUpperCase()) {
                                return {
                                    valid: false,
                                    message: '必须包含小写字母'
                                }
                            }

                            // The password doesn't contain any digit
                            if (value.search(/[0-9]/) < 0) {
                                return {
                                    valid: false,
                                    message: '必须包含数字'
                                }
                            }
                            ////
                            //
                            //加上密码验证！！！！！！！！！！！！！！！！！！！！！
                            //
                            ////
                            if (hex_md5(value)!==(pass)){
                                return{
                                    valid:false,
                                    message:'密码错误'
                                }
                            }
                            return true;
                        }
                    }

                }
            },
            password: {
                validators: {
                    different: {
                        field: 'username',
                        message: '密码不能与用户名相同'
                    },
                    regexp: {
                        regexp: /^[a-zA-Z0-9_\.]+$/,
                        message: '请勿使用特殊字符'
                    },
                    stringLength: {
                        min: 6,
                        max: 32,
                        message: '请输入6-32个字符'
                    },
                    callback: {
                        message: '',
                        callback: function (value, validator, $field) {
                            if (value === '') {
                                return true;
                            }

                            // The password doesn't contain any uppercase character
                            if (value === value.toLowerCase()) {
                                return {
                                    valid: false,
                                    message: '必须包含大写字母'
                                }
                            }

                            // The password doesn't contain any uppercase character
                            if (value === value.toUpperCase()) {
                                return {
                                    valid: false,
                                    message: '必须包含小写字母'
                                }
                            }

                            // The password doesn't contain any digit
                            if (value.search(/[0-9]/) < 0) {
                                return {
                                    valid: false,
                                    message: '必须包含数字'
                                }
                            }

                            return true;
                        }
                    }

                }
            },

            confirmPassword: {
                validators: {
                    identical: {
                        field: 'password',
                        message: '密码不相同'
                    },
                }
            },
            age: {
                validators: {
                    notEmpty: {},
                    digits: {},
                    greaterThan: {
                        value: 18
                    },
                    lessThan: {
                        value: 100
                    }
                }
            },
            website: {
                validators: {
                    notEmpty: {},
                    uri: {}
                }
            },
            telephone: {
                validators: {
                    digits: {
                        message: "请输入11位整数"
                    },
                    stringLength: {
                        min: 11,
                        max: 11,
                        message: "请输入11位整数"

                    },
                }
            },
            gender: {
                validators: {
                    notEmpty: {}
                }
            },
            'languages[]': {
                validators: {
                    notEmpty: {}
                }
            },
            'programs[]': {
                validators: {
                    choice: {
                        min: 2,
                        max: 4
                    }
                }
            }
        }
    });
});

