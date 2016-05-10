<!-- ESTADO DE VUELOS -->
<%@page import="java.util.*" session="true"%>
<%@page import="config.*" %>
<%@page import="java.sql.*" %>
<%
    database db=new database();
    db.conectar();
    //RECUPERAR DESTINOS 
    String sqldes="SELECT * FROM aeropuertos";
    ResultSet rsdes = db.query(sqldes);
    rsdes.last();
    int numrsdes=rsdes.getRow();
    rsdes.beforeFirst();
    
    //RECUPERAR ORIGEN
    String sqlorg="SELECT * FROM aeropuertos Where idaeropuertos='SAL'";
    ResultSet rsorg = db.query(sqlorg);
    rsorg.last();
    int numrsorg=rsorg.getRow();
    rsorg.beforeFirst();
    
%>
<!--INICIO DEL CUERPO DEL FORMULARIO -->

<h4><img src="../dist/images/avion.png" width="35" height="35"> Selecciona un origen y destino para conocer el estado de un vuelo:</h4>
<br>
<div class="col-lg-6 col-md-6 col-sm-6">
    <form id="estado_vuelos" method="POST">
    <div class="form-group col-md-9">
        <label class=" control-label text-left">Ciudad de origen</label>
        <div class="">
            <select name="origen" id="origen" class="form-control input-sm" required>
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
    </div>
    <div class="form-group col-md-9">
        <label class=" control-label">Ciudad de destino</label>
        <div class="">
            <select name="destino" id="destino" class="form-control input-sm" required>
                <% if(numrsdes>0){
                   while(rsdes.next()){    
                %>
                <option value="<%=rsdes.getString("idaeropuertos")%>"><%=rsdes.getString("ciudad")%> , <%=rsdes.getString("aeropuerto")%> (<%=rsdes.getString("idaeropuertos")%>)</option>
                <%
                    }
                    }
                    else{
                %>
                <option value="No se han agregado destinos">No se han agregado destinos</option>
                <%
                    }
                    db.desconectar();
                %>
            </select>
        </div>
        
    </div>
    <div class="form-group col-md-9">
        <label class=" control-label">Fecha de vuelo</label>
        <div class="">
           <input class="form-control input-sm datepicker"  type="text" id="fecha_vuelo" name="fecha_vuelo" placeholder="Seleccione una fecha" required> 
        </div>   
    </div>
    <div class="form-group">
        <div class="col-md-4">
            <button type="submit" class="btn btn-danger btn-sm btn-block">Consultar</button>
        </div>
    </div>        
</form>
</div>
<div class="col-lg-6 col-md-6 col-sm-6">
    <img src="../dist/images/promo.png" width="139" height="271" class="pull-right">
</div>
<script type="text/javaScript" src="../vuelos/estado.js"></script>
