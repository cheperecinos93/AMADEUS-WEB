<%@page import="java.util.*" session="true"%>
<%@page import="config.*" %>
<%@page import="java.sql.*" %>

<link rel="stylesheet" href="//cdn.datatables.net/1.10.11/css/jquery.dataTables.min.css">
<script src="//cdn.datatables.net/1.10.11/js/jquery.dataTables.min.js"></script>

<%
    String id_user = (String)session.getAttribute("iduser");
%>
<script>    
    function vista1(id_reserva) {
        var idReserva = id_reserva;
        $.ajax({
            type:"POST",
            url: "../reservacion/procesos/vista_detalle_reserva.jsp",
            dataType:"text",
            data:{
                id_reserva:idReserva
            },
            beforeSend: function() {
                $("#tabla").html("<center><h4>Cargando datos de la reserva...</h4></center>");
            }
        }).done(function(data){
            $("#tabla").html(data);
        });   
    }

    //Funciones ejecutadas al cargar la pagina
    $(document).ready(function(){
        $('#tabla_reservas').DataTable();
    });
</script>

<%
    database db = new database();
    db.conectar();
    // VISTA1 
    String query = "SELECT uhv.codigo id_reserva, u.nombre usuario, v.fecha fecha_vuelo, cv.clase clase_vuelo, r.origen pais_origen, r.destino pais_destino FROM usuarios_has_vuelos uhv, usuarios u, vuelos v, clase_vuelo cv, ruta r WHERE uhv.usuarios_idusuarios = u.idusuarios AND uhv.vuelos_idvuelos = v.idvuelos AND uhv.clase_vuelo_idclase_vuelo = cv.idclase_vuelo AND v.ruta_idruta = r.idruta AND uhv.usuarios_idusuarios = " + id_user;
    ResultSet rs = db.query(query);
    rs.last();
    int rows = rs.getRow();
    rs.beforeFirst();
%>
<!-- RESERVACION -->
<center><h4>Lista de Reservas</h4></center>
<div class="table-responsive">          
    <table class="table table-bordered table-hover" id="tabla_reservas" name="tabla_reservas">
        <thead>
            <%
                if (rows > 0) {
            %>
            <tr class="danger">
                <th>#</th>
                <th>Fecha del vuelo</th>
                <th>Clase</th>
                <th>País de origen</th>
                <th>País de destino</th>
                <th>Ver detalle</th>
            </tr>
        </thead>
        <tbody>        
            <%
                int num = 1;
                while (rs.next()) {
            %>
            <tr>
                <td><%=num%></td>
                <td><%=rs.getString("fecha_vuelo")%></td>
                <td><%=rs.getString("clase_vuelo")%></td>
                <td><%=rs.getString("pais_origen")%></td>
                <td><%=rs.getString("pais_destino")%></td>
                <td><center><button id="res_<%=num%>" name="res_<%=num%>" class="btn btn-danger" data-target="#myModal" data-toggle="modal" onclick="vista1('<%=rs.getString("id_reserva") %>')"><span class="glyphicon glyphicon-eye-open"></span></button></center></td>
        </tr>
        <%
                num++;
            }
            db.desconectar();
        } else {
        %>
        <tr class="danger">
            <td><center><h4>Usted no posee reservas</h4></center></td>
        </tr>
        <%
            }
        %>
        </tbody>
    </table>
</div>

<!-- MODAL DE DETALLE DE RESERVA -->
<div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title"><B>Detalles de Reserva</B></h4>
            </div>
            <div class="modal-body">
                <div id="tabla">
                
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-dismiss="modal">Cerrar</button>
            </div>
        </div>

    </div>
</div>