<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Dashboard</title>
    <%@ include file="/WEB-INF/views/include.jsp" %>
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">
    <%@ include file="/WEB-INF/views/header.jsp" %>
    <%@ include file="/WEB-INF/views/left_menu.jsp" %>

<div class="content-wrapper">
    <section class="content-header">
        <h1>
            Dashboard
            <small>Control panel</small>
        </h1>
        <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
            <li class="active">Dashboard</li>
        </ol>
    </section>
    <section class="content">
        <div class="row">
            <section class="col-md-12">
                <div class="box box-success">
                    <div class="box-header with-border">
                        <h3 class="box-title">&nbsp;</h3>
                        <div class="box-tools pull-right">
                            <div class="input-group">
                                <button type="button" class="btn btn-default pull-right" id="daterange-btn">
                                    <span>
                                        <i class="fa fa-calendar"></i>
                                    </span>
                                    <i class="fa fa-caret-down"></i>
                                </button>
                                <input type="hidden" id="top-panel-start-date" name="startDate" value="@lastMonth">
                                <input type="hidden" id="top-panel-end-date" name="endDate" value="@today">
                            </div>
                        </div>
                    </div>
                    <div class="box-body">
                        <div class="col-lg-3 col-xs-6">
                            <div class="small-box bg-aqua">
                                <div class="inner">
                                    <h3><span id="count_merchant">100</span></h3>
                                    <p>Sellers</p>
                                </div>
                                <div class="icon">
                                    <i class="fa fa-group"></i>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-xs-6">
                            <div class="small-box bg-green">
                                <div class="inner">
                                    <h3><span id="count_order">200</span></h3>
                                    <p>Orders</p>
                                </div>
                                <div class="icon">
                                    <i class="fa fa-cart-plus"></i>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-xs-6">
                            <div class="small-box bg-yellow">
                                <div class="inner">
                                    <h3><span id="count_product">30</span></h3>
                                    <p>Products</p>
                                </div>
                                <div class="icon">
                                    <i class="fa fa-cubes"></i>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-xs-6">
                            <div class="small-box bg-purple">
                                <div class="inner">
                                    <h3><span id="count_revenue">200000</span></h3>
                                    <p>Revenue</p>
                                </div>
                                <div class="icon">
                                    <i class="fa fa-money"></i>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-xs-6">
                            <div class="small-box bg-red">
                                <div class="inner">
                                    <h3><span id="count_visit">50</span></h3>
                                    <p>Customers</p>
                                </div>
                                <div class="icon">
                                    <i class="fa fa-eye"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div id="top-panel-overlay" class="overlay" style="display:none;">
                        <i class="fa fa-refresh fa-spin"></i>
                    </div>
                </div>

            </section>
        </div>
        <div class="row">
            <section class="col-md-12">
                <div class="box box-info">
                    <div class="box-header with-border">
                        <button class="btn btn-default active btn-sm action2" id="chart-period-D">D</button>
                        <button class="btn btn-default btn-sm action2" id="chart-period-M">M</button>
                        <button class="btn btn-default btn-sm action2" id="chart-period-Y">Y</button>
                        <input type="hidden" id="chart-period" value="D">
                        <div class="box-tools pull-right">
                            <div class="input-group">
                                <button type="button" class="btn btn-default pull-right" id="daterange-chart-btn">
                                    <span>
                                        <i class="fa fa-calendar"></i>
                                    </span>
                                    <i class="fa fa-caret-down"></i>
                                </button>
                                <input type="hidden" id="bottom-panel-start-date" name="startDate" value="@lastMonth">
                                <input type="hidden" id="bottom-panel-end-date" name="endDate" value="@today">
                            </div>
                        </div>
                    </div>
                    <div class="box-body">
                        <div class="row">
                            <div class="col-md-6">
                                <h4 class="col-md-12 text-center">Customer Chart</h4>
                                <canvas id="lineChartCustomer" style="height:250px"></canvas>
                            </div>
                            <div class="col-md-6">
                                <h4 class="col-md-12 text-center">Order Chart</h4>
                                <canvas id="lineChartOrder" style="height:250px"></canvas>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-3"></div>
                            <div class="col-md-6">
                                <h4 class="col-md-12 text-center">Transaction Chart</h4>
                                <canvas id="lineChartTransaction" style="height:250px"></canvas>
                            </div>
                            <div class="col-md-3"></div>
                        </div>
                    </div>
                </div>

            </section>
        </div>

    </section>
</div>

    <%@ include file="/WEB-INF/views/footer.jsp" %>
</div>
<!-- ./wrapper -->

<script>
  $.widget.bridge('uibutton', $.ui.button);
</script>


<script>
    $(function () {
        
    });
</script>
</body>
</html>
