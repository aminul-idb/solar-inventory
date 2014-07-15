<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="inventory"/>
    <title>Create Category</title>

</head>
<body>
<g:render template="catName"/>

<div class="row">
    <div class="col-sm-12">
        <section class="panel">
            <header class="panel-heading">
                Category List
                <span class="tools pull-right">
                    <div class="btn-group">
                        <button id="add-new-btn" class="btn btn-primary">
                            Add New&nbsp;<i class="fa fa-plus"></i>
                        </button>
                    </div>
                </span>
            </header>
            <div class="panel-body">
                <div class="table-responsive">
                    <table class="table table-striped table-hover table-bordered" id="list-table">
                        <thead>
                        <tr>
                            <th>Serial</th>
                            <th>Name</th>
                            <th>Description</th>
                            <th>Action</th>
                        </tr>
                        </thead>
                        <tbody>
                        <g:each in="${dataReturn}" var="catName">
                            <tr>
                                <td>${catName[0]}</td>
                                <td>${catName[1]}</td>
                                <td>${catName[2]}</td>
                                <td>
                                    <sec:access controller="catName" action="edit">
                                        <span class="col-xs-6"><a href="" referenceId="${catName.DT_RowId}" class="edit-reference" title="Edit"><span class="green fa fa-edit"></span>&nbsp;Edit&nbsp;</a></span>
                                    </sec:access>
                                    <sec:access controller="catName" action="delete">
                                        <span class="col-xs-6"><a href="" referenceId="${catName.DT_RowId}" class="delete-reference" title="Delete"><span class="green fa fa-cut"></span>&nbsp;Delete&nbsp;</a></span>
                                    </sec:access>
                                </td>
                            </tr>
                        </g:each>

                        </tbody>
                    </table>
                </div>
            </div>
        </section>
    </div>
</div>
<!-- page end-->

<script>

    jQuery(function ($) {
        var oTable1 = $('#list-table').dataTable({
// "sDom": "<'row'<'col-md-4'><'col-md-4'><'col-md-4'f>r>t<'row'<'col-md-4'l><'col-md-4'i><'col-md-4'p>>",
// "bProcessing": true,
            "bAutoWidth": true,
            "bServerSide": true,
            "deferLoading": ${totalCount},
            "sAjaxSource": "${g.createLink(controller: 'catName',action: 'list')}",
            "fnRowCallback": function (nRow, aData, iDisplayIndex) {
                if(aData.DT_RowId ==undefined){
                    return true;
                }
                $('td:eq(3)', nRow).html(getActionButtons(nRow, aData));
                return nRow;
            },
            "aoColumns": [
                null,
                null,
                { "bSortable": false },
                { "bSortable": false }

            ]
        });
        $('#add-new-btn').click(function (e) {
            $("#catNameCreate").toggle(500);
            $("#name").focus();
            e.preventDefault();
        });
        $('#list-table').on('click', 'a.edit-reference', function (e) {
            var control = this;
            var referenceId = $(control).attr('referenceId');
            jQuery.ajax({
                type: 'POST',
                dataType:'JSON',
                url: "${g.createLink(controller: 'catName',action: 'edit')}?id=" + referenceId,
                success: function (data, textStatus) {
                    if(data.isError==false){
                        clearForm('#create-form');
                        $('#id').val(data.obj.id);
                        $('#name').val(data.obj.name);
                        $('#description').val(data.obj.description);
                        $("#catNameCreate").show(500);
                        $("#name").focus();
                    }else{
                        alert(data.message);
                    }
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                }
            });
            e.preventDefault();
        });

        $('#list-table').on('click', 'a.delete-reference', function (e) {
            var selectRow = $(this).parents('tr');
            var confirmDel = confirm("Are you sure?");
            if (confirmDel == true) {
                var control = this;
                var referenceId = $(control).attr('referenceId');
                jQuery.ajax({
                    type: 'POST',
                    dataType:'JSON',
                    url: "${g.createLink(controller: 'catName',action: 'delete')}?id=" + referenceId,
                    success: function (data, textStatus) {
                        if(data.isError==false){
                            $("#list-table").DataTable().row(selectRow).remove().draw();
                        }else{
                            alert(data.message);
                        }
                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                    }
                });
            }
            e.preventDefault();
        });
    });

    function getActionButtons(nRow, aData) {
        var actionButtons = "";
        actionButtons += '<sec:access controller="catName" action="edit"><span class="col-xs-6"><a href="" referenceId="' + aData.DT_RowId + '" class="edit-reference" title="Edit">';
        actionButtons += '<span class="green glyphicon glyphicon-edit"></span>';
        actionButtons += '&nbsp;Edit&nbsp;</a></span></sec:access>';
        actionButtons += '<sec:access controller="catName" action="delete"><span class="col-xs-6"><a href="" referenceId="' + aData.DT_RowId + '" class="delete-reference" title="Delete">';
        actionButtons += '<span class="red glyphicon glyphicon-trash"></span>';
        actionButtons += '&nbsp;Delete&nbsp;</a></span></sec:access>';
        return actionButtons;
    }

</script>

</body>
</html>