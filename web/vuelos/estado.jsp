<!-- ESTADO DE VUELOS -->
<%@page import="java.util.*" session="true"%>
<%@page import="config.*" %>
<%@page import="java.sql.*" %>
<%
    database db=new database();
    db.conectar();
    //RECUPERAR DESTINOS 
    String sqldes="CALL Vuelos_PA0002()";
    ResultSet rsdes = db.query(sqldes);
    rsdes.last();
    int numrsdes=rsdes.getRow();
    rsdes.beforeFirst();
    
    //RECUPERAR ORIGEN
    String sqlorg="CALL Vuelos_PA0026()";
    ResultSet rsorg = db.query(sqlorg);
    rsorg.last();
    int numrsorg=rsorg.getRow();
    rsorg.beforeFirst();
%>
<!--INICIO DEL CUERPO DEL FORMULARIO -->

<h4>Selecciona un origen y destino para conocer el estado de un vuelo:</h4>
<br>
<div class="col-md-6">
<form action="" method="post" name="estado_vuelos" class="">
    <div class="form-group col-md-9">
        <label class=" control-label text-left">Ciudad de origen</label>
        <div class="">
            <select name="cd_origen" class="form-control input-sm" required>
                <% if(numrsorg>0){
                   rsorg.first();
                %>
                <option value="<%=rsorg.getString("ciudad")%>"><%=rsorg.getString("ciudad")%> , <%=rsorg.getString("aeropuerto")%></option>
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
            <select name="cd_destino" class="form-control input-sm" required>
                <% if(numrsdes>0){
                   while(rsdes.next()){    
                %>
                <option value="<%=rsdes.getString("ciudad")%>"><%=rsdes.getString("ciudad")%> , <%=rsdes.getString("aeropuerto")%></option>
                <%
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
        
    </div>
    <div class="form-group col-md-9">
        <label class=" control-label">Fecha de vuelo</label>
        <div class="">
           <input class="form-control input-sm datepicker"  type="text" id="fecha_vuelo" placeholder="Seleccione una fecha" required readonly> 
        </div>   
    </div>
    <div class="form-group">
        <div class="col-md-4">
            <button type="submit" class="btn btn-danger btn-sm btn-block">Consultar</button>
        </div>
    </div>        
</form>
</div>
<script type="text/javascript">
    $( "#fecha_vuelo" ).datepicker({
       
    dateFormat: 'yy-mm-dd',
    maxDate: "7D"
  });
    </script>