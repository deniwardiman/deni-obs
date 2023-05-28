<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<header class="main-header">
    <!-- Logo -->
    <a href="${pageContext.request.contextPath}/home" class="logo">
        <!-- mini logo for sidebar mini 50x50 pixels -->
        <span class="logo-mini"><b>M</b></span>
        <!-- logo for regular state and mobile devices -->
        <span class="logo-lg"><b>Admin</b>&nbsp;CMS</span>
    </a>
    <!-- Header Navbar: style can be found in header.less -->
    <nav class="navbar navbar-static-top">
        <!-- Sidebar toggle button-->
        <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
            <span class="sr-only">Toggle navigation</span>
        </a>

        <div class="navbar-custom-menu">
            <ul class="nav navbar-nav">
                <!-- Notifications: style can be found in dropdown.less -->

                <!-- User Account: style can be found in dropdown.less -->
                <li class="dropdown user user-menu">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        <sec:authentication var="principal" property="principal" />
                        <c:choose>
                            <c:when test="${principal != 'anonymousUser'}">
                                <span class="hidden-xs">${principal.username}</span>
                            </c:when>
                            <c:otherwise>
                                <span class="hidden-xs">Admin</span>
                            </c:otherwise>
                        </c:choose>

                    </a>
                    <ul class="dropdown-menu">
                        <!-- User image -->
                        <li class="user-header">
                            <c:choose>
                                <c:when test="${principal != 'anonymousUser'}">
                                    <p>
                                        ${principal.username}
                                        <small>${principal.email}</small>
                                    </p>
                                </c:when>
                                <c:otherwise>
                                    <p>
                                        Admin
                                        <small>deni.wardiman08@gmail.com</small>
                                    </p>
                                </c:otherwise>
                            </c:choose>
                        </li>
                        <!-- Menu Footer-->
                        <li class="user-footer">
                            <div class="pull-left">
                                <a data-target="#account_modal" data-toggle="modal" class="btn btn-default btn-flat">Profile</a>
                            </div>
                            <div class="pull-right">
                                <a href="${pageContext.request.contextPath}/logout?success" class="btn btn-default btn-flat">Sign out</a>
                            </div>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>
    </nav>
</header>

<!-- Modal -->
<div class="modal fade" id="account_modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header bg-green no-border">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabelAccountSetting">Account Setting</h4>
            </div>
            <div class="modal-body">
                <div role="tabpanel">
                    <!-- Nav tabs -->
                    <ul class="nav nav-tabs" role="tablist">
                        <li role="presentation" class="active"><a href="#profileTab" aria-controls="uploadTab" role="tab" data-toggle="tab">Profile</a></li>
                        <li role="presentation"><a href="#passwordTab" aria-controls="browseTab" role="tab" data-toggle="tab">Password</a></li>
                    </ul>
                    <!-- Tab panes -->
                    <div class="tab-content">
                        <div role="tabpanel" class="tab-pane active" id="profileTab">
                            <form accept-charset="utf-8" role="form" action="${pageContext.request.contextPath}/usercms/update_profile" method="post" id="form_profil" enctype="multipart/form-data">
                                <div class="modal-body">
                                    <div class="row">
                                        <div class="col-xs-9 col-sm-9 col-md-9 col-lg-9">
                                            <div>
                                                <input type="hidden" name="activated" id="activated" class="form-control input-sm has-feedback" />
                                            </div>
                                            <div class="form-group username">
                                                <label>Email</label>
                                                <input type="text" name="email_disabled" id="email_disabled" class="form-control input-sm has-feedback" placeholder="" disabled/>
                                            </div>
                                            <div class="form-group name">
                                                <label>Name</label>
                                                <input type="text" name="name" id="name" class="form-control input-sm has-feedback" autofocus placeholder="Name" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <input type="hidden" id="edit_person_id" name="id" value="" />
                                    <button type="button" class="btn btn-sm btn-default" data-dismiss="modal"><i class="glyphicon glyphicon-remove-circle"></i>&nbsp;&nbsp;Close</button>
                                    <button type="submit" id="save-change_profile" data-dismiss="modal" class="btn btn-sm btn-success"><i class="glyphicon glyphicon-ok-circle"></i>&nbsp;&nbsp;Proceed</button>
                                </div>
                            </form>
                        </div>
                        <div role="tabpanel" class="tab-pane" id="passwordTab">
                            <form accept-charset="utf-8" role="form" action="${pageContext.request.contextPath}/usercms/change_password" method="post" id="form_change_password">
                                <div class="modal-body">
                                    <div class="form-group old_password">
                                        <label>Old Password</label>
                                        <div class="input-group input-group-sm">
                                            <span class="input-group-addon"><i class="fa fa-lock"></i></span>
                                            <input type="password" name="old_password" id="old_password" class="form-control" placeholder="Your Old Password" />
                                        </div>
                                        <label id="old_password-error" class="success" for="old_password"></label>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-6 form-group new_password">
                                            <label>New Password</label>
                                            <div class="input-group input-group-sm">
                                                <span class="input-group-addon"><i class="fa fa-lock"></i></span>
                                                <input type="password" name="new_password" id="new_password" class="form-control" placeholder="Your New Password" />
                                            </div>
                                        </div>
                                        <div class="col-lg-6 form-group confirm_new_password">
                                            <label>Repeat new Password</label>
                                            <div class="input-group input-group-sm">
                                                <span class="input-group-addon"><i class="fa fa-lock"></i></span>
                                                <input type="password" name="confirm_new_password" id="confirm_new_password" class="form-control" placeholder="Repeat Your New Password" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-sm btn-default" data-dismiss="modal"><i class="glyphicon glyphicon-remove-circle"></i>&nbsp;&nbsp;Close</button>
                                    <button type="button" id="save-change_password" data-dismiss="modal" class="btn btn-sm btn-success"><i class="glyphicon glyphicon-ok-circle"></i>&nbsp;&nbsp;Proceed</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">

    $(document).ready(function() {

        $('#account_modal').on('show.bs.modal', function(e) {
            <c:choose>
                <c:when test="${principal != 'anonymousUser'}">
                    $('input[name=name]').val('${principal.name}');
                    $('input[name=email_disabled]').val('${principal.email}');
                </c:when>
                <c:otherwise>
                    $('input[name=name]').val('Admin');
                    $('input[name=email_disabled]').val('deni.wardiman08@gmail.com');
                </c:otherwise>
            </c:choose>

            var img = '';
            if(img.length > 0) {
                $('#bleh').attr('src', img);
            }
        });

        $("#form_change_password").validate({
            rules: {
                old_password: {
                    required: true,
                    minlength: 4,
                    maxlength: 100
                },
                new_password: {
                    required: true,
                    minlength: 4,
                    maxlength: 100
                },
                confirm_new_password: {
                    required: true,
                    equalTo: "#new_password",
                    minlength: 4,
                    maxlength: 100
                }
            },
            messages: {
                old_password: {
                    required: "Input Your old Password",
                    minlength: "Old Password must be 6 or more character length.",
                    maxlength: "Old Password cannot be more than 100 character length."
                },
                new_password: {
                    required: "Input Your new Password",
                    minlength: "New Password must be 6 or more character length.",
                    maxlength: "New Password cannot be more than 100 character length."
                },
                confirm_new_password: {
                    required: "Re-type Your New Password",
                    minlength: "New Password must be 6 or more character length.",
                    maxlength: "New Password cannot be more than 100 character length."
                }
            },
            errorElement: 'label',
            errorClass: 'error',
            errorPlacement: function(error, element) {
                if(element.parent('.input-group').length) {
                    error.insertAfter(element.parent());
                } else {
                    error.insertAfter(element);
                }
            }
        });

        $("#old_password").on('blur keyup keydown', function(event) {
            // $("#old_password-error").hide();
            $.ajax({
                url: "/usercms/get_password",
                type: "POST",
                dataType: "json",
                data: {password: $(this).val()},
                beforeSend: function(xhr) {
                    xhr.setRequestHeader(header, token);
                },
                success: function(data) {
                    if(data.success) {
                        $("#old_password-error").text(data.msg);
                        $("#old_password-error").attr('class', 'text-green');

                        // $("#save").prop("disabled", false);
                        if (!$("#old_password-error").hasClass('error')) {
                            $("#save-change_password").prop("disabled", false);
                        }

                    } else if(!data.success) {
                        $("#old_password-error").text(data.msg);
                        $("#old_password-error").attr('class', 'error');

                        $("#save-change_password").prop("disabled", true);
                    }

                    $("#old_password-error").show();
                }
            });
        });

        $('#save-change_password').on('click', function() {
            $('#form_change_password').ajaxSubmit({
                dataType: 'json',
                beforeSend: function(xhr) {
                    xhr.setRequestHeader(header, token);
                    $("#old_password-error").removeClass().text('');
                    $("#old_password").val("");
                    $("#new_password").val("");
                    $("#confirm_new_password").val("");
                    MyApp.loadingOverlay.show();
                },
                uploadProgress: function(event, position, total, percentComplete) {
                },
                success: function(resp) {
                    toastr["success"](resp.message, "Success");
                    window.location = "/logout?updated";
                },
                complete: function(xhr) {
                    MyApp.loadingOverlay.hide();
                    try {
                        resp = JSON.parse(xhr.responseText);
                    } catch (e) {
                        toastr["error"]("Something went wrong.", "Error")
                    }
                }
            });
        });

        $('#save-change_profile').on('click', function() {
        console.log("fsad")
            $('#form_profil').ajaxSubmit({
                dataType: 'json',
                processData: false,
                beforeSend: function(xhr) {
                    xhr.setRequestHeader(header, token);
                    MyApp.loadingOverlay.show();
                },
                uploadProgress: function(event, position, total, percentComplete) {
                },
                success: function(resp) {
                    if(resp.meta.total == 1){
                        toastr["success"](resp.message, "Success")
                        window.location = "/logout?updated";
                    }else{
                        toastr["error"](resp.message, "Error")
                    }
                },
                error: function(resp) {
                    var exception = JSON.parse(resp.responseText);
                    toastr["error"](exception.message, "Error");
                },
                complete: function(xhr) {
                    MyApp.loadingOverlay.hide();
                    try {
                        resp = JSON.parse(xhr.responseText);
                    } catch (e) {
                        toastr["error"]("Something went wrong.", "Error")
                    }
                }
            });
        });

        $.fn.readURL = function(input) {

            if (input.files && input.files[0]) {
                var reader = new FileReader();

                reader.onload = function (e) {
                    $('#bleh').attr('src', e.target.result);
                };

                reader.readAsDataURL(input.files[0]);
            }
        };
        $("#img").change(function(){ $(this).readURL(this); });
    });
</script>