window.operateEvent = {
    'click .passit': function (e, value, row, index) {

        $.ajax({
            type: "POST",
            url: "jsp/GetPassData.jsp",
            timeout:3000,
            complete: function () {
                if(status=='timeout'){
                    alert("超时");
                }
            },
            cache: false,
            data: {fun: 1, staffId: row.staffId},
            dataType: 'json',
            success: function (data) {
                swal({
                        title: "审批通过",
                        type: "success",
                        confirmButtonText: '好的',
                        closeOnCancel: true,
                    },
                    function(){
                        location.reload(true);
                    });
            },
            error: function () {
                swal("糟糕了", "服务器好像休息了", "error");

            }

        })
        $('#table').bootstrapTable('remove', {
            field: 'staffId',
            values: [row.staffId]
        });
    },
    'click .deleteit': function (e, value, row, index) {
        swal({
                title: "确定拒绝审批吗",
                text: "拒绝审批的账户需要联系管理员",
                type: "warning",
                showCancelButton: true,
                confirmButtonColor: "#DD6B55",
                confirmButtonText: "是的，拒绝审批!",
                closeOnConfirm: false,
                cancelButtonText: "取消",
            },
            function () {
                $.ajax({
                    type: "POST",
                    url: "jsp/GetPassData.jsp",
                    cache: false,
                    timeout:3000,
                    complete: function () {
                        if(status=='timeout'){
                            alert("超时");
                        }
                    },
                    data: {fun: 2, staffId: row.staffId},
                    dataType: 'json',
                    success: function (data) {
                        swal({
                                title: "拒绝成功",
                                type: "success",
                                confirmButtonText: '好的',
                                closeOnCancel: true,
                            },
                            function(){
                                location.reload(true);
                            });
                    },
                    error: function () {
                        swal("糟糕了", "服务器好像休息了", "error");

                    }

                })
            });
    }
};
$(function () {

    $.ajax({
        type: "POST",
        url: "jsp/GetPassData.jsp",
        cache: false,
        timeout:3000,
        complete: function () {
            if(status=='timeout'){
                alert("超时");
            }
        },
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
