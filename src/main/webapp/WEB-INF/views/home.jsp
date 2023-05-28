<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Dashboard</title>
    <%@ include file="/WEB-INF/views/include.jsp"%>
</head>
<body class="hold-transition skin-green sidebar-mini">
    <div class="wrapper">
        <%@ include file="/WEB-INF/views/header.jsp" %>
        <%@ include file="/WEB-INF/views/left_menu.jsp" %>

        <div class="content-wrapper">
            <section class="content-header">
                <h1>
                    Dashboard
                    <small>Control panel</small>
                </h1>
            </section>
            <section class="content">
                <div class="row">
                    <div class="col-xs-12">
                        <div class="box box-success">
                            <div class="box-header with-border">
                                <div class="header pull-left">
                                    <h3 class="box-title title-module">Welcome ${principal.name} </h3>
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
                                            <th>Department</th>
                                            <th>Student Id</th>
                                            <th>Mark</th>
                                            <th>Pass</th>
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

        <%@ include file="/WEB-INF/views/footer.jsp"%>
    </div>
    <div id="modal-detail" class="modal fade" tabindex="-1" data-keyboard="false" data-backdrop="static" role="basic" aria-hidden="true">
                <div class="modal-dialog modal-wide">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">x</span></button>
                            <h4 class="modal-title">Student Detail</h4>
                        </div>
                        <div class="modal-body">
                            <span id="student_name"</span>
                        </div>
                        <div class="modal-footer">
                            <button type="button" data-dismiss="modal" class="btn btn-success pull-right">OK</button>
                        </div>
                    </div>
                </div>
            </div>
    <script type='text/javascript'>
                var rankHandler = {
                    construct: function(options) {

                        var _table;

                        var handler = {
                            _initialize: function () {
                                var oTable = $('#listTables').DataTable();
                            },

                            _initTable: function () {
                                    var self = this;

                                _table = $("#listTables").DataTable({
                                    "processing": true,
                                    "serverSide": true,
                                    "ajax": {
                                        "url": "/rank/lists",
                                        "data": function(data) {
                                            data.filter = $("#searchFilter").val();
                                            data.filterValue = $("#searchValue").val();
                                        }
                                    },
                                    language: {
                                        searchPlaceholder: "Department . . . "
                                    },
                                    columnDefs : [
                                        {
                                            targets: 0,
                                            width: "5%",
                                            sortable: false,
                                            render: function (data, type, row, meta) {
                                                return meta.row + meta.settings._iDisplayStart + 1;
                                            }
                                        },
                                        { targets: 1, sortable: true, width: "20%",
                                            render: function (data, type, row, meta) {
                                                return row.department;
                                            }
                                        },
                                        {
                                            targets: 2,
                                            sortable: true,
                                            width: "30%",
                                            render : function ( data, type, row) {
                                                var action = "";
                                                action += "<a class=\"btn btn-info btn-sm action-detail\" data-toggle=\"tooltip\" title=\"Detail\">"+ row.id +"</a>&nbsp";
                                                return action;
                                            }
                                        },
                                        { targets: 3, sortable: true,
                                            render: function (data, type, row, meta) {
                                                return row.mark;
                                            }
                                        },
                                        { targets: 4, sortable: true,
                                            render: function (data, type, row, meta) {
                                                return row.pass;
                                            }
                                        }
                                    ],
                                    fnDrawCallback: function() {
                                    },
                                    order: [[ 0, "desc" ]]
                                });

                                $('#listTables_length').hide();

                            },

                            _clickListener: function () {
                                var self = this;

                                $('#filterBtn').on( 'click', function () {
                                    _table.ajax.reload();
                                });

                                $("#searchValue").keyup(function (e) {
                                    if (e.keyCode == 13) {
                                        _table.ajax.reload();
                                    }
                                });

                                $('#listTables tbody').on( 'click', '.action-detail', function () {
                                    var data = _table.row( $(this).parents('tr') ).data();
                                    $('#modal-detail').modal('show');
                                    $("#student_name").html(data.student);
                                });
                            },

                            init: function () {
                                var self = this;

                                self._initTable();
                                self._initialize();
                                self._clickListener();
                            }
                        };

                        return handler;
                    }
                };

                $(document).ready(function() {
                    var handler = rankHandler.construct();
                    handler.init();
                });

                function showForm(data) {
                    $("#formBrand").data('validator').resetForm();
                    formReset($('#formBrand'));
                    $('#modal-form').modal('show');
                    if(data) {
                        $('#formBrand').find('input[name="name"]').val(data.name);
                        $('#formBrand').find('input[name="brand_id"]').val(data.id);
                    } else {
                        $('#formBrand').find('input[name="brand_id"]').val("");
                    }
                }

            </script>

</body>
</html>
