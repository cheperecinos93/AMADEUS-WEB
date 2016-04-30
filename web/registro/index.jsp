<!-- REGISTRO -->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <link rel="shortcut icon" href="../dist/images/avion_icon.ico" type='image/x-icon'>
        <title>AMADEUS AIRLINES</title>        
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
                        <a class="navbar-brand" href="#"><img src="../dist/images/nav-avion.png" width="20" height="20"></a>
                        <a class="navbar-brand" href="#">Amadeus Airlines</a>
                    </div>
                    <div class="collapse navbar-collapse" id="btncollapse">
                        <ul class="navbar-form navbar-right">
                            <li><a href="../" class="btn btn-warning btn-sm"><span class="glyphicon glyphicon-refresh"></span> Regresar</a></li>
                        </ul>                
                    </div>
                </div>
            </nav>
            </div>
            <br><br><br><br>
            <!-- FORMULARIO DE REGISTRO -->
            <div class="row">
                <div class="col-lg-6 col-lg-offset-3 col-md-6 col-md-offset-3 col-sm-12 col-xs-12">
                    <form>
                    <div class="well well-sm">
                        <div class="row">
                        <div class="col-lg-10 col-lg-offset-1 col-md-10 col-md-offset-1 col-sm-12 col-xs-12">
                        <center><h4><b>REGISTRO DE CLIENTE</b></h4></center>
                        <center><img src="../dist/images/logo_negro.png"></center>
                        <br>
                        <div class="input-group">
                            <span class="input-group-addon input-sm"><span class="glyphicon glyphicon-user"></span> Nombre:</span>
                            <input type="text" class="form-control input-sm" id="nombre" name="nombre" required>
                        </div>
                        <br>
                        <div class="input-group">
                            <span class="input-group-addon input-sm"><span class="glyphicon glyphicon-envelope"></span> Correo:</span>
                            <input type="email" class="form-control input-sm" id="correo" name="correo" required>
                        </div>
                        <br>
                        <div class="input-group">
                            <span class="input-group-addon input-sm"><span class="glyphicon glyphicon-user"></span> Usuario:</span>
                            <input type="text" class="form-control input-sm" id="usuario" name="usuario" required>
                        </div>
                        <br>
                        <div class="row">
                            <div class="col-lg-6 col-md-6 col-sm-6">
                            <div class="input-group">
                                <span class="input-group-addon input-sm"><span class="glyphicon glyphicon-lock"></span> Contrase&ntilde;a:</span>
                                <input type="password" class="form-control input-sm" id="pass" name="pass" required>
                            </div>
                            </div>
                            <div class="col-lg-6 col-md-6 col-sm-6">
                            <div class="input-group">
                                <span class="input-group-addon input-sm"><span class="glyphicon glyphicon-lock"></span> Confirmar:</span>
                                <input type="password" class="form-control input-sm" id="confipass" name="confipass" required>
                            </div>
                            </div>
                        </div>
                        <br>
                        <div class="input-group">
                            <span class="input-group-addon input-sm"><span class="glyphicon glyphicon-phone-alt"></span> Telefono:</span>
                            <input type="text" class="form-control input-sm" id="telefono" name="telefono" required>
                        </div>
                        <br>
                        <div class="input-group">
                            <span class="input-group-addon input-sm"><span class="glyphicon glyphicon-plane"></span> Pasaporte:</span>
                            <input type="text" class="form-control input-sm" id="pasaporte" name="pasaporte" required>
                        </div>
                        <br>
                        <div class="input-group">
                            <span class="input-group-addon input-sm"><span class="glyphicon glyphicon-credit-card"></span> Tarjeta de credito:</span>
                            <input type="text" class="form-control input-sm" id="tcredito" name="tcredito" required>
                        </div>
                        <br>
                        <center><button class="btn btn-danger btn-md" type="submit">Registrarse</button></center>
                        <br>
                        </div>
                        </div>
                    </div>
                    </form>
                </div>
            </div>
            <br>
            <!-- FOOTER DE PAGINA -->
            <div class="row">
            <section style="background-color: #000;">
            <br>
            <div class="container-fluid">
            <div class="row">
                <div class="col-lg-8 col-lg-offset-2 text-center">
                    <center><h5 style="color: white;">Amadeus Airlines <span class="glyphicon glyphicon-copyright-mark"></span></h5></center>
                </div>
            </div>
            </div>
            <br>
            </section>
            </div>
        </div>
    </body>
</html>
