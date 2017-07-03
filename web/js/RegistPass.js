
window.operateEvent={
    'click .passit' : function (e,value,row,index) {
        $.ajax({
            type: "POST",
            url: "jsp/GetPassData.jsp",
            cache: false,
            data: {fun:1,staffId:row.staffId},
            dataType: 'json',
            success: function (data) {
                alert("审批通过")
            },
            error: function () {
                alert("error");

            }

        })
        $('#table').bootstrapTable('remove', {
            field: 'staffId',
            values: [row.staffId]
        });
    },
    'click .deleteit' : function (e,value,row,index) {
        $.ajax({
            type: "POST",
            url: "jsp/GetPassData.jsp",
            cache: false,
            data: {fun:2,staffId:row.staffId},
            dataType: 'json',
            success: function (data) {
                alert("删除成功")
            },
            error: function () {
                alert("error");

            }

        })
        $('#table').bootstrapTable('remove', {
            field: 'staffId',
            values: [row.staffId]
        });
    }
};
$(function () {
    $.ajax({
        type: "POST",
        url: "jsp/GetPassData.jsp",
        cache: false,
        data: {fun:0},
        dataType: 'json',
        success: function (data) {
            $('#table').bootstrapTable('load', data);
        },
        error: function () {
            alert("error");
        }

    })
});
