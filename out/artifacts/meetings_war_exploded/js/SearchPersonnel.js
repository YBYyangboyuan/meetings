$(document).ready(function () {

    $('#table').bootstrapTable({

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
        pageSize: 5,
        //可供选择的每页的行数（*）
        //这个接口需要处理bootstrap table传递的固定参数,并返回特定格式的json数据
        url: "jsp/SearchPersonnel.jsp",
        //默认值为 'limit',传给服务端的参数为：limit, offset, search, sort, order Else
        //queryParamsType:'',
        ////查询参数,每次调用是会带上这个参数，可自定义
        queryParams: function (params) {
            var subcompany = $('#subcompany option:selected').val();
            var name = encodeURI($('#name').val());
            return {
                pageNumber: params.offset / params.limit + 1,
                pageSize: params.limit,
                companyId: subcompany,
                fun: 0,
                name: name,
                state: $("input:radio:checked").val(),
                username: $("#username").val(),
            };
        },
        //分页方式：client客户端分页，server服务端分页（*）
        sidePagination: "server",
        //是否显示搜索
        search: false,
        //Enable the strict search.
        strictSearch: true,
        //Indicate which field is an identity field.
        idField: "staffId",
        columns: [{
            field: 'name',
            title: '姓名',
            align: 'center'
        }, {
            field: 'username',
            title: '账号名',
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
        },
            {
                field: 'op',
                title: '操作',
                align: 'center',
                formatter: function (value, row, index) {
                    //通过formatter可以自定义列显示的内容
                    //value：当前field的值，即id
                    //row：当前行的数据
                    if (row.state == 0) {
                        return [
                            '<button  type="button" class="change nooutline btn btn-default  btn-sm" ">关闭账号</button>',
                        ].join('');
                    }
                    else {
                        return [
                            '<button  type="button" class="change otherstyle nooutline btn btn-default  btn-sm" ">恢复账号</button>',
                        ].join('');
                    }
                    // var a = '<a href="" >测试</a>';
                },
               events:operateEvent,
            }],
        pagination: true
    });

    $('#searchpe').click(function () {
        $.ajax(
            {
                type: "post",
                url: "jsp/SearchPersonnel.jsp",
                timeout: 3000,
                complete: function () {
                    if (status == 'timeout') {
                        alert("超时");
                    }
                },
                data: {
                    fun: 0,//查询数据
                    name: $("#name").val(),
                    state: $("input:radio:checked").val(),
                    username: $("#username").val(),
                },
                dataType: 'json',
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    swal("糟糕了", "服务器好像休息了", "error");

                },
                success: function (data) {
                    if ($("#name").val() == "" && $("#username").val() == "") {
                        if ($("input:radio:checked").val()!="all")
                            $('#table').bootstrapTable('load', data);

                    }
                    else
                        $('#table').bootstrapTable('load', data);
                    $('#table').bootstrapTable('refresh');
                    $('.collapse').collapse();
                }
            }
        );

    });

});

window.operateEvent = {
    'click .change': function (e, value, row, index) {
        swal({
                title: "确定更改账号状态吗",
                text: "账号将在关闭和恢复状态切换",
                type: "warning",
                showCancelButton: true,
                confirmButtonColor: "#DD6B55",
                confirmButtonText: "是的，更改状态!",
                closeOnConfirm: false,
                cancelButtonText: "取消",
            },
            function () {
                $.ajax({
                    type: "POST",
                    url: "jsp/SearchPersonnel.jsp",
                    timeout: 3000,
                    complete: function () {
                        if (status == 'timeout') {
                            alert("超时");
                        }
                    },
                    cache: false,
                    data: {fun: 1, staffId: row.staffId},//关闭账号
                    success: function (data) {

                        swal({
                                title: "更改成功",
                                type: "success",
                                confirmButtonText: '好的',
                                closeOnCancel: true,
                            },
                            function () {
                                $('#table').bootstrapTable('refresh');

                            });
                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        swal("糟糕了", "服务器好像休息了", "error");


                    },

                })

            });
    },
};

// {
//     field: "DeptId",
//         title: "部门",
//     editable: {
//     type: 'select',
//         title: '部门',
//         source: function () {
//         var result = [];
//         $.ajax({
//             url: '/Editable/GetDepartments',
//             async: false,
//             type: "get",
//             data: {},
//             success: function (data, status) {
//                 $.each(data, function (key, value) {
//                     result.push({ value: value.ID, text: value.Name });
//                 });
//             }
//         });
//         return result;
//     }
// }
// }


// function operateFormatter(value, row, index) {
//     if (row.state == 0) {
//         return [
//             '<button  type="button" class="change nooutline btn btn-default  btn-sm" ">关闭账号</button>',
//         ].join('');
//     }
//     else {
//         return [
//             '<button  type="button" class="change otherstyle nooutline btn btn-default  btn-sm" ">恢复账号</button>',
//         ].join('');
//     }
//
// }