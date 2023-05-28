<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="display" uri="http://displaytag.sf.net" %>
<!DOCTYPE html>
<html>
	<head>
		<c:url var="home" value="/" scope="request" />
	    <meta charset="utf-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <title>User CMS</title>
	    <style type="text/css">
            .modal-body {
                max-height: calc(100vh - 110px);
                overflow-y: auto;
            }
        </style>
        <%@ include file="/WEB-INF/views/include.jsp" %>
    </head>
    <body class="hold-transition skin-green sidebar-mini">
    <div class="wrapper">
        <%@ include file="/WEB-INF/views/header.jsp" %>
        <%@ include file="/WEB-INF/views/left_menu.jsp" %>

        <div class="content-wrapper">
            <section class="content-header">
                <h1>
                    User CMS
                    <small></small>
                </h1>
                <ol class="breadcrumb">
                    <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                    <li class="active">User CMS</li>
			        </ol>
			    </section>

				<section class="content">
					<div class="row">
						<div class="col-xs-12">
							<div class="box box-success">
								<div class="box-header with-border">
									<div class="header pull-left">
										<h3 class="box-title title-module">List User CMS</h3>
									</div>

									<div class="add pull-right">
										<a class="btn btn-success btn-sm action-add">
											<i class="fa fa-plus"></i> New
										</a>
									</div>
								</div>
								<div class="box-body">
									<form>
										<div class="row">
										</div>
									</form>
									<table id="listTables" class="table table-bordered table-striped">
										<thead>
											<tr>
												<th>No</th>
												<th>Email</th>
												<th>First Name</th>
												<th>Last Name</th>
												<th>Role</th>
												<th>Status</th>
												<th>Action</th>
											</tr>
										</thead>
										<tbody>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</section>
			</div>
			<%@ include file="/WEB-INF/views/footer.jsp" %>
		</div>
		<div class="modal fade" data-keyboard="false" data-backdrop="static" id="modal-form" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
     		<div class="modal-dialog">
       			<div class="modal-content">
					<div class="modal-header">
	             		<button type="button" class="close" data-dismiss="modal" aria-label="Close">
	               		<span aria-hidden="true">x</span></button>
	             		<h4 class="modal-title">User CMS Form</h4>
	           		</div>
					<form id="formUserCms" action="${pageContext.request.contextPath}/user-cms/save" method="post" class="form-horizontal" role="form">
						<div class="modal-body col-sm-12">
							<div class="form-group">
								<label class="col-sm-2">Email *</label>
								<div class="col-sm-10">
									<input type="email" class="form-control" name="email" placeholder="Email" required>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2">First Name *</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" name="firstName" placeholder="First Name" required>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2">Last Name *</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" name="lastName" placeholder="Last Name" required>
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-2">Role *</label>
								<div class="col-sm-10">
									<select class="form-control" id="role_id" name="role_id">
										<%--<option value=""></option>--%>
										<c:forEach items="${roleList}" var="role">
											<option value="${role.id}"><c:out value = "${role.name}"/></option>
										</c:forEach>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-2">Status</label>
								<div class="col-md-10">
									<input
											name="isActive"
											id="status"
											class="cb-status-form"
											type="checkbox"
											data-toggle="toggle"
											data-on="Active" data-off="Inactive"
											data-offstyle="danger"
											data-width="100"
									>
								</div>
							</div>
						</div>
						<div class="modal-footer">
							<div class="form-group col-sm-12">
								<input type="hidden" id="user_id" name="user_id"/>
								<button type="button" data-dismiss="modal" class="btn btn-danger">Cancel</button>
								<button type="button" class="btn btn-primary submit-save">Ok</button>
							</div>
						</div>
					</form>
 				</div>
   			</div>
   		</div>
		<div id="modal-delete" class="modal fade" tabindex="-1" data-keyboard="false" data-backdrop="static" role="basic" aria-hidden="true">
			<div class="modal-dialog modal-wide">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">x</span></button>
						<h4 class="modal-title">Delete</h4>
					</div>
					<div class="modal-body">
						Are you sure you want to delete this item?
					</div>
					<div class="modal-footer">
						<input type="hidden" class="form-control" id="delete_id" name="id" value="" />
						<button type="button" data-dismiss="modal" class="btn btn-danger">Cancel</button>
						<button type="button" class="btn btn-primary submit-delete">Ok</button>
					</div>
				</div>
			</div>
		</div>

		<script type="text/javascript">
            var table;
            $(document).ready(function(){
                table = $("#listTables").DataTable({
                    "processing": true,
                    "serverSide": true,
                    "ajax": {
                        "url": "/user-cms/ajax",
                        "data": function(data) {
                            data.filter = $("#searchFilter").val();
                        }
                    },
                    columns: [
                        { width:'20px' },
                        { data:'email'},
                        { data:'first_name'},
                        { data:'last_name'},
                        { data:'role.name'},
                        { data:'is_active'},
                        { }
                    ],
                    columnDefs : [
                        { targets: 0, sortable: false,
                            render: function (data, type, row, meta) {
                                return meta.row + meta.settings._iDisplayStart + 1;
                            }
                        },
                        { targets: 5, sortable: false,
                            render: function (data, type, row, meta) {
                            	if (data) {
                                    return "<input class=\"cb-status\" type=\"checkbox\" data-toggle=\"toggle\" data-offstyle=\"danger\" disabled checked>";
								} else {
                                    return "<input class=\"cb-status\" type=\"checkbox\" data-toggle=\"toggle\" data-offstyle=\"danger\" disabled>";
								}
                            }
                        },
                        {
                            targets: 6,
							sortable: false,
							width: "105px",
                            render : function ( data, type, row) {
                                return ""
//									 + "<a class=\"btn btn-default btn-sm action\" href=\"user-cms/detail/"+row.id+"\"><i class=\"fa fa-search\"></i></a>&nbsp;"
									 + "<a class=\"btn btn-primary btn-sm action-edit\" data-id=\""+row.id+"\"><i class=\"fa fa-pencil\"></i></a>&nbsp;"
									 + "<a class=\"btn btn-danger btn-sm action-delete\"><i class=\"fa fa-trash\"></i></a>&nbsp";
                            }
                        }
                    ],
                    order: [[ 1, "asc" ]],
                    language: {
                        searchPlaceholder: "Searching..."
                    },
                    "fnDrawCallback": function() {
                        $('.cb-status').bootstrapToggle();
                    }
                });

                $('#searchFilter').on('change', function(){
                    table.ajax.reload();
                });

                oTable = $('#listTables').DataTable();

                $('#listTables_length').hide();


                $('.submit-delete').on('click', function() {
                    var id = $("#delete_id").val();
                    $.ajax({
                        url: "/user-cms/"+id+"/delete",
                        type: 'DELETE',
                        beforeSend: function(xhr) {
                            xhr.setRequestHeader(header, token);
                            $('#modal-delete').modal('hide');
                            MyApp.loadingOverlay.show();
                        },
                        error: function(data ) {
                            resp = JSON.parse(data.responseText);
                            toastr["error"](resp.message, "Error")
                        },
                        success: function(resp) {
                            toastr["success"](resp.message, "Success")
                            table.ajax.reload();
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

                $('.submit-save').on('click', function() {
                    $('#formUserCms').ajaxSubmit({
                        dataType: 'json',
                        beforeSend: function(xhr) {
                            xhr.setRequestHeader(header, token);
                            $('#modal-form').modal('hide');
                            MyApp.loadingOverlay.show();
                        },
                        uploadProgress: function(event, position, total, percentComplete) {
                        },
                        success: function(resp) {
                            toastr["success"](resp.message, "Success")
                            table.ajax.reload();
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

                $('#listTables tbody').on( 'click', '.action-edit', function () {
                    var data = table.row( $(this).parents('tr') ).data();
                    showForm(data)
                });
                $('#listTables tbody').on( 'click', '.action-delete', function () {
                    var data = table.row( $(this).parents('tr') ).data();
                    $('#modal-delete').modal('show');
                    $("#delete_id").val(data.id);
                });
                $('.action-add').on('click', function() {
                    showForm(null);
                });

            });

            function showForm(data) {
                $('#formUserCms')[0].reset();
                $('#modal-form').modal('show');
                if (data){
                    $('#formUserCms').find('input[name="firstName"]').val(data.first_name);
                    $('#formUserCms').find('input[name="lastName"]').val(data.last_name);
                    $('#formUserCms').find('input[name="email"]').val(data.email);
                    $('#formUserCms').find('select[name="role_id"]').val(data.role.id);
                    $('#formUserCms').find('input[name="user_id"]').val(data.id);
                    if (data.is_active) {
                        $('.cb-status-form').bootstrapToggle('on');
					} else {
                        $('.cb-status-form').bootstrapToggle('off');
					}
				}else{
                    $('#formUserCms').find('input[name="user_id"]').val("");
                    $('.cb-status-form').bootstrapToggle('off');
				}
            }
		</script>
	</body>
</html>
