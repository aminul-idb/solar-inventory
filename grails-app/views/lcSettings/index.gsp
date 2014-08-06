<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>LC Settings</title>
    <asset:stylesheet src="formDataTable.css"/>
    <asset:javascript src="formDataTable.js"/>
    <asset:javascript src="formDataTable.js"/>
    <asset:javascript src="bootstrap-datepicker.min.js"/>

</head>

<body>

<div class="row wrapper border-bottom white-bg page-heading">

    <div class="col-lg-8">
        <h2>LC Settings</h2>
    </div>

    <div class="col-lg-4">
        <div class="title-action">
            <span class="tools pull-right">
                <div class="btn-group">
                    <button id="add-new-btn" class="btn btn-primary">
                        Add New&nbsp;&nbsp;<i class="fa fa-plus"></i>
                    </button>
                </div>
            </span>
        </div>
    </div>

</div>

<div class="row" id="animportCreate" style="display:none">
    <div class="col-lg-12">
        <div class="wrapper wrapper-content animated fadeInRight">
            <div class="ibox-content p-xl">

                <div class="row">
                    <div class="col-md-12">
                        <section class="panel">
                            <div class="panel-body">
                                <div class="form">
                                    <form class="cmxform form-horizontal " id="create-form">
                                        <g:hiddenField name="id"/>

                                        <div class="form-group col-md-3">
                                            <div class="col-md-12">
                                                <label for="lcNo" class="control-label">LC No.</label>
                                                <g:textField class="form-control" id="lcNo" tabindex="1" name="lcNo"
                                                             placeholder="Enter LC."/>
                                                <span for="lcNo" class="help-block"></span>
                                            </div>
                                        </div>


                                        %{--<div class="form-group col-md-3">
                                            <div class="col-md-12">
                                                <label for="datepicker" class="control-label ">Import Date</label>
                                                <input type="text" class="form-control datepicker" id="datepicker"
                                                       name="importDate" placeholder="Enter Import Date."/>
                                                <span class="help-block" for="datepicker"></span>
                                            </div>
                                        </div>--}%

                                        <div class="form-group col-md-3">
                                            <div class="col-md-12">
                                                <label for="description" class="control-label">Lc Description</label>
                                                <g:textField class="form-control" id="description"
                                                             name="description" placeholder="Enter Description."/>
                                                <span class="help-block" for="description"></span>
                                            </div>
                                        </div>

                                        <div class="form-group col-md-3">
                                            <div class="col-md-12">
                                                <label for="status" class=" control-label">Status </label><br>
                                                <g:select class="form-control" id="status" name='status'
                                                          from='${com.startup.inventory.Status.values()}'
                                                          optionKey="key" optionValue="value"></g:select> %{--noSelection="${['': 'Select One...']}"--}%
                                                <span class="help-block" for="status"></span>
                                            </div>
                                        </div>

                                        %{--<div class="col-md-12">
                                            <table class="table table-striped table-hover table-bordered" id="productList-table">
                                                <thead>
                                                <tr>
                                                    <th>Heading</th>
                                                    <th>Product Name</th>
                                                    <th>Category Name</th>
                                                    <th>Amount</th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                    <g:each in="${productItemList}" var="productItem" status="i">
                                                        <tr>
                                                            <input type="hidden" name="productItemId" value="${productItem?.id}" />
                                                            <td><input type="checkbox" name="productCheck" value="${productItem?.id}" /></td>
                                                            <td>${productItem?.name}</td>
                                                            <td>${productItem?.categoryType?.name}</td>
                                                            <td><input type="number" name="amount" /></td>
                                                        </tr>
                                                    </g:each>

                                                </tbody>
                                            </table>
                                        </div>--}%


                                        <div class="form-group">
                                            <div class="col-md-offset-8 col-md-4">
                                                <button name="submit" class="btn btn-primary" tabindex="3" type="submit">Save</button>
                                                <button class="btn btn-default" tabindex="4" type="reset">Cancel</button>
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

                            <div class="panel-body">
                                <div class="table-responsive">
                                    <table class="table table-striped table-hover table-bordered" id="list-table">
                                        <thead>
                                        <tr>
                                            <th>Serial</th>
                                            <th>LC Detail</th>
                                            %{--<th>Entry Date</th>--}%
                                            %{--<th>Import Date</th>--}%
                                            <th>Status</th>
                                            <th>Action</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <g:each in="${dataReturn}" var="animated">
                                            <tr>
                                                <td>${animated[0]}</td>
                                                <td>${animated[1]}</td>
                                                <td>${animated[2]}</td>
                                                %{--<td>${animated[3]}</td>--}%
                                                %{--<td>${animated[4]}</td>--}%
                                                <td>
                                                    <sec:access controller="import" action="edit">
                                                        <span class="col-xs-6"><a href=""
                                                                                  referenceId="${animated.DT_RowId}"
                                                                                  class="edit-reference"
                                                                                  title="Edit"><span
                                                                    class="green fa fa-edit"></span>&nbsp;Edit&nbsp;</a>
                                                        </span>
                                                    </sec:access>
                                                    <sec:access controller="import" action="delete">
                                                        <span class="col-xs-6"><a href=""
                                                                                  referenceId="${animated.DT_RowId}"
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
        errorElement: 'label',
        errorClass: 'help-block',
        focusInvalid: false,
        rules: {
            name: {
                required: true,
                minlength: 2
            },
            description: {
                maxlength: 200
            },
            status: {
                required: true
            }
        },
        messages: {
            name: {
                required: "Please provide LC",
                minlength: "LC must be at least 2 characters long"
            }
        },
        invalidHandler: function (event, validator) {
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
                url: "${createLink(controller: 'lcSettings', action: 'save')}",
                type: 'post',
                dataType: "json",
                data: $("#create-form").serialize(),
                success: function (data) {
                    clearForm(form);
                    var table = $('#list-table').DataTable();
                    table.ajax.reload();
                    setTimeout(function() {
                        $.gritter.add({
                            title: data.message
                        });
                    }, 2000);
                },
                failure: function (data) {
                }
            })
        }
    });

    jQuery(function ($) {

        $('#datepicker').datepicker({
            format: 'dd/mm/yyyy',
            gotoCurrent: true,
            autoclose: true
        });


        var oTable1 = $('#list-table').dataTable({
//        "sDom": "<'row'<'col-md-4'><'col-md-4'><'col-md-4'f>r>t<'row'<'col-md-4'l><'col-md-4'i><'col-md-4'p>>",
//            "bProcessing": true,
            "bAutoWidth": true,
            "bServerSide": true,
            "deferLoading": ${totalCount},
            "sAjaxSource": "${g.createLink(controller: 'lcSettings',action: 'list')}",
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
                /*{ "bSortable": false },*/
                /*{ "bSortable": false },*/
                { "bSortable": false }

            ]
        });

        /*var oTable2 = $('#productList-table').dataTable({
            "sDom": " ",
            aoColumns: [
                { "bSortable": false },
                { "bSortable": false },
                { "bSortable": false },
                { "bSortable": false }
            ]
        });*/

        $('#add-new-btn').click(function (e) {
            $("#animportCreate").toggle(500);
            $("#lcNo").focus();
            e.preventDefault();
        });

        $('#list-table').on('click', 'a.edit-reference', function (e) {
            var control = this;
            var referenceId = $(control).attr('referenceId');
            jQuery.ajax({
                type: 'POST',
                dataType: 'JSON',
                url: "${g.createLink(controller: 'lcSettings',action: 'edit')}?id=" + referenceId,
                success: function (data, textStatus) {
                    if (data.isError == false) {
                        clearForm('#create-form');
                        $('#id').val(data.obj.id);
                        $('#lcNo').val(data.obj.lcNo);
                        //$('#productItem').val(data.obj.productItem.id);
                        /*$('#datepicker').datepicker('setDate', new Date(data.obj.importDate));*/
                        $('#description').val(data.obj.description);
                        $('#status').val(data.obj.status ? data.obj.status.name :'');
                        $("#animportCreate").show(500);
                        $("#lcNo").focus();
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
                    url: "${g.createLink(controller: 'lcSettings',action: 'delete')}?id=" + referenceId,
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
        actionButtons += '<sec:access controller="lcSettings" action="edit"><span class="col-xs-6"><a href="" referenceId="' + aData.DT_RowId + '" class="edit-reference" title="Edit">';
        actionButtons += '<span class="green green fa fa-edit"></span>';
        actionButtons += '&nbsp;Edit&nbsp;</a></span></sec:access>';
        actionButtons += '<sec:access controller="lcSettings" action="delete"><span class="col-xs-6"><a href="" referenceId="' + aData.DT_RowId + '" class="delete-reference" title="Delete">';
        actionButtons += '<span class="red green fa fa-cut"></span>';
        actionButtons += '&nbsp;Delete&nbsp;</a></span></sec:access>';
        return actionButtons;
    }

</script>

</body>
</html>