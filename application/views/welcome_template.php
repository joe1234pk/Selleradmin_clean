<!DOCTYPE html> 
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="tangqiang">

    <title>Selleradmin - Home</title>

    <?php $this->load->view('common_header_template') ?>		
</head>

<body>

    <div id="wrapper">

        <?php $this->load->view('common_navigation_template') ?>

        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">{seller_name}</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-3 col-md-6">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-comments fa-5x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge">321</div>
                                    <div>Upcoming Orders</div>
                                </div>
                            </div>
                        </div>
                        <a href="order">
                            <div class="panel-footer">
                                <span class="pull-left">Review/span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="panel panel-green">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-tasks fa-5x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge">43</div>
                                    <div>Today Products</div>
                                </div>
                            </div>
                        </div>
                        <a href="goods">
                            <div class="panel-footer">
                                <span class="pull-left">Review products</span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="panel panel-yellow">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-shopping-cart fa-5x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge">33</div>
                                    <div>Today Orders</div>
                                </div>
                            </div>
                        </div>
                        <a href="order">
                            <div class="panel-footer">
                                <span class="pull-left">Review</span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="panel panel-red">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-support fa-5x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge">13</div>
                                    <div>Today Income</div>
                                </div>
                            </div>
                        </div>
                        <a href="javascript:;">
                            <div class="panel-footer">
                                <span class="pull-left">/span>
                                <div class="clearfix"></div>
                            </div>
                        </a>
                    </div>
                </div>
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-6">
                    <!-- /.panel -->
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <i class="fa fa-dollar fa-fw"></i> Incomes for the recent 2 weeks
                            <div class="pull-right">
                                <select name="">
                                  
                                </select>
                            </div>
                        </div>
                        <div class="panel-body">
                            <div id="morris-cash"></div>
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-4 -->
                <div class="col-lg-6">
                    <!-- /.panel -->
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <i class="fa fa-bar-chart-o fa-fw"></i> Order for the recent 2 weeks
                            <div class="pull-right">
                                <select name="">
                                  
                                </select>
                            </div>
                        </div>
                        <div class="panel-body">
                            <div id="morris-order"></div>
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-4 -->
            </div>
            <!-- /.row -->
        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->

    <!-- jQuery -->
    <script src="{static_base_url}js/jquery.min.js"></script>
    <!-- Bootstrap Core JavaScript -->
    <script src="{static_base_url}js/bootstrap.min.js"></script>
    <!-- Metis Menu Plugin JavaScript -->
    <script src="{static_base_url}js/metisMenu.min.js"></script>
    <script src="{static_base_url}js/raphael.min.js"></script>
    <script src="{static_base_url}js/morris.min.js"></script>
    <!-- Custom Theme JavaScript -->
    <script src="{static_base_url}js/sb-admin-2.js"></script>
    <script>
        $(function(){
            $(function() {
                //最近两周订单
                Morris.Bar({
                    element: 'morris-order',
                    data: [{
                        y: '上周',
                        a: 100
                    }, {
                        y: '本周',
                        a: 75
                    }],
                    xkey: 'y',
                    ykeys: ['a'],
                    labels: ['订单量'],
                    barColors:['#337ab7'],
                    hideHover: false,
                    resize: true
                });

                //最近两周收入
                Morris.Bar({
                    element: 'morris-cash',
                    data: [{
                        y: '上周',
                        a: 1000
                    }, {
                        y: '本周',
                        a: 750
                    }],
                    xkey: 'y',
                    ykeys: ['a'],
                    labels: ['收入'],
                    barColors:['#5cb85c'],
                    hideHover: false,
                    resize: true
                });
                
            });

        })
    </script>
   
</body>

</html>