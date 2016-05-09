<!-- CHECK-IN -->
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
<br><br><br>
<div class="row">
    <div class="col-lg-4 col-lg-offset-4 col-md-4 col-md-offset-4 col-sm-12">
        <center>
            <h4><img src="../dist/images/avion.png" width="35" height="35"> Ingrese c&oacute;digo de reserva:</h4>
            <br>
            <input type="text" pattern="[A-Z]{8}" id="codIngresado" class="form-control input-sm">
            <br>
            <button class="btn btn-danger" id="enviar">Continuar</button>
            <script>
                $("#enviar").click(function() {
                    var codigo= $("#codIngresado").val();
                    if(codigo!= ""){
                        $("#contenidoOpc").html("<br><br><br><center><img src=\"../dist/images/loader.gif\" width=\"25\" height=\"27\"><p>Cargando . . .</p></center>");
                        $.post("../check-in/comprueba_checkin.jsp",{codigo:codigo})
                        .done(function( data ) {
                            $("#contenidoOpc").html(data);
                        });
                    }
                });
            </script>
        </center>
    </div>
</div>
<%
    }
%>