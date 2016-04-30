<!-- LOGIN INDEX -->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="dist/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
        <link href="dist/toastr/toastr.min.css" rel="stylesheet" media="screen">
        <link href="dist/bootstrap/css/simple-sidebar.css" rel="stylesheet" media="screen">
        <script type="text/JavaScript" src="dist/jquery/jquery-2.1.4.min.js"></script>
        <script type="text/JavaScript" src="dist/bootstrap/js/bootstrap.min.js"></script>
        <script type="text/JavaScript" src="dist/toastr/toastr.min.js"></script>
        <script type="text/JavaScript" src="dist/toastr/configToastr.js"></script>
        <link rel="shortcut icon" href="dist/images/avion_icon.ico" type='image/x-icon'>
        <title>AMADEUS AIRLINES</title>     
        <%
            String err="No Error";          
            if(request.getParameter("err")!=null){
                err=request.getParameter("err");
            }
            if(err.equals("1")){
                out.println("<script>$(document).ready(function() {toastr.info(\"<center>USUARIO O CONTRASE&Ntilde;A INCORRECTO</center>\"); });</script>");
            }
            if(err.equals("2")){
                out.println("<script>$(document).ready(function() {toastr.info(\"<center>USUARIO UNICAMENTE CLIENTE</center>\"); });</script>");
            }
        %>
    </head>
    <body>
    <div class="container-fluid">
    <div class="row">  
        <!-- NAVBAR -->
        <nav class="navbar navbar-default navbar-fixed-top">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#btncollapse" aria-expanded="false">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                     </button>
                    <a class="navbar-brand" href="#"><img src="dist/images/nav-avion.png" width="20" height="20"></a>
                    <a class="navbar-brand" href="#">Amadeus Airlines</a>
                </div>
                <div class="collapse navbar-collapse" id="btncollapse">
                    <form class="navbar-form navbar-right" method="post" action="class/sesion.jsp">
                        <div class="form-group">
                            <input type="text" class="form-control input-sm" name="usuario" placeholder="Usuario">
                        </div>
                        <div class="form-group">
                            <input type="password" class="form-control input-sm" name="pass" placeholder="Contrase&ntilde;a">
                        </div>
                        <div class="form-group">
                            <center>
                            <button type="submit" class="btn btn-danger btn-sm">Iniciar Sesi&oacute;n</button>
                            <a href="registro/" class="btn btn-primary btn-sm">Registrarse</a>
                            </center>
                        </div>
                    </form>                
                </div>
            </div>
        </nav>
        <br><br>
        <!-- CAROUSEL -->
        <div id="carouselAmadeus" class="carousel slide" data-ride="carousel">
            <!-- Indicators -->
            <ol class="carousel-indicators">
                <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                <li data-target="#carousel-example-generic" data-slide-to="2"></li>
            </ol>
            <div class="carousel-inner" role="listbox">
                <div class="item active">
                    <img src="dist/images/slide1.png" class="img-responsive">
                    <div class="carousel-caption">
                        <h2>AMADEUS AIRLINES</h2>
                        <h3>Conoce la ciudad de tus sue&ntilde;os</h3>
                    </div>
                </div>
                <div class="item">
                    <img src="dist/images/slide2.png" class="img-responsive">
                    <div class="carousel-caption">
                        <h2>AMADEUS AIRLINES</h2>
                        <h3>Visita lo hermoso de la naturaleza</h3>
                    </div>
                </div>
                <div class="item">
                    <img src="dist/images/slide3.png" class="img-responsive">
                    <div class="carousel-caption">
                        <h2>AMADEUS AIRLINES</h2>
                        <h3>Estamos para servirte</h3>
                    </div>
                </div>
            </div>
            <a class="left carousel-control" href="#carouselAmadeus" role="button" data-slide="prev">
                <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="right carousel-control" href="#carouselAmadeus" role="button" data-slide="next">
                <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>            
        </div>
        <section style="background-color: #ff0039;">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-10 col-lg-offset-1 text-center">
                        <h2 style="color:white;">AMADEUS AIRLINES</h2>
                        <hr style="border: 3px solid white; width: 10%;">
                        <p style="color:white;">Viaje con nosotros, registrate ahora para poder ver todas la rutas y vuelos disponibles,precios y promociones especiales.</p>
                        <h3 style="color:white;">Vuela con nosotros!</h3>
                        <a class="btn btn-primary btn-xl" href="registro/" style="color:white;">Resgistrarse</a>                        
                    </div>
                </div>
            </div>
            <br>
        </section>
        <section>
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-8 col-lg-offset-2 text-center">
                        <h2>AMADEUS AIRLINES LO QUE NECESITAS!</h2>
                        <hr style="border: 3px solid #ff0039; width: 10%;">
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-4 col-md-4 col-sm-12">
                        <br><br>
                        <center>
                            <img src="dist/images/viaje.png" class="img-responsive" width="170" height="125">
                            <h3>VIAJA SEGURO</h3>
                            <p>Flota de aviones con el mejor mantenimiento para evitar inconvenientes con tu vuelo.</p>
                        </center>
                    </div>
                    <div class="col-lg-4 col-md-4 col-sm-12">
                        <center>
                            <img src="dist/images/tiempo.png" class="img-responsive" width="125" height="125">
                            <h3>VUELOS A TIEMPO</h3>
                            <p>El 95% de nuestros vuelos son muy puntuales en los horarios establecidos.</p>
                        </center>
                    </div>
                    <div class="col-lg-4 col-md-4 col-sm-12">
                        <center>
                            <img src="dist/images/servicio.png" class="img-responsive" width="125" height="125">
                            <h3>SERVICIO EN VUELO</h3>
                            <p>Servicio de atenci&oacute;n personalizado para los clientes durante el vuelo.</p>
                        </center>
                    </div>
                </div>
            </div>
            <br>
        </section>        
        <section style="background-color: #000;">
            <div class="container-fluid">
            <div class="row">
                <div class="col-lg-8 col-lg-offset-2 text-center">
                    <h2 style="color:white;">CONTACTOS AMADEUS AIRLINES</h2>
                    <hr style="border: 3px solid #ff0039; width: 10%;">
                    <center><h5 style="color: white;"><span class="glyphicon glyphicon-phone"></span> Telefono: (503) 2000-0000 &nbsp;&nbsp;&nbsp;&nbsp;<span class="glyphicon glyphicon-envelope"></span> Correo: amadeusair.info@gmail.com</h5></center>
                </div>
            </div>
            </div>
        </section>
    </div>
    </div>
    </body>
</html>
