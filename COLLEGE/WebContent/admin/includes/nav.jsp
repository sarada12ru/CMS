	<div class="header-top-area">
        <div class="container">
            <div class="row">
                <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                    <div class="logo-area">
                    	<span style="color:white;font-size:200%;font-family:Baskerville Bold;font-weight:bold">ADMIN</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End Header Top Area -->
    <!-- Mobile Menu start -->
    <div class="mobile-menu-area">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="mobile-menu">
                        <nav id="dropdown">
                            <ul class="mobile-menu-nav">
                                <li><a data-toggle="collapse" data-target="#Charts" href="#">Student</a>
                                    <ul class="collapse dropdown-header-top">
                                        <li><a href="RegisterStudent.jsp">Register Student</a></li>
                                        <li><a href="ViewStudentRecords.jsp">View Student Records</a></li>
                                        <li><a href="ViewParticularStudent.jsp">View Particular Student</a></li>
                                        <li><a href="ViewStudentAttendance.jsp">View Attendance of Students</a></li>
                                        <li><a href="UpdateSemester.jsp">Update Semester</a></li>
                                    </ul>
                                </li>
                                <li><a data-toggle="collapse" data-target="#demoevent" href="#">Faculty</a>
                                    <ul id="demoevent" class="collapse dropdown-header-top">
                                        <li><a href="RegisterFaculty.jsp">Register Faculty</a></li>
                                        <li><a href="ViewFacultyRecords.jsp">View faculty</a></li>
                                        <li><a href="ViewParticularFaculty.jsp">View Particular Faculty</a></li>
                                        <li><a href="ViewFacultyAttendance.jsp">View Faculty Attendance</a></li>
                                        <li><a href="UpdateFaculty.jsp">Update Faculty</a></li>
                                    </ul>
                                </li>
                                <li><a data-toggle="collapse" data-target="#notice" href="#">Faculty</a>
                                	<ul id="notice" class="collapse dropdown-header-top">
                                        <li><a href="NoticeToAll.jsp">Notice For All</a></li>
                                        <li><a href="NoticeToStudent.jsp">Notice For Students</a></li>
                                        <li><a href="NoticeToFaculty.jsp">Notice For faculties</a></li>
                                    </ul>
                                </li>
                                <li><a href="logout.jsp">logout</a></li>
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Mobile Menu end -->
    <!-- Main Menu area start-->
    <div class="main-menu-area mg-tb-40">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <ul class="nav nav-tabs notika-menu-wrap menu-it-icon-pro">
                        <li><a data-toggle="tab" href="#Home"> Student</a>
                        </li>
                        <li><a data-toggle="tab" href="#mailbox"> Faculty</a>
                        </li>
                        <li><a data-toggle="tab" href="#notices"> Notice</a>
                        </li>
                        <li><a href="logout.jsp"> Logout</a>
                        </li>
                    </ul>
                    <div class="tab-content custom-menu-content">
                        <div id="Home" class="tab-pane in active notika-tab-menu-bg animated flipInX">
                            <ul class="notika-main-menu-dropdown">
                                <li><a href="RegisterStudent.jsp">Register Student</a></li>
                                <li><a href="ViewStudentRecords.jsp">View Student Records</a></li>
                                <li><a href="ViewParticularStudent.jsp">View Particular Student</a></li>
                                <li><a href="ViewStudentAttendance.jsp">View Attendance of Students</a></li>
                                <li><a href="UpdateSemester.jsp">Update Semester</a></li>
                            </ul>
                        </div>
                        <div id="mailbox" class="tab-pane notika-tab-menu-bg animated flipInX">
                            <ul class="notika-main-menu-dropdown">
                                <li><a href="RegisterFaculty.jsp">Register Faculty</a></li>
                                <li><a href="ViewFacultyRecords.jsp">View faculty</a></li>
                                <li><a href="ViewParticularFaculty.jsp">View Particular Faculty</a></li>
                                <li><a href="ViewFacultyAttendance.jsp">View Faculty Attendance</a></li>
                                <li><a href="UpdateFaculty.jsp">Update Faculty</a></li>
                            </ul>
                        </div>
                        <div id="notices" class="tab-pane notika-tab-menu-bg animated flipInX">
                        	<ul class="notika-main-menu-dropdown">
                        		<li><a href="NoticeToAll.jsp">Notice For All</a></li>
                                <li><a href="NoticeToStudent.jsp">Notice For Students</a></li>
                                <li><a href="NoticeToFaculty.jsp">Notice For faculties</a></li>
                        	</ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Main Menu area End-->