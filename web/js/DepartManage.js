var nowname;
var id = 0;
var depart;
$(document).ready(function () {
    alert(1);
    $.ajax({
        type: "POST",
        url: "jsp/ShowAllDepartment.jsp",
        cache: false,
        timeout: 3000,
        complete: function () {
            if (status == 'timeout') {
                alert("超时");
            }
        },
        dataType: 'json',
        success: function (data) {
            depart = data;
            $('#table').bootstrapTable('load', data);

        },
        error: function () {
            swal("糟糕了", "服务器好像休息了", "error");

        }

    });

    $('#tablemodel').bootstrapTable({
        //请求方法
        method: 'get',
        //是否显示行间隔色
        striped: true,
        //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
        cache: false,
        //是否显示分页（*）
        pagination: true,
        //是否启用排序
        sortable: false,
        showToggle: true,
        showColumns: true,

        showRefresh: true,
        //排序方式
        sortOrder: "asc",
        //初始化加载第一页，默认第一页
        //我设置了这一项，但是貌似没起作用，而且我这默认是0,- -
        //pageNumber:1,
        //每页的记录行数（*）
        pageSize: 7,
        //可供选择的每页的行数（*）
        //这个接口需要处理bootstrap table传递的固定参数,并返回特定格式的json数据
        url: "jsp/SearchPersonnel.jsp",
        //默认值为 'limit',传给服务端的参数为：limit, offset, search, sort, order Else
        //queryParamsType:'',
        ////查询参数,每次调用是会带上这个参数，可自定义
        queryParams: function (params) {
            return {
                pageNumber: params.offset / params.limit + 1,
                pageSize: params.limit,
                fun: 2,
                departmentid: id,
            };
        },
        //分页方式：client客户端分页，server服务端分页（*）
        sidePagination: "client",
        //是否显示搜索
        search: true,
        //Enable the strict search.
        strictSearch: true,
        //Indicate which field is an identity field.
        idField: "staffId",
        columns: [{
            field: 'name',
            title: '姓名',
            align: 'center'
        }, {
            field: 'telephone',
            title: '联系电话',
            align: 'center'
        }, {
            field: 'email',
            title: '电子邮箱',
            align: 'center'
        }, {
            field: 'position',
            title: '所属部门',
            visible: false,
            align: 'center'
        }, {
            field: 'staffId',
            title: 'id',
            align: 'center',
            visible: false
        }, {
            field: 'state',
            title: 'state',
            align: 'center',
            visible: false
        }, {
            field: 'oper',
            title: '所属部门',
            align: 'center',
            formatter: function (value, row, index) {
                //通过formatter可以自定义列显示的内容
                //value：当前field的值，即id
                //row：当前行的数据
                var myst = '<select id="my' + index + '"class="col-lg-12 selectpicker show-menu-arrow" id="state_modal" name="state_modal" data-width="70%">';

                $.each(depart, function (i) {
                    if (depart[i].departmentId==id) {
                        myst = myst + '<option selected = "selected" value="' + depart[i].departmentId + '">' + depart[i].departmentName + '</option>';
                    }
                    else {
                        myst = myst + '<option value="' + depart[i].departmentId + '">' + depart[i].departmentName + '</option>';
                    }
                });

                myst = myst + '</select>';

                return [
                    myst
                ].join('');
                // var a = '<a href="" >测试</a>';
            },
            events: operateEvent,
        }],
        pagination: true
    });


    $('#defaultForm').bootstrapValidator({
        message: 'This value is not valid',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            departmentName_modal: {
                validators: {
                    regexp: {
                        regexp: /^[\x21-\x7e\u4e00-\u9fa5a-zA-Z0-9\.））}]+$/,
                        message: '请勿使用特殊字符'
                    },
                    notEmpty: {
                        message: '部门名称不能为空'
                    },
                    stringLength: {
                        max: 20,
                        message: '请输入不超过20字符'
                    },
                    remote: {
                        url: 'jsp/DepartManage.jsp',
                        message: '部门名称不能重复',
                        data: function (validator) {
                            return {
                                fun: 4,
                                departmentName: $('#departmentName').val()
                            };
                        },
                    },
                }
            },
        }
    });
    $('#defaultForm1').bootstrapValidator({
        message: 'This value is not valid',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            departmentName: {
                validators: {
                    notEmpty: {
                        message: '部门名称不能为空'
                    },
                    regexp: {
                        regexp: /^[\x21-\x7e\u4e00-\u9fa5a-zA-Z0-9\.））}]+$/,
                        message: '请勿使用特殊字符'
                    },
                    stringLength: {
                        max: 20,
                        message: '请输入不超过20字符'
                    },
                    remote: {
                        url: 'jsp/DepartManage.jsp',
                        message: '部门名称不能重复',
                        data: function (validator) {
                            return {
                                fun: 4,
                                departmentName: $('#departmentName').val()
                            };
                        },
                    },
                }
            },
        }
    });

    $.ajax({
        type: "POST",
        url: "jsp/ShowAllDepartment.jsp",
        cache: false,
        timeout: 3000,
        complete: function () {
            if (status == 'timeout') {
                alert("超时");
            }
        },
        dataType: 'json',
        success: function (data) {
            $('#table').bootstrapTable('load', data);
        },
        error: function () {
            swal("糟糕了", "服务器好像休息了", "error");

        }

    })

});
window.operateEvent = {

    'click .details': function (e, value, row, index) {
        $('#departmentId_modal').val(row.departmentId);
        $('#departmentName_modal').val(row.departmentName);
        $('#departmentNum_modal').val(row.departmentNum);

        id = row.departmentId;
        nowname = row.departmentName;
        $('#tablemodel').bootstrapTable('refresh');


    },
    'click .mydelete': function (e, value, row, index) {
        swal({
                title: "确定删除部门吗",
                text: "请确保该部门下的人员已经疏散",
                type: "warning",
                showCancelButton: true,
                confirmButtonColor: "#DD6B55",
                confirmButtonText: "是的，删除它!",
                closeOnConfirm: false,
                cancelButtonText: "取消",
            },
            function () {
                $.ajax(
                    {
                        type: "post",
                        url: "jsp/DepartManage.jsp",
                        timeout: 3000,
                        complete: function () {
                            if (status == 'timeout') {
                                swal("糟糕了", "服务器好像休息了", "error");
                            }
                        },
                        data: {
                            fun: 1,
                            departmentid: row.departmentId,
                            modifyname: row.departmentName,
                            departmentnum: row.departmentNum

                        },
                        dataType: 'json',
                        error: function (XMLHttpRequest, textStatus, errorThrown) {
                            swal("糟糕了", "服务器好像休息了", "error");


                        },
                        success: function (data) {
                            if (data.data == ("删除成功")) {
                                swal({
                                        title: "删除成功",
                                        type: "success",
                                        confirmButtonText: '好的',
                                        closeOnCancel: true,
                                    },
                                    function () {
                                        location.reload(true);
                                    });
                            }
                            else {
                                swal({
                                        title: "删除失败",
                                        type: "error",
                                        confirmButtonText: '好的',
                                        closeOnCancel: true,
                                    },
                                    function () {
                                        location.reload(true);
                                    });
                            }


                        }

                    }
                );

            });


    }

};

function mysubmit() {
    if ($("#departmentName_modal").val() != nowname) {
        $.ajax(
            {
                type: "post",
                url: "jsp/DepartManage.jsp",
                timeout: 1000,
                complete: function () {
                    if (status == 'timeout') {
                        swal("糟糕了", "服务器好像休息了", "error");
                    }
                },
                data: {
                    fun: 0,
                    departmentid: $("#departmentId_modal").val(),
                    modifyname: $("#departmentName_modal").val(),
                    departmentnum: $("#departmentNum_modal").val()

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
                        function () {
                            location.reload(true);
                        });

                }
            }
        );
    }
    else {
        var alldata = $('#tablemodel').bootstrapTable('getData');
        var postdata1 = [];
        var postdata2 = [];
        $.each(alldata, function (i) {
            postdata1.push(alldata[i].staffId);
            postdata2.push($('#my' + i).val());
        });
        var postdata = "{ \"staffid\": [" + postdata1 + "]," + "\"departmentid\": [" + postdata2 + "]}";

        $.ajax(
            {
                type: "post",
                url: "jsp/DepartManage.jsp",
                timeout: 3000,
                complete: function () {
                    if (status == 'timeout') {
                        swal("糟糕了", "服务器好像休息了", "error");
                    }
                },
                data: {
                    fun:5,
                    datas: postdata,

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
                        function () {
                            location.reload(true);
                        });

                }
            }
        );
        swal({
                title: "修改成功",
                type: "success",
                confirmButtonText: '好的',
                closeOnCancel: true,
            },
            function () {
                location.reload(true);
            });
    }

    return false;

}


function myadd() {

    var bootstrapValidator = $('#defaultForm1').data('bootstrapValidator');
    bootstrapValidator.validate();
    if (bootstrapValidator.isValid()) {
        $.ajax(
            {
                type: "post",
                url: "jsp/DepartManage.jsp",
                timeout: 3000,
                complete: function () {
                    if (status == 'timeout') {
                        swal("糟糕了", "服务器好像休息了", "error");
                    }
                },
                data: {
                    fun: 3,
                    departmentname: $("#departmentName").val(),
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    swal("糟糕了", "服务器好像休息了", "error");


                },
                success: function () {
                    swal({
                            title: "添加成功",
                            type: "success",
                            confirmButtonText: '好的',
                            closeOnCancel: true
                        },
                        function () {
                            location.reload(true);
                        });

                }
            }
        );
    }
    return false;
}

function myreset() {
    $("#defaultForm1").data('bootstrapValidator').resetForm();
}

