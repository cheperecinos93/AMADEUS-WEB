<%@page import="java.util.*" session="true"%>
<%@page import="config.*" %>
<%@page import="java.sql.*" %>
<%
    String origen=request.getParameter("origen");
    String destino=request.getParameter("destino"); 
    String fecha=request.getParameter("fecha_vuelo"); 
    database db=new database();
    db.conectar();
    String sql="SELECT vuelos.idvuelos,vuelos.hora_inicio,vuelos.hora_fin,vuelos.fecha,estado.estado,ruta.origen,ruta.destino,aeropuertos.ciudad,aeropuertos.aeropuerto FROM vuelos INNER JOIN estado ON estado.idestado=vuelos.estado_idestado INNER JOIN ruta ON ruta.idruta=vuelos.ruta_idruta INNER JOIN aeropuertos ON aeropuertos.idaeropuertos=ruta.destino WHERE ruta.origen='"+origen+"' AND ruta.destino='"+destino+"' AND vuelos.fecha='"+fecha+"' ";
    ResultSet rs=db.query(sql);
    rs.last();
    int numrs=rs.getRow();
    rs.beforeFirst();
    
    //RECUPERA EL DESTINO BUSCADO
    String sqldesb="SELECT * FROM aeropuertos WHERE idaeropuertos='"+destino+"'";
    ResultSet rsdesb=db.query(sqldesb);
    rsdesb.first();
    
    //RECUPERAR ORIGENES
    String sqlorg="SELECT * FROM aeropuertos Where idaeropuertos='SAL'";
    ResultSet rsorg = db.query(sqlorg);
    rsorg.last();
    int numrsorg=rsorg.getRow();
    rsorg.first();
    
    //RECUPERAR DESTINOS 
    String sqldes="SELECT * FROM aeropuertos";
    ResultSet rsdes = db.query(sqldes);
    rsdes.last();
    int numrsdes=rsdes.getRow();
    rsdes.beforeFirst();
    String dest = rsdesb.getString("idaeropuertos");
%>
<div class="panel panel-default">
  <div class="panel-body">
<h4>Para generar una nueva consulta, modifica los datos que requieras:</h4>
<form id="new_estado_vuelos" method="post">
  <div class="form-group col-md-3">
        <label>Ciudad de origen</label>
            <select name="origen" id="origen" class="form-control input-sm col-md-3" required>
                <% if(numrsorg>0){
                   rsorg.first();
                %>
                <option value="<%=rsorg.getString("idaeropuertos")%>"><%=rsorg.getString("ciudad")%> , <%=rsorg.getString("aeropuerto")%> (<%=rsorg.getString("idaeropuertos")%>)</option>
                <%
                    }
                    else{
                %>
                <option value="No se han agregado origenes">No se han agregado origenes</option>
                <%
                    }
                %>
            </select> 
    </div>
    <div class="form-group col-md-3">
        <label>Ciudad de destino</label>
            <select name="destino" id="destino" class="form-control input-sm col-md-3" required>                
                <% if(numrsdes>0){
                   while(rsdes.next()){    
                       String aux = rsdes.getString("idaeropuertos");
                   if(dest.equals(aux)){
                %>
                <option value="<%=rsdes.getString("idaeropuertos")%>" selected><%=rsdes.getString("ciudad")%> , <%=rsdes.getString("aeropuerto")%> (<%=rsdes.getString("idaeropuertos")%>)</option>
                <%
                    }else{
                %>
                <option value="<%=rsdes.getString("idaeropuertos")%>"><%=rsdes.getString("ciudad")%> , <%=rsdes.getString("aeropuerto")%> (<%=rsdes.getString("idaeropuertos")%>)</option>
                <%
                    }
                
                    }
                    }
                    else{
                %>
                <option value="No se han agregado destinos">No se han agregado destinos</option>
                <%
                    }
                %>
            </select>     
    </div>
    <div class="form-group col-md-3">
        <label>Fecha de vuelo</label>
        <input value="<%=fecha%>"class="form-control input-sm datepicker col-md-3"  type="text" id="fecha_vuelo" name="fecha_vuelo" placeholder="Seleccione una fecha" required>   
    </div>
    <div class="form-group col-md-2" style="padding-top: 25px;">
        <button type="submit" class="btn btn-danger btn-sm btn-block">Consultar</button>
    </div>
</form>
</div>
</div>
<%
    if(numrs>0){
%>
<div class="panel panel-default">
  <div class="panel-body">
<div class="table-responsive">
    <table class="table table-striped">
        <thead>
            <tr>
                <td><b><span style="color:#A94442">Origen: </span><%=rsorg.getString("ciudad")%>, </b><%=rsorg.getString("aeropuerto")%> - <b><span style="color:#A94442">Destino: </span><%=rsdesb.getString("ciudad")%>, </b><%=rsdesb.getString("aeropuerto")%></td>
            </tr>
        </thead>
    </table>
</div>
<div class="table-responsive">
  <table class="table table-hover">
      <thead>
          <tr>
              <th>Codigo de Vuelo</th>
              <th>Trayecto</th>
              <th>Estado</th>
              <th>Fecha</th>
              <th>Hora de salida</th>
              <th>Hora de llegada</th>
          </tr>
      </thead>                
<%
        while(rs.next()){                       
 %> 
      <tbody>
          <tr>
              <td><%=rs.getString("idvuelos")%></td>
              <td><%=rs.getString("origen")%> - <%=rs.getString("destino")%></td>
              <td><%=rs.getString("estado")%></td>
              <td><%=rs.getString("fecha")%></td>
              <td><%=rs.getString("hora_inicio")%></td>
              <td><%=rs.getString("hora_fin")%></td>
          </tr>
      </tbody>

<%
        }
%>
  </table>
<%
    }
    else{
 %>
 <div class="alert alert-danger col-md-12" role="alert">No se encontraron vuelos para la ruta seleccionada <%=origen%> - <%=destino%> en la fecha <%=fecha%>.</div>
<%
    }
    db.conectar();
%>          
</div>
  </div>
</div>
<script type="text/javaScript" src="../vuelos/estado.js"></script>