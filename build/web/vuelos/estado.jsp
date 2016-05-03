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
    <form id="estado_vuelos" method="POST">
    <div class="form-group col-md-9">
        <label class=" control-label text-left">Ciudad de origen</label>
        <div class="">
            <select name="origen" id="origen" class="form-control input-sm" required>
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
            <select name="destino" id="destino" class="form-control input-sm" required>
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
<script type="text/javaScript" src="estado.js"></script>
<script type="text/javascript">
$( "#fecha_vuelo" ).datepicker({    
    dateFormat: 'yy-mm-dd',
    maxDate: "7D"
  });
 
  $("#estado_vuelos").submit(function(event){
    event.preventDefault();
    var origenvar = $("#origen").val();
    var destinovar = $("#destino").val();
    var fecha_vuelovar = $("#fecha_vuelo").val();
    $(".menucolor").attr("style", "border-left: 6px solid #000;");
    $("#opc2").attr("style", "border-left: 6px solid #ff0039;");
    $("#tituloOpc").html("ESTADO DE VUELO");
    $("#contenidoOpc").html("<br><br><br><center><img src=\"../dist/images/loader.gif\" width=\"25\" height=\"27\"><p>Cargando . . .</p></center>");
    $.ajax({
        type:"POST",
        url: "tabla_estado.jsp",
        dataType:"text",
        data:{
            origen:origenvar,
            destino:destinovar,
            fecha_vuelo:fecha_vuelovar
  	}
    }).done(function(data){
        $("#contenidoOpc").hide().html(data);
    });
 });
</script>