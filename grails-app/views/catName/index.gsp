<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Create Category</title>
    <asset:stylesheet src="formDataTable.css"/>
    <asset:javascript src="formDataTable.js"/>

</head>

<body>

<div class="row wrapper border-bottom white-bg page-heading">

    <div class="col-lg-8">
        <h2>Invoice</h2>
    </div>

    <div class="col-lg-4">
        <div class="title-action">
            <span class="tools pull-right">
                <div class="btn-group">
                    <button id="add-new-btn" class="btn btn-primary">
                        Add New&nbsp;<i class="fa fa-plus"></i>
                    </button>
                </div>
            </span>
        </div>
    </div>

</div>

<div class="row" id="catNameCreate" style="display:none">
    <div class="col-lg-12">
        <div class="wrapper wrapper-content animated fadeInRight">
            <div class="ibox-content p-xl">

                <div class="row">
                    <div class="col-lg-12">
                        <section class="panel">
                            <header class="panel-heading">
                                Create Class
                                <span class="tools pull-right">
                                    <a class="fa fa-chevron-down" href="javascript:;"></a>
                                </span>
                            </header>

                            <div class="panel-body">
                                <div class="form">
                                    <form class="cmxform form-horizontal " id="create-form">
                                        <g:hiddenField name="id"/>

                                        <div class="form-group col-md-4">
                                            <div class="col-md-12">
                                                <label class="control-label">Class Name</label>
                                                <g:textField class="form-control" id="name" tabindex="1" name="name"
                                                             placeholder="Enter Class Name."/>
                                                <span for="name" class="help-block"></span>
                                            </div>
                                        </div>

                                        <div class="form-group col-md-4">
                                            <div class="col-md-12">
                                                <label class="control-label">Description</label>
                                                <g:textField class="form-control" id="description" tabindex="2"
                                                             name="description" placeholder="Enter Description."/>
                                                <span class="help-block" for="description"></span>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <div class="col-md-offset-8 col-lg-4">
                                                <button class="btn btn-primary" tabindex="3" type="submit">Save</button>
                                                <button class="btn btn-default" tabindex="4"
                                                        type="reset">Cancel</button>
                                            </div>
                                        </div>

                                    </form>
                                </div>
                            </div>
                        </section>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<div class="row">
    <div class="col-lg-12">
        <div class="wrapper wrapper-content animated fadeInRight">
            <div class="ibox-content p-xl">
                <div class="row">
                    <div class="col-sm-12">
                        <section class="panel">
                            <header class="panel-heading">
                                Category List

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
                                                        <span class="col-xs-6"><a href=""
                                                                                  referenceId="${catName.DT_RowId}"
                                                                                  class="edit-reference"
                                                                                  title="Edit"><span
                                                                    class="green fa fa-edit"></span>&nbsp;Edit&nbsp;</a>
                                                        </span>
                                                    </sec:access>
                                                    <sec:access controller="catName" action="delete">
                                                        <span class="col-xs-6"><a href=""
                                                                                  referenceId="${catName.DT_RowId}"
                                                                                  class="delete-reference"
                                                                                  title="Delete"><span
                                                                    class="green fa fa-cut"></span>&nbsp;Delete&nbsp;
                                                        </a></span>
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
            </div>
        </div>
    </div>
</div>
<!-- page end-->

<script>

    $('#create-form').validate({
        errorElement: 'span',
        errorClass: 'help-block',
        focusInvalid: false,
        rules: {
            name: {
                required: true,
                maxlength: 200
            },
            description: {
                maxlength: 200
            }
        },
        messages: {
            name: {
                required: "Class Name required"
            }
        },
        invalidHandler: function (event, validator) { //display error alert on form submit
            $('.alert-danger', $('#currencyForm')).show();
        },

        highlight: function (e) {
            $(e).closest('.form-group').removeClass('has-info').addClass('has-error');
        },

        success: function (e) {
            $(e).closest('.form-group').removeClass('has-error').addClass('has-info');
            $(e).remove();
        },
        submitHandler: function (form) {
            $.ajax({
                url: "${createLink(controller: 'catName', action: 'save')}",
                type: 'post',
                dataType: "json",
                data: $("#create-form").serialize(),
                success: function (data) {
                    clearForm(form);
                    var table = $('#list-table').DataTable();
                    table.ajax.reload();
                    $.growl('Class Name Created successfully!', { type: 'success' });
                },
                failure: function (data) {
                }
            })
        }
    });

    jQuery(function ($) {
        var oTable1 = $('#list-table').dataTable({
        "sDom": "<'row'<'col-md-4'><'col-md-4'><'col-md-4'f>r>t<'row'<'col-md-4'l><'col-md-4'i><'col-md-4'p>>",
            "bProcessing": true,
            "bAutoWidth": true,
            "bServerSide": true,
            "deferLoading": ${totalCount},
            "sAjaxSource": "${g.createLink(controller: 'catName',action: 'list')}",
            "fnRowCallback": function (nRow, aData, iDisplayIndex) {
                if (aData.DT_RowId == undefined) {
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
                dataType: 'JSON',
                url: "${g.createLink(controller: 'catName',action: 'edit')}?id=" + referenceId,
                success: function (data, textStatus) {
                    if (data.isError == false) {
                        clearForm('#create-form');
                        $('#id').val(data.obj.id);
                        $('#name').val(data.obj.name);
                        $('#description').val(data.obj.description);
                        $("#catNameCreate").show(500);
                        $("#name").focus();
                    } else {
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
                    dataType: 'JSON',
                    url: "${g.createLink(controller: 'catName',action: 'delete')}?id=" + referenceId,
                    success: function (data, textStatus) {
                        if (data.isError == false) {
                            $("#list-table").DataTable().row(selectRow).remove().draw();
                        } else {
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
        actionButtons += '<span class="green green fa fa-edit"></span>';
        actionButtons += '&nbsp;Edit&nbsp;</a></span></sec:access>';
        actionButtons += '<sec:access controller="catName" action="delete"><span class="col-xs-6"><a href="" referenceId="' + aData.DT_RowId + '" class="delete-reference" title="Delete">';
        actionButtons += '<span class="red green fa fa-cut"></span>';
        actionButtons += '&nbsp;Delete&nbsp;</a></span></sec:access>';
        return actionButtons;
    }

</script>

</body>
</html>