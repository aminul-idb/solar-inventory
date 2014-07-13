<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>INVENTORY |Japan Solar Tech.</title>

    <asset:stylesheet src="bootstrap.min.css"/>
    <asset:stylesheet src="font-awesome.css"/>
    <asset:stylesheet src="style.css"/>
    %{--<asset:stylesheet src="application.css"/>--}%

    <asset:javascript src="application.js"/>
    <asset:javascript src="bootstrap.min.js"/>
    <asset:javascript src="jquery.metisMenu.js"/>
    <asset:javascript src="inspinia.js"/>

    <style>
    html, body, .container, .content {
        height: 100%;
    }

    .container, .content {
        position: relative;
    }

    .proper-content {
        padding-top: 40px; /* >= navbar height */
    }

    .wrapper {
        min-height: 100%;
        height: auto !important;
        height: 100%;
        margin: 0 auto -50px; /* same as the footer */
    }

    .push {
        height: 50px; /* same as the footer */
    }
    .footer-wrapper {
        position: relative;
        height: 50px;
    }
    #footer {
        background-color:#064244;
    }
    </style>

</head>

<body>

<div id="wrapper">

    <nav class="navbar-default navbar-static-side" role="navigation">
        <div class="sidebar-collapse">
            <ul class="nav" id="side-menu">

                <div class="dropdown profile-element">
                    <span>
                        <img alt="image" class="img-responsive img-thumbnail" src="p6.jpg">
                    </span>
                </div>

                <li class="active">
                    <a href="#"><i class="fa fa-bar-chart-o"></i> <span class="nav-label">Graphs</span><span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <li><a href="graph_flot.html">Flot Charts</a></li>
                        <li><a href="graph_morris.html">Morris.js Charts</a></li>
                        <li><a href="graph_rickshaw.html">Rickshaw Charts</a></li>
                        <li><a href="graph_peity.html">Peity Charts</a></li>
                        <li><a href="graph_sparkline.html">Sparkline Charts</a></li>
                    </ul>
                </li>
                <li>
                    <a href="mailbox.html"><i class="fa fa-envelope"></i> <span class="nav-label">Mailbox </span><span class="label label-warning pull-right">16/24</span></a>
                    <ul class="nav nav-second-level">
                        <li><a href="mailbox.html">Inbox</a></li>
                        <li><a href="mail_detail.html">Email view</a></li>
                        <li><a href="mail_compose.html">Compose email</a></li>
                    </ul>
                </li>
                <li>
                    <a href="widgets.html"><i class="fa fa-flask"></i> <span class="nav-label">Widgets</span> <span class="label label-info pull-right">NEW</span></a>
                </li>
                <li>
                    <a href="#"><i class="fa fa-edit"></i> <span class="nav-label">Forms</span><span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <li><a href="form_basic.html">Basic form</a></li>
                        <li><a href="form_advanced.html">Advanced Plugins</a></li>
                        <li><a href="form_wizard.html">Wizard</a></li>
                        <li><a href="form_file_upload.html">File Upload</a></li>
                        <li><a href="form_editors.html">Text Editor</a></li>
                    </ul>
                </li>
                <li>
                    <a href="#"><i class="fa fa-desktop"></i> <span class="nav-label">App Views</span>  <span class="pull-right label label-primary">SPECIAL</span></a>
                    <ul class="nav nav-second-level">
                        <li><a href="contacts.html">Contacts</a></li>
                        <li><a href="profile.html">Profile</a></li>
                        <li><a href="file_manager.html">File manager</a></li>
                        <li><a href="calendar.html">Calendar</a></li>
                        <li><a href="timeline.html">Timeline</a></li>
                        <li><a href="pin_board.html">Pin board</a></li>
                        <li><a href="invoice.html">Invoice</a></li>
                        <li><a href="login.html">Login</a></li>
                        <li><a href="register.html">Register</a></li>
                    </ul>
                </li>
                <li>
                    <a href="#"><i class="fa fa-files-o"></i> <span class="nav-label">Other Pages</span><span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <li><a href="search_results.html">Search results</a></li>
                        <li><a href="lockscreen.html">Lockscreen</a></li>
                        <li><a href="404.html">404 Page</a></li>
                        <li><a href="500.html">500 Page</a></li>
                        <li><a href="empty_page.html">Empty page</a></li>
                    </ul>
                </li>

                <li>
                    <a href="#"><i class="fa fa-flask"></i> <span class="nav-label">UI Elements</span><span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <li><a href="typography.html">Typography</a></li>
                        <li><a href="icons.html">Icons</a></li>
                        <li><a href="draggable_panels.html">Draggable Panels</a></li>
                        <li><a href="buttons.html">Buttons</a></li>
                        <li><a href="tabs_panels.html">Tabs & Panels</a></li>
                        <li><a href="notifications.html">Notifications & Tooltips</a></li>
                        <li class="active"><a href="badges_labels.html">Badges, Labels, Progress</a></li>
                    </ul>
                </li>
                <li>
                    <a href="#"><i class="fa fa-laptop"></i> <span class="nav-label">Layout</span><span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <li><a href="grid_options.html">Grid options</a></li>
                        <li><a href="boxed_layout.html">Boxed layout</a></li>
                    </ul>
                </li>
                <li>
                    <a href="#"><i class="fa fa-table"></i> <span class="nav-label">Tables</span><span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <li><a href="table_basic.html">Static Tables</a></li>
                        <li><a href="table_data_tables.html">Data Tables</a></li>
                    </ul>
                </li>
                <li>
                    <a href="#"><i class="fa fa-picture-o"></i> <span class="nav-label">Gallery</span><span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <li><a href="basic_gallery.html">Basic Gallery</a></li>
                        <li><a href="carousel.html">Bootstrap Carusela</a></li>

                    </ul>
                </li>

            </ul>

        </div>
    </nav>

    <div id="page-wrapper" class="gray-bg">
        <div class="row border-bottom">
            <nav class="navbar navbar-static-top" role="navigation" style="margin-bottom: 0">
                <div class="navbar-header">
                    <a class="navbar-minimalize minimalize-styl-2 btn btn-primary " href="#"><i class="fa fa-bars"></i> </a>
                </div>
                <ul class="nav navbar-top-links navbar-right">
                    <li>
                        <h3> <span class="m-r-sm text-muted welcome-message">Welcome to Japan Solar Tech.</span> </h3>
                    </li>
                    <li>
                        <a href="login.html">
                            <i class="fa fa-sign-out"></i> Log out
                        </a>
                    </li>
                </ul>
            </nav>
        </div>
    </div>

    <footer id="footer">
        <div class="container">
            <div class="row">
                <div class="col-md-3 col">
                    <div class="block contact-block">
                        <h3>
                            Contact Us
                        </h3>
                        <address>
                            <ul class="fa-ul">
                                <li>
                                    <abbr title="Phone"><i class="fa fa-li fa-phone"></i></abbr>
                                    019223 8092344
                                </li>
                                <li>
                                    <abbr title="Email"><i class="fa fa-li fa-envelope"></i></abbr>
                                    info@appstraptheme.com
                                </li>
                            </ul>
                        </address>
                    </div>
                </div>

                <div class="col-md-5 col">
                    <div class="block">
                        <h3>
                            About Us
                        </h3>
                        <p>Making the web a prettier place one template at a time! We make beautiful, quality, responsive Drupal & web templates!</p>
                    </div>
                </div>

                <div class="col-md-4 col">
                    <div class="block newsletter">
                        <h3>
                            Newsletter
                        </h3>
                        <p>Stay up to date with our latest news and product releases by signing up to our newsletter.</p>
                    </div>
                </div>
              </div>
            </div>
    </footer>

</div>
</body>

</html>
