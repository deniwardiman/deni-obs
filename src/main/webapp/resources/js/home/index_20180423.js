function labelFormatter(label, series) {
    return '<div style="font-size:13px; text-align:center; padding:2px; color: #fff; font-weight: 600;">'
        + label
        + '<br>'
        + Math.round(series.percent) + '%</div>'
}
var HomeHandler = {
    construct: function(options) {
                
        var handler = {
            _initialize: function() {
                var self = this;
                var _tableBestVisit;
                var monthLabels = [], hourLabel = [];
                
                //Date range as a button
                $('#daterange-btn').daterangepicker(
                    {
                      ranges: {
                        'Today': [moment(), moment()],
                        'Yesterday': [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
                        'Last 7 Days': [moment().subtract(6, 'days'), moment()],
                        'Last 30 Days': [moment().subtract(29, 'days'), moment()],
                        'This Month': [moment().startOf('month'), moment().endOf('month')],
                        'Last Month': [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
                      },
                      startDate: moment().subtract(29, 'days'),
                      endDate: moment()
                    },
                    function (start, end) {
                        $('#daterange-btn span').html(start.format('MM/DD/YYYY') + ' - ' + end.format('MM/DD/YYYY'));
//                        console.log($('#daterange-btn span').html());
                        var date = start.format('YYYYMMDD') + '_' + end.format('YYYYMMDD');
                        $('#date_selected').val(date);
                        $.ajax({
                            url: "/home/select-date/"+date,
                            type: 'POST',
                            beforeSend: function() {
                                MyApp.loadingOverlay.show();
                            },
                            error: function(data ) {
                                resp = JSON.parse(data.responseText);
                                toastr["error"](resp.message, "Error");
                            },
                            success: function(resp) {
                                if(resp.meta.total == 1){
                                    toastr["success"](resp.message, "Success");
                                    $("#total_owner").html(resp.data.total_owner);
                                    $("#total_owner_verified").html(resp.data.total_owner_verified);
                                    $("#total_owner_rejected").html(resp.data.total_owner_rejected);
                                    $("#total_customer").html(resp.data.total_customer);
                                    $("#total_customer_verified").html(resp.data.total_customer_verified);
                                    $("#total_visitor").html(resp.data.total_visitor);
                                    $("#total_car").html(resp.data.total_car_registered);
                                    $("#total_car_rejected").html(resp.data.total_car_rejected);
                                    $("#total_car_verified").html(resp.data.total_car_verified);
                                    $("#total_rent").html(resp.data.total_rent);
                                    $("#total_active_rent").html(resp.data.total_active_rent);
                                    $("#total_finish_rent").html(resp.data.total_finish_rent);
                                }else{
                                    toastr["error"](resp.message, "Error");
                                }
                            },
                            complete: function(xhr) {
                                MyApp.loadingOverlay.hide();
                                try {
                                    resp = JSON.parse(xhr.responseText);
                                } catch (e) {
                                    toastr["error"]("Something went wrong.", "Error");
                                }
                            }
                        });
                        _tableBestVisit.ajax.reload();
                    }
                );

//                    $.each(${labels}, function (k, v) {
//                        monthLabels.push(v);
//                    });

//                    hourLabel = $.map($(Array(24)),function(val, i) { return i; });

//                    self._initBarChartReusable($('#barChartTripsCreated'), monthLabels, ${chart_data_trips_created});
//                    self._initBarChartReusable($('#barChartTripsBooked'), monthLabels, ${chart_data_trips_booked});
//                    self._initBarChartReusable($('#barChartTripsTrx'), monthLabels, ${chart_data_trips_trx});
//                    self._initBarChartReusable($('#barChartAmountTrx'), monthLabels, ${chart_data_amount_trx});
//                    self._initBarChartReusable($('#30DaysTrafficHour'), hourLabel, ${chart_data_traffic_hour});
//                    self._initBarChartReusable($('#barChartPreference'), ${preference_labels}, ${preference_values});
//                    self._initPieChart($('#pieChartBouncing'), ${pie_chart_data_bouncing_rate});
//                    self._initPieChart($('#pieChartVoCancelRate'), ${pie_chart_data_cancel_vo});
//                    self._initPieChart($('#pieChartRiderCancelRate'), ${pie_chart_data_cancel_rider});
//                    self._initPieChart($('#pieChartFailedSearch'), ${pie_chart_data_failed_search});
                
                var columnTodaysRent = [
                        {
                            targets: 0,
                            sortable: false,
                            render: function (data, type, row, meta) {
                                return row.id;
                            }
                        },
                        {
                            targets: 1,
                            sortable: false,
                            render: function (data, type, row, meta) {
                                return row.customer;
                            }
                        },
                        {
                            targets: 2,
                            sortable: true,
                            render: function (data, type, row, meta) {
                                return row.vehicle_owner;
                            }
                        },
                        {
                            targets: 3,
                            sortable: true,
                            render: function (data, type, row, meta) {
                                return row.car;
                            }
                        },
                        {
                            targets: 4,
                            sortable: true,
                            render: function (data, type, row, meta) {
                                var status = "";
                                if(row.status == "PAYMENT RECEIVED") status = "<small class=\"label bg-green\">" + row.status + "</small>";
                                else if(row.status == "REJECT" || row.status == "CANCEL APPROVAL" || row.status == "CANCEL WAITING") status = "<small class=\"label bg-red\">" + row.status + "</small>";
                                else if(row.status == "EXPIRED") status = "<small class=\"label bg-yellow\">" + row.status + "</small>";
                                else status = "<small class=\"label bg-blue\">" + row.status + "</small>";
                                return status;
                            }
                        }
                    ];
                    
                var columnBestVisit = [
                        {
                            targets: 0,
                            sortable: false,
                            render: function (data, type, row, meta) {
                                return row.brand_name;
                            }
                        },
                        {
                            targets: 1,
                            sortable: false,
                            render: function (data, type, row, meta) {
                                return row.category_name;
                            }
                        },
                        {
                            targets: 2,
                            sortable: true,
                            render: function (data, type, row, meta) {
                                return row.variant_name;
                            }
                        },
                        {
                            targets: 3,
                            sortable: true,
                            render: function (data, type, row, meta) {
                                return row.rental_name;
                            }
                        },
                        {
                            targets: 4,
                            sortable: true,
                            render: function (data, type, row, meta) {
                                return row.rating;
                            }
                        },
                        {
                            targets: 5,
                            sortable: true,
                            render: function (data, type, row, meta) {
                                return row.num_visitor;
                            }
                        }
                    ];
                self._initTableReusable('todaysNewRent', '/home/today-new-rent', columnTodaysRent);
//                self._initTableReusable('bestVisit', '/home/best-visit', columnBestVisit);
                _tableBestVisit = $("#bestVisit").DataTable({
                    "processing": true,
                    "serverSide": true,
                    "ajax": {
                        "url": "/home/best-visit",
                        "data": function(data) {
                            data.filter = $("#searchFilter").val();
                            data.date = $('#date_selected').val();
                        }
                    },
                    columns: [
//                        { width:'20px' },
                        { data:'name' },
                        { width:'sum_obj' },
                    ],
                    columnDefs : columnBestVisit,
                    order: [[ 1, "desc" ]],
                    searching: false
                });

                $('#bestVisit_searchFilter').on('change', function(){
                    table.ajax.reload();
                });
                $('#bestVisit_length').hide();
            },

            _initPieChart: function(id, data){
                var pieChartCanvas = id.get(0).getContext('2d')
                var pieChart       = new Chart(pieChartCanvas)
                var PieData        = data;
                var pieOptions     = {
                    //Boolean - Whether we should show a stroke on each segment
                    segmentShowStroke    : true,
                    //String - The colour of each segment stroke
                    segmentStrokeColor   : '#fff',
                    //Number - The width of each segment stroke
                    segmentStrokeWidth   : 2,
                    //Number - The percentage of the chart that we cut out of the middle
                    percentageInnerCutout: 50, // This is 0 for Pie charts
                    //Number - Amount of animation steps
                    animationSteps       : 100,
                    //String - Animation easing effect
                    animationEasing      : 'easeOutBounce',
                    //Boolean - Whether we animate the rotation of the Doughnut
                    animateRotate        : true,
                    //Boolean - Whether we animate scaling the Doughnut from the centre
                    animateScale         : false,
                    //Boolean - whether to make the chart responsive to window resizing
                    responsive           : true,
                    // Boolean - whether to maintain the starting aspect ratio or not when responsive, if set to false, will take up entire container
                    maintainAspectRatio  : true,
                    //String - A legend template
                }
                //Create pie or douhnut chart
                // You can switch between pie and douhnut using the method below.
                pieChart.Doughnut(PieData, pieOptions)
            },

            _initBarChartReusable: function(container, monthsLabel, data) {
                var self = this;

                var globalData = {
                    labels  : monthsLabel,
                    datasets: [
                        {
                            label               : 'Created',
                            fillColor           : 'rgba(60,141,188,0.9)',
                            strokeColor         : 'rgba(60,141,188,0.8)',
                            pointColor          : '#3b8bba',
                            pointStrokeColor    : 'rgba(60,141,188,1)',
                            pointHighlightFill  : '#fff',
                            pointHighlightStroke: 'rgba(60,141,188,1)',
                            data                : data
                        }
                    ]
                };

                var barChart        = container.get(0).getContext('2d');
                var chart           = new Chart(barChart);
                var chartOptions    = {
                    //Boolean - Whether the scale should start at zero, or an order of magnitude down from the lowest value
                    scaleBeginAtZero        : true,
                    //Boolean - Whether grid lines are shown across the chart
                    scaleShowGridLines      : true,
                    //String - Colour of the grid lines
                    scaleGridLineColor      : 'rgba(0,0,0,.05)',
                    //Number - Width of the grid lines
                    scaleGridLineWidth      : 1,
                    //Boolean - Whether to show horizontal lines (except X axis)
                    scaleShowHorizontalLines: true,
                    //Boolean - Whether to show vertical lines (except Y axis)
                    scaleShowVerticalLines  : true,
                    //Boolean - If there is a stroke on each bar
                    barShowStroke           : true,
                    //Number - Pixel width of the bar stroke
                    barStrokeWidth          : 2,
                    //Number - Spacing between each of the X value sets
                    barValueSpacing         : 5,
                    //Number - Spacing between data sets within X values
                    barDatasetSpacing       : 1,
                    //Boolean - whether to make the chart responsive
                    responsive              : true,
                    maintainAspectRatio     : true
                };

                chartOptions.datasetFill = false;
                chart.Bar(globalData, chartOptions);
            },

            _initTableReusable: function (tId, url, columnDefs) {
                var table = $("#"+tId).DataTable({
                    "processing": true,
                    "serverSide": true,
                    "ajax": {
                        "url": url,
                        "data": function(data) {
                            data.filter = $("#searchFilter").val();
                        }
                    },
                    columns: [
//                        { width:'20px' },
                        { data:'name' },
                        { width:'sum_obj' },
                    ],
                    columnDefs : columnDefs,
                    order: [[ 1, "desc" ]],
                    searching: false
                });

                $('#'+tId+'_searchFilter').on('change', function(){
                    table.ajax.reload();
                });
                $('#'+tId+'_length').hide();
            },

            _clickListener: function() {
                var self = this;
                
//                $('#daterange-btn span').on('change', function(){
//                    console.log($('#daterange-btn span').html());
//                });
            },

            init: function() {
                var self = this;

                self._initialize();
                self._clickListener();
            }
        };

        return handler;
    }
};

$(document).ready(function() {
    
    var homeHandler = HomeHandler.construct();
    homeHandler.init();
    
    
});

$.widget.bridge('uibutton', $.ui.button);
$(function () {});