<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@tag description="The template for the front-end" pageEncoding="UTF-8" %>
<%-- The list of normal or fragment attributes can be specified here: --%>
<%@attribute name="head_area" fragment="true" %>
<%@attribute name="body_area" fragment="true" required="true" %>
<%@attribute name="javascript" fragment="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Driveup Url Uploader</title>
    <!-- Custom fonts for this template-->
    <link href="https://startbootstrap.github.io/startbootstrap-sb-admin-2/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"  rel="stylesheet">
    <!-- Custom styles for this template-->
    <link href="https://driveup.in/assets/css/sb-admin-2.min.css" rel="stylesheet">
    <script async src="https://www.googletagmanager.com/gtag/js?id=UA-124794008-20"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'UA-124794008-20');
</script>
    <jsp:invoke fragment="head_area"/>
</head>
<body id="page-top">
<style>
    .bg-gradient-primary {
    background-color: #4e73df;
    background-image: linear-gradient(
180deg
,#4e73df 10%,#224abe 100%);
    background-size: cover;
}
</style>
    <!-- Page Wrapper -->
    <div id="wrapper">
        <!-- Sidebar -->
        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">
            <!-- Sidebar - Brand -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="#">
                <div class="sidebar-brand-icon rotate-n-15">
                    <i class="fas fa-laugh-wink"></i>
                </div>
                <div class="sidebar-brand-text mx-3">Driveup<sup>Pro</sup></div>
            </a>
            <!-- Divider -->
            <hr class="sidebar-divider my-0">
            <!-- Nav Item - Dashboard -->
	    <c:choose>
	     <c:when test='${empty(user)}'>
            <li class="nav-item active">
                <a class="nav-link" href="/api/oauth/google/redirect">
                    <i class="fa fa-fw fa-google"></i>
                    <span>Login</span></a>
            </li>
	    </c:when>
                        <c:otherwise>
			<li class="nav-item active">
                <a class="nav-link" href="/api/oauth/google/redirect">
                    <i class="fas fa-fw fa-user"></i>
                    <span>Switch Users</span></a>
            </li>
			</c:otherwise>
	                </c:choose>
            <li class="nav-item active">
                <a class="nav-link" href="/new_upload">
                    <i class="fas fa-fw fa-hdd"></i>
                    <span>New Upload</span></a>
            </li>
            <li class="nav-item active">
                <a class="nav-link" href="/uploads">
                    <i class="fas fa-fw fa-upload"></i>
                    <span>My Uploads</span></a>
            </li>
            <li class="nav-item active">
                <a class="nav-link" href="https://codeslide.in">
                    <i class="fa fa-envelope"></i>
                    <span>Contact</span></a>
            </li>
        </ul>
        <!-- End of Sidebar -->
        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">
            <!-- Main Content -->
            <div id="content">
                <!-- Topbar -->
                <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">
                    <!-- Sidebar Toggle (Topbar) -->
                    <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                        <i class="fa fa-bars"></i>
                    </button>
                    <!-- Topbar Search -->
                    <form
                        class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
                        <div class="input-group">
                            <input type="text" class="form-control bg-light border-0 small" placeholder="Search for..."
                                aria-label="Search" aria-describedby="basic-addon2">
                            <div class="input-group-append">
                                <button class="btn btn-primary" type="button">
                                    <i class="fas fa-search fa-sm"></i>
                                </button>
                            </div>
                        </div>
                    </form>
                    <!-- Topbar Navbar -->
                    <ul class="navbar-nav ml-auto">
                        <!-- Nav Item - Search Dropdown (Visible Only XS) -->
                        <li class="nav-item dropdown no-arrow d-sm-none">
                            <a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fas fa-search fa-fw"></i>
                            </a>
                        </li>
                        <div class="topbar-divider d-none d-sm-block"></div>
                        <!-- Nav Item - User Information -->
                        <li class="nav-item dropdown no-arrow">
                            <c:choose>
	                        <c:when test='${empty(user)}'>
                            <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <span class="mr-2 d-none d-lg-inline text-gray-600 small">Guest</span>
                                <img class="img-profile rounded-circle"
                                    src="https://startbootstrap.github.io/startbootstrap-sb-admin-2/img/undraw_profile.svg">
                            </a>
                            </c:when>
                        <c:otherwise>
                            <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <span class="mr-2 d-none d-lg-inline text-gray-600 small"><c:out value='${user.name}'/></span>
                                <img class="img-profile rounded-circle"
                                    src="${user.profilePhotoUrl}">
                            </a>
                            <!-- Dropdown - User Information -->
                            <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                aria-labelledby="userDropdown">
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="/api/oauth/google/redirect" data-toggle="modal" data-target="#logoutModal">
                                    <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Logout
                                </a>
                            </div>
                            </c:otherwise>
	                </c:choose>
                        </li>
                    </ul>
                </nav>
                <!-- End of Topbar -->
                <!-- Begin Page Content -->
                <div class="container-fluid" id="content-inner">
                    
                    <jsp:invoke fragment="body_area"/>
                    <div class="push"></div>
                </div><br>
                
<!-- Footer -->
<footer class="sticky-footer bg-white">
    <div class="container my-auto">
        <div class="copyright text-center my-auto">
            <span>Copyright &copy; Driveup 2021</span>
        </div>
    </div>
</footer>
<!-- End of Footer -->
  <!-- Bootstrap core JavaScript-->
    <script src="https://startbootstrap.github.io/startbootstrap-sb-admin-2/vendor/jquery/jquery.min.js"></script>
    <script src="https://startbootstrap.github.io/startbootstrap-sb-admin-2/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <!-- Core plugin JavaScript-->
    <script src="https://startbootstrap.github.io/startbootstrap-sb-admin-2/vendor/jquery-easing/jquery.easing.min.js"></script>
    <!-- Custom scripts for all pages-->
    <script src="https://startbootstrap.github.io/startbootstrap-sb-admin-2/js/sb-admin-2.min.js"></script>
    <!-- Page level plugins -->
    <script src="https://startbootstrap.github.io/startbootstrap-sb-admin-2/vendor/chart.js/Chart.min.js"></script>
    <!-- Page level custom scripts -->
    <script src="https://startbootstrap.github.io/startbootstrap-sb-admin-2/js/demo/chart-area-demo.js"></script>
    <script src="https://startbootstrap.github.io/startbootstrap-sb-admin-2/js/demo/chart-pie-demo.js"></script>
<script src="https://cdn.jsdelivr.net/gh/ParveenBhadooOfficial/Bhadoo-Cloud-Drive/src/main/resources/static/js/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/gh/ParveenBhadooOfficial/Bhadoo-Cloud-Drive/src/main/resources/static/js/tether.min.js"></script>
<script src="https://cdn.jsdelivr.net/gh/ParveenBhadooOfficial/Bhadoo-Cloud-Drive/src/main/resources/static/js/jquery.cookie.js"></script>
<script src="https://cdn.jsdelivr.net/gh/ParveenBhadooOfficial/Bhadoo-Cloud-Drive/src/main/resources/static/js/jquery.validate.min.js"></script>
<script src="https://cdn.jsdelivr.net/gh/ParveenBhadooOfficial/Bhadoo-Cloud-Drive/src/main/resources/static/js/front.js"></script>
<script src="https://cdn.jsdelivr.net/gh/ParveenBhadooOfficial/Bhadoo-Cloud-Drive/src/main/resources/static/js/sticky-footer.js"></script>
<jsp:invoke fragment="javascript"/>
</body>

</html>
