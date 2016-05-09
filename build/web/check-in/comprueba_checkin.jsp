<!-- CHECK-IN -->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*" session="true"%> 
<%@page import="config.*" %>
<%@page import="java.sql.*" %>
<%
    //MANEJO DE SESIONES DE USUARIO
    HttpSession sesion=request.getSession();
    if(sesion.getAttribute("iduser")==null && sesion.getAttribute("usuario")==null){
         response.sendRedirect("../");
    }
    else{
        database db = new database();
        try {
                db.conectar();
                //OBTENER LOS DATOS DE USUARIO POR EL CODIGO DE RESERVACION DE VUELO
                String sql = "CALL Reservas_PA0018('" +request.getParameter("codigo")+ "')";
                ResultSet rs = db.query(sql);
                if (rs.first()) {
                    if (Integer.parseInt(rs.getString("usuarios_has_vuelos.checkin")) == 1) {                        
                        %>
                        <br><br>
                        <div class="panel panel-default">
                            <div class="panel-body">
                                <center>
                                    <img src="../dist/images/avion.png" width="35" height="35">
                                    <h4>Esta Reservaci&oacute;n ya se encuentra confirmada . . .</h4>
                                    <button class="btn btn-success" id="regresar">Continuar</button>
                                    <script>
                                        $("#regresar").click(function(){
                                            $("#contenidoOpc").html("<br><br><br><center><img src=\"../dist/images/loader.gif\" width=\"25\" height=\"27\"><p>Cargando . . .</p></center>");
                                            $.post("../check-in/check_in.jsp")
                                            .done(function( data ) {
                                                $("#contenidoOpc").html(data);
                                            });
                                        });
                                    </script>
                                </center>
                            </div>
                        </div>
                        <%
                    } 
                    else {
                        String nombre=rs.getString("usuarios.nombre");
                        String pasaporte=rs.getString("usuarios.pasaporte");
                        String origen=rs.getString("ruta.origen");
                        String destino=rs.getString("ruta.destino");
                        String horaida=rs.getString("vuelos.hora_inicio");
                        String horalle=rs.getString("vuelos.hora_fin");
                        String clasevue=rs.getString("clase_vuelo.clase");
                        String iduser="";
                        String idavion="";
                        //OBTENER VALORES DE AVION Y USUARIO PARA CHECKIN
                        String query11 = "CALL Reservas_PA0019('" +request.getParameter("codigo")+ "')";
                        ResultSet rs22 = db.query(query11);
                        if (rs22.first()) {
                            iduser = rs22.getString("usuarios_idusuarios");
                            idavion = rs22.getString("avion_idavion");                                
                        }
                        %>
                        <br>
                        <div class="panel panel-default">
                            <div class="panel-body">
                                <center><h4><img src="../dist/images/avion.png" width="35" height="35"> Datos de Reservaci&oacute;n</h4></center>
                                <div class="row">
                                    <div class="col-lg-12 col-md-12 col-sm-12">
                                        <h5><b>Nombre:</b> <%= nombre %></h5>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-12 col-md-12 col-sm-12">
                                        <h5><b>Pasaporte:</b> <%= pasaporte %></h5>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-6 col-md-6 col-sm-6">
                                        <h5><b>Origen:</b> <%= origen %></h5>
                                    </div>
                                    <div class="col-lg-6 col-md-6 col-sm-6">
                                        <h5><b>Destino:</b> <%= destino %></h5>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-6 col-md-6 col-sm-6">
                                        <h5><b>Hora Salida:</b> <%= horaida %></h5>
                                    </div>
                                    <div class="col-lg-6 col-md-6 col-sm-6">
                                        <h5><b>Hora Llegada:</b> <%= horalle %></h5>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-12 col-md-12 col-sm-12">
                                        <h5><b>Clase de vuelo:</b> <%= clasevue %></h5>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <%
                        //OBTENER LOS ASIENTOS DISPONIBLES PARA CLIENTE
                        String query22="SELECT CONCAT(Asientos.idAsientos,\"-\",Asientos.Nombre_Asiento) AS valueasiento,Asientos.Nombre_Asiento AS asiento FROM Asientos WHERE Asientos.Estado=0 AND Asientos.avion_idavion='"+idavion+"'";
                        ResultSet rs33 = db.query(query22);
                        %>                        
                        <div class="panel panel-default">
                            <div class="panel-body">
                                <center><h4><img src="../dist/images/avion.png" width="35" height="35"> Seleccionar asiento</h4></center>
                                <div class="row">
                                    <div class="col-lg-2 col-lg-offset-10 col-md-2 col-md-offset-10 col-sm-2 col-sm-offset-10">
                                        <input type="text" id="seleccionado" class="form-control input-sm" readonly>
                                    </div>
                                </div><br>     
                        <%
                        int no=0,cont=1;
                        String filtro="";
                        if(clasevue.equals("Clase Turista")){
                            filtro="TR";
                        }
                        else if(clasevue.equals("Primera Clase")){
                            filtro="FC";
                        }
                        else if(clasevue.equals("Clase Ejecutiva")){
                            filtro="BS";
                        }
                        while(rs33.next()){
                            String asien=rs33.getString("asiento");
                            int find = asien.indexOf(filtro);
                            if(find!=-1){
                                out.print("<div class=\"col-lg-1 col-md-1 col-sm1\"> <button id=\"asiento"+cont+"\" class=\"btn btn-sm\">" + rs33.getString("asiento") + "</button></div>");
                                out.print("<script> $('#asiento"+cont+"').click(function(){ $('#seleccionado').val(\"" + rs33.getString("valueasiento") + "\"); });</script>");
                                no++;
                                cont++;
                                if(no==12){
                                    out.print("<br><br>");
                                    no=0;
                                }
                            }
                        }
                        %>                                
                            </div>
                        </div>
                        <br>
                        <center><button class="btn btn-danger" id="fincheck">Finalizar Check-In</button></center>
                        <script>
                            $("#fincheck").click(function(){
                                if($("#seleccionado").val()!= ""){
                                    var asienselect=$("#seleccionado").val();
                                    $("#contenidoOpc").html("<br><br><br><center><img src=\"../dist/images/loader.gif\" width=\"25\" height=\"27\"><p>Cargando . . .</p></center>");
                                    $.post("../check-in/finalizar_checkin.jsp",{codigoreserva:"<%= request.getParameter("codigo") %>",asiento:asienselect,idusuario:"<%= iduser %>",idavion:"<%= idavion %>"})
                                    .done(function (data) {
                                        $("#contenidoOpc").html(data);
                                    });
                                }
                            });
                        </script>
                        <%
                    }
                } 
                else {                    
                    %>
                    <br><br>
                        <div class="panel panel-default">
                            <div class="panel-body">
                                <center>
                                    <img src="../dist/images/avion.png" width="35" height="35">
                                    <h4>No ha encontrado Reservaci&oacute;n para este c&oacute;digo . . .</h4>
                                    <button class="btn btn-success" id="regresar">Continuar</button>
                                    <script>
                                        $("#regresar").click(function(){
                                            $("#contenidoOpc").html("<br><br><br><center><img src=\"../dist/images/loader.gif\" width=\"25\" height=\"27\"><p>Cargando . . .</p></center>");
                                            $.post("../check-in/check_in.jsp")
                                            .done(function( data ) {
                                                $("#contenidoOpc").html(data);
                                            });
                                        });
                                    </script>
                                </center>
                            </div>
                        </div>
                    <%
                }
                db.desconectar();
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
                                        $("#regresar").click(function(){
                                            $("#contenidoOpc").html("<br><br><br><center><img src=\"../dist/images/loader.gif\" width=\"25\" height=\"27\"><p>Cargando . . .</p></center>");
                                            $.post("../check-in/check_in.jsp")
                                            .done(function( data ) {
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
