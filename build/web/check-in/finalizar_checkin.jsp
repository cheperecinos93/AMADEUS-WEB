<!-- CHECK-IN -->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*" session="true"%> 
<%@page import="config.*" %>
<%@page import="java.sql.*" %>
<%
    //MANEJO DE SESIONES DE USUARIO
    HttpSession sesion = request.getSession();
    if (sesion.getAttribute("iduser") == null && sesion.getAttribute("usuario") == null) {
        response.sendRedirect("../");
    } 
    else {
        database db = new database();
        try {
            db.conectar();
            //CAMBIAR ESTADO A CHECKIN EN BD
            String sqlupdate = "CALL Reservas_PA0020('"+request.getParameter("codigoreserva")+"')";
            db.queryUpdate(sqlupdate);
            db.desconectar();
            String asientoselect=request.getParameter("asiento");
            String[] partes;
            partes=asientoselect.split("-");
            String idasientoinsert=partes[0];
            db.conectar();
            //RESERVAR EL ASIENTO DE USUARIO
            String sql890 = "CALL Reservas_PA0021('"+request.getParameter("idusuario")+"','"+idasientoinsert+"','"+request.getParameter("idavion")+"')";
            db.queryUpdate(sql890);
            db.desconectar();
            %>
            <br><br>
            <div class="panel panel-default">
                <div class="panel-body">
                    <center>
                        <img src="../dist/images/avion.png" width="35" height="35">
                        <h4>El Check-In se ha completado Correctamente . . .</h4>
                        <a class="btn btn-success" target="_blank" href="../check-in/pdf.jsp?codigo=<%= request.getParameter("codigoreserva") %>" id="regresar">Continuar</a>
                    <script>
                        $("#regresar").click(function () {
                            $("#contenidoOpc").html("<br><br><br><center><img src=\"../dist/images/loader.gif\" width=\"25\" height=\"27\"><p>Cargando . . .</p></center>");
                            $.post("../check-in/check_in.jsp")
                            .done(function (data) {
                                $("#contenidoOpc").html(data);
                            });
                        });
                    </script>
                    </center>
                </div>
            </div>
            <%                    
        } 
        catch (Exception e) {
%>
            <br><br>
            <div class="panel panel-default">
                <div class="panel-body">
                    <center>
                        <img src="../dist/images/avion.png" width="35" height="35">
                        <h4>A ocurido un error al realizar el Check-In . . .</h4>
                        <button class="btn btn-success" id="regresar">Continuar</button>
                    <script>
                        $("#regresar").click(function () {
                            $("#contenidoOpc").html("<br><br><br><center><img src=\"../dist/images/loader.gif\" width=\"25\" height=\"27\"><p>Cargando . . .</p></center>");
                            $.post("../check-in/check_in.jsp")
                            .done(function (data) {
                                $("#contenidoOpc").html(data);
                            });
                        });
                    </script>
                    </center>
                </div>
            </div>
<%
        }
    }
%>