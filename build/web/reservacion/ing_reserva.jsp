<%@page import="java.util.*" session="true"%>
<%@page import="config.*" %>
<%@page import="java.sql.*" %>

<%
    HttpSession sesion = request.getSession();
    String codigo = "";
    String[] letras = {"A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"};
    Random r = new Random();
    int v1;
    for (int i = 0; i < 8; i++) {
        v1 = r.nextInt(26);
        codigo = codigo + letras[v1];
    }
    database db = new database();
    db.conectar();
    String idvuelo = request.getParameter("idvuelo");
    String idclase = request.getParameter("idclase");
    
    String sqlupdate = "INSERT INTO usuarios_has_vuelos VALUES("+Integer.parseInt(sesion.getAttribute("iduser").toString())+","+idvuelo+","+idclase+",0,'"+codigo+"')";
    db.queryUpdate(sqlupdate);
    

%>

    <div class="panel panel-default">
        <div class="panel-body">
            <center>
                Tu reserva se ha realizado correctamente y se ha generado el codigo  <b><%= codigo%></b><br>
                Favor presentar este codigo al momento de confirmar tu reserva<br>
                No olvides confirmar 24 horas antes de la hora de salida de tu vuelo<br>
                presentarte 3 horas antes de tu vuelo para evitar demoras<br><br>
                <a href="../reservacion/pdf.jsp?codigo=<%= codigo%>" target="_blank" id="regresar" class="btn btn-success">Continuar</a>
            </center>
            <script>
                $("#regresar").click(function () {
                    $("#contenidoOpc").html("<br><br><br><center><img src=\"../dist/images/loader.gif\" width=\"25\" height=\"27\"><p>Cargando . . .</p></center>");
                    $.post("../reservacion/crear.jsp")
                    .done(function (data) {
                    $("#contenidoOpc").html(data);
                    });
                });
            </script>
        </div>
    </div>
<%
    db.desconectar();
%>
<script type="text/javaScript" src="../reservacion/reservas.js"></script>