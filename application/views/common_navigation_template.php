<!-- Navigation -->
<nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
    <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand" href="index.html">Selleradmin</a>
    </div>
    <!-- /.navbar-header -->
    <ul class="nav navbar-top-links navbar-right">
           <li class="dropdown">
            <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                <i class="fa fa-user fa-fw"></i> <i class="fa fa-caret-down"></i>
            </a>
            <ul class="dropdown-menu dropdown-user">
                <li><a href="logout"><i class="fa fa-sign-out fa-fw"></i> quit</a>
                </li>
            </ul>
            <!-- /.dropdown-user -->
        </li>
        <!-- /.dropdown -->
    </ul>
    <!-- /.navbar-top-links -->
    <!--implement php code to load seller_name-->
    <div class="navbar-default sidebar" role="navigation">
        <div class="sidebar-nav navbar-collapse">
            <ul class="nav" id="side-menu">
                <li class="show-logo">
                    <img src="{logo_url}" alt="">
                    <div style="font-size: 20px;color: #F0AD4E">{seller_name}</div>
                </li>
                <li>
                    <a href="welcome"><i class="fa fa-dashboard fa-fw"></i> Home</a>
                </li>
            
                <li>
                    <a href="shop"><i class="fa fa-edit fa-fw"></i> Shop Setting</a>
                </li>
                <li>
                    <a href="#"><i class="fa fa-files-o fa-fw"></i> Shop menu mangement<span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <li><a href="items_test">Shop products</a></li>
                        <!--<li><a href="add_item">新增商品</a></li>-->
                    </ul>
                </li>
                <li>
                    <a href="#"><i class="fa fa-sitemap fa-fw"></i> Categories management <span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <li>
                            <a href="item_category">Products catgory </a>
                        </li>
                        <li>
                            <a href="add_item_category">Add new category</a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="#"><i class="fa fa-gear fa-fw"></i> password setting<span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <li>
                            <a href="change_passwd">change password</a>
                        </li>                        
                    </ul>
                </li>
            </ul>
        </div>
        <!-- /.sidebar-collapse -->
    </div>
    <!-- /.navbar-static-side -->
</nav>