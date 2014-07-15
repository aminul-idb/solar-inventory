<div class="row" id="catNameCreate" style="display:none">
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
                                <g:textField class="form-control" id="name" tabindex="1" name="name" placeholder="Enter Class Name."/>
                                <span for="name" class="help-block"></span>
                            </div>
                        </div>

                        <div class="form-group col-md-4">
                            <div class="col-md-12">
                                <label class="control-label">Description</label>
                                <g:textField class="form-control" id="description" tabindex="2" name="description" placeholder="Enter Description."/>
                                <span class="help-block" for="description"></span>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-md-offset-8 col-lg-4">
                                <button class="btn btn-primary" tabindex="3" type="submit">Save</button>
                                <button class="btn btn-default" tabindex="4" type="reset">Cancel</button>
                            </div>
                        </div>

                    </form>
                </div>
            </div>
        </section>
    </div>
</div>

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
</script>