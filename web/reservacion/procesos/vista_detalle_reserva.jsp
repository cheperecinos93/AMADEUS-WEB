<%@page import="java.util.*" session="true"%>
<%@page import="config.*" %>
<%@page import="java.sql.*" %>
<%
    //Parametros de consulta
    String id_user = (String)session.getAttribute("iduser");
    String id_reserva = request.getParameter("id_reserva");
    
    database db = new database();
    db.conectar();
    // VISTA DETALLE 
    String query = "SELECT uhv.codigo, u.nombre usuario, v.fecha fecha_vuelo, cv.clase clase_vuelo, cv.precio, CONCAT(r.origen, ' - ', r.destino) ruta, v.hora_inicio, v.hora_fin FROM usuarios_has_vuelos uhv, usuarios u, vuelos v, clase_vuelo cv, ruta r WHERE uhv.usuarios_idusuarios = u.idusuarios AND uhv.vuelos_idvuelos = v.idvuelos AND uhv.clase_vuelo_idclase_vuelo = cv.idclase_vuelo AND v.ruta_idruta = r.idruta AND uhv.usuarios_idusuarios = " + id_user + " AND uhv.codigo = '" + id_reserva + "'";
    ResultSet rs = db.query(query);
    rs.last();
    int rows = rs.getRow();
    rs.beforeFirst();
    
    String html = " ";
    if(rows > 0){
        try{
            rs.first();
            html =  "<table class='table table-bordered'>"
                        + "<tbody>"
                            + "<tr>"
                                + "<td><B>Codigo de reserva:</B> " + rs.getString("codigo") +"</td>"
                                + "<td><B>Cliente:</B> " + rs.getString("usuario") + "</td>"
                            + "</tr>"
                            + "<tr>"
                                + "<td><B>Ruta:</B> " + rs.getString("ruta") +"</td>"
                                + "<td><B>Fecha de vuelo:</B> " + rs.getString("fecha_vuelo") + "</td>"
                            + "</tr>"
                            + "<tr>"
                                + "<td><B>Hora de salida:</B> " + rs.getString("hora_inicio") + "</td>"
                                + "<td><B>Hora de llegad:</B> " + rs.getString("hora_fin") + "</td>"    
                            + "</tr>"
                            + "<tr>"
                                + "<td><B>Clase:</B> " + rs.getString("clase_vuelo") + "</td>"
                                + "<td><B>Precio:</B> $" + rs.getString("precio") + "</td>"
                            + "</tr>"
                        + "</tbody>"
                    + "</table>";
        }catch(Exception e){
            html = "Ocurrio un error al cargar lod datos, intente más tarde.";
        }
    }else{
        html = "<center><h4>No se encontraron los datos del registro.</h4></center>";
    }
    
    out.println(html);
%>