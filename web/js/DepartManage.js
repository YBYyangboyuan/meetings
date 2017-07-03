$(document).ready(function () {

    $.ajax({
        type: "POST",
        url: "jsp/ShowAllDepartment.jsp",
        cache: false,
        dataType: 'json',
        success: function (data) {
            $('#table').bootstrapTable('load', data);
        },
        error: function () {
            alert("error");

        }

    })

});
window.operateEvent = {

    'click .details': function (e, value, row, index) {
        $('#departmentId_modal').val(row.departmentId);
        $('#departmentName_modal').val(row.departmentName);
        $('#departmentNum_modal').val(row.departmentNum);

        id=row.meetingRoomId;

    },
    'click .mydelete': function (e, value, row, index) {
        $.ajax(
            {
                type: "post",
                url: "jsp/DepartManage.jsp",
                data: {
                    fun:1,
                    departmentid: row.departmentId,
                    modifyname: row.departmentName,
                    departmentnum:row.departmentNum

                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    alert("error!");
                    alert(textStatus);
                    alert(errorThrown);

                },
                success: function (data) {
                    alert(data);
                    location.reload(true);

                }
            }
        );

    }

};
function mysubmit() {
    $.ajax(
        {
            type: "post",
            url: "jsp/DepartManage.jsp",
            data: {
                fun:0,
                departmentid: $("#departmentId_modal").val(),
                modifyname: $("#departmentName_modal").val(),
                departmentnum:$("#departmentNum_modal").val()

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
function mydelete() {
    $.ajax(
        {
            type: "post",
            url: "jsp/DepartManage.jsp",
            data: {
                fun:1,
                departmentid: $("#departmentId_modal").val(),
                modifyname: $("#departmentName_modal").val(),
                departmentnum:$("#departmentNum_modal").val()
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                alert("error!");
                alert(textStatus);
                alert(errorThrown);

            },
            success: function () {
                alert("删除成功");
                location.reload(true);

            }
        }
    );

    return false;

}
function myadd() {

    $.ajax(
        {
            type: "post",
            url: "jsp/DepartManage.jsp",
            data: {
                fun:3,
                departmentname: $("#txt_search_departmentname").val(),
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                alert("error!");
                alert(textStatus);
                alert(errorThrown);

            },
            success: function () {
                alert("增加成功");
                location.reload(true);

            }
        }
    );
    return false;
}

