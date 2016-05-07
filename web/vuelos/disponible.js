$( "#fecha_vuelo" ).datepicker({    
    dateFormat: 'yy-mm-dd',
    maxDate: "7D",
  });
 
  $("#vuelos_disponibles").submit(function(event){
    event.preventDefault();
    var origenvar = $("#origen").val();
    var destinovar = $("#destino").val();
    var fecha_vuelovar = $("#fecha_vuelo").val();
    $(".menucolor").attr("style", "border-left: 6px solid #000;");
    $("#opc1").attr("style", "border-left: 6px solid #ff0039;");
    $("#tituloOpc").html("VUELOS DISPONIBLES");
    $("#contenidoOpc").html("<br><br><br><center><img src=\"../dist/images/loader.gif\" width=\"25\" height=\"27\"><p>Cargando . . .</p></center>");
    $.ajax({
        type:"POST",
        url: "../vuelos/tabla_disponible.jsp",
        dataType:"text",
        data:{
            origen:origenvar,
            destino:destinovar,
            fecha_vuelo:fecha_vuelovar,
  	}
    }).done(function(data){
        $("#contenidoOpc").html(data);
    });
 });
 
   $("#new_vuelo_disponible").submit(function(event){
    event.preventDefault();
    var origenvar = $("#origen").val();
    var destinovar = $("#destino").val();
    var fecha_vuelovar = $("#fecha_vuelo").val();
    $(".menucolor").attr("style", "border-left: 6px solid #000;");
    $("#opc1").attr("style", "border-left: 6px solid #ff0039;");
    $("#tituloOpc").html("VUELOS DISPONIBLES");
    $("#contenidoOpc").html("<br><br><br><center><img src=\"../dist/images/loader.gif\" width=\"25\" height=\"27\"><p>Cargando . . .</p></center>");
    $.ajax({
        type:"POST",
        url: "../vuelos/tabla_disponible.jsp",
        dataType:"text",
        data:{
            origen:origenvar,
            destino:destinovar,
            fecha_vuelo:fecha_vuelovar,
  	}
    }).done(function(data){
        $("#contenidoOpc").html(data);
    });
 });

