
<%@page import="java.util.*" session="true"%>
<%@page import="config.*" %>
<%@page import="java.sql.*" %>

<%
    HttpSession sesion = request.getSession();
    database db = new database();
    db.conectar();
    String sql = "SELECT vuelos.fecha,usuarios_has_vuelos.codigo,usuarios.nombre,clase_vuelo.clase,CONCAT(ruta.origen," + "'-'" + ",ruta.destino) AS ruta,vuelos.hora_inicio,vuelos.hora_fin FROM usuarios_has_vuelos,usuarios,clase_vuelo,ruta,vuelos WHERE usuarios_has_vuelos.usuarios_idusuarios=" + Integer.parseInt(sesion.getAttribute("iduser").toString()) + " AND usuarios_has_vuelos.usuarios_idusuarios=usuarios.idusuarios AND usuarios_has_vuelos.clase_vuelo_idclase_vuelo=clase_vuelo.idclase_vuelo AND usuarios_has_vuelos.vuelos_idvuelos=vuelos.idvuelos AND vuelos.ruta_idruta=ruta.idruta AND vuelos.estado_idestado=1";
    ResultSet rs = db.query(sql);
    rs.last();
    int numrs = rs.getRow();
    rs.beforeFirst();
    if (numrs > 0) {
%>
<div class="table-responsive">
    <table class="table table-hover">
        <thead>
            <tr>

                <th>Fecha</th>
                <th>Codigo de Reserva</th>
                <th>Clase</th>
                <th>Ruta</th>
                <th>Hora de salida</th>
                <th>Hora de llegada</th>
            </tr>
        </thead>                
        <%                        while (rs.next()) {
        %> 
        <tbody>
            <tr>
                <td><%=rs.getString("fecha")%></td>
                <td><%=rs.getString("codigo")%></td>
                <td><%=rs.getString("clase")%></td>
                <td><%=rs.getString("Ruta")%></td>
                <td><%=rs.getString("hora_inicio")%></td>
                <td><%=rs.getString("hora_fin")%></td>
            </tr>
        </tbody>

        <%
            }
        %>
    </table>
    <%
    } else {
    %>
    <div class="alert alert-danger col-md-12" role="alert">Aun no has realizado una reserva!</div>
    <%
        }
    %>          
</div>
