<!-- INDEX USUARIO -->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*" session="true"%> 
<%
    //MANEJO DE SESIONES DE USUARIO
    HttpSession sesion=request.getSession();
    if(sesion.getAttribute("iduser")==null && sesion.getAttribute("usuario")==null){
         response.sendRedirect("../");
    }
    else{
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../dist/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
        <link href="../dist/toastr/toastr.min.css" rel="stylesheet" media="screen">
        <link href="../dist/bootstrap/css/simple-sidebar.css" rel="stylesheet" media="screen">
        <script type="text/JavaScript" src="../dist/jquery/jquery-2.1.4.min.js"></script>
        <script type="text/JavaScript" src="../dist/bootstrap/js/bootstrap.min.js"></script>
        <script type="text/JavaScript" src="../dist/toastr/toastr.min.js"></script>
        <script type="text/JavaScript" src="../dist/toastr/configToastr.js"></script>
        <link rel="shortcut icon" href="../dist/images/avion_icon.ico" type='image/x-icon'>
        <title>AMADEUS AIRLINES</title>
        <script>
            $(document).ready(function() {
                toastr.info('Usuario: <%= sesion.getAttribute("nombre") %>','AMADEUS AIRLINES');
            });
        </script>
    </head>
    <body>
        <div class="container-fluid">
            <div class="row">
                <div id="wrapper">
                    <div id="sidebar-wrapper">
                        <ul class="sidebar-nav">
                            <li class="sidebar-brand">
                                <a href="#"><img src="../dist/images/logo.png" width="200" height="60" ></a>
                            </li>                           
                            <li style="border-left: 6px solid #ff0039;" class="menucolor" id="opc1">
                                <a href="#">Vuelos Disponibles</a>
                            </li>
                            <li style="border-left: 6px solid #000;" class="menucolor" id="opc2">
                                <a href="#">Estado de Vuelos</a>
                            </li>
                            <li style="border-left: 6px solid #000;" class="menucolor" id="opc3">
                                <a href="#">Crear Reservaci&oacute;n</a>
                            </li>
                            <li style="border-left: 6px solid #000;" class="menucolor" id="opc4">
                                <a href="#">Mis Reservaciones</a>
                            </li>
                            <li style="border-left: 6px solid #000;" class="menucolor" id="opc5">
                                <a href="#">Check-in</a>
                            </li>
                            <li style="border-left: 6px solid #000;">
                                <a href="../class/cerrar_sesion.jsp">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="glyphicon glyphicon-lock"></span> Cerrar sesi&oacute;n</a>
                            </li>       
                        </ul>
                    </div>
                    <script type="text/JavaScript" src="menu.js"></script>
                    <!-- CONTENIDO DE PAGINA -->
                    <div id="page-content-wrapper">
                        <!-- HEADER DE CONTENIDO -->
                        <div class="row">
                            <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">                                    
                                <a href="#menu-toggle" class="btn btn-primary btn-md" id="menu-toggle"><span class="glyphicon glyphicon-menu-hamburger"></span></a>
                            </div>
                            <div class="col-lg-10 col-md-10 col-sm-10 col-xs-10">
                                <h4 style="text-align: right;" id="tituloOpc">VUELOS DISPONIBLES</h4>
                            </div>
                        </div>
                        <hr>
                        <!-- CONTENIDO -->
                        <div class="row">
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" id="contenidoOpc">
                                <jsp:include page="../vuelos/disponibles.jsp" flush="true" />
                            </div>  
                        </div>
                    </div>
                    <!-- /# CONTENIDO DE PAGINA -->
                </div>
                <script>
                $("#menu-toggle").click(function(e) {
                    e.preventDefault();
                    $("#wrapper").toggleClass("toggled");
                });
                </script>                
            </div>
        </div>
    </body>
</html>
<%
    }
%>