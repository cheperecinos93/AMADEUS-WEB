$( "#fecha_vuelo" ).datepicker({    
    dateFormat: 'yy-mm-dd',
    maxDate: "7D",
  });
 
  $("#buscar_vuelo").submit(function(event){
    event.preventDefault();
    var origenvar = $("#origen").val();
    var destinovar = $("#destino").val();
    var fecha_vuelovar = $("#fecha_vuelo").val();
    $(".menucolor").attr("style", "border-left: 6px solid #000;");
    $("#opc1").attr("style", "border-lft: 6px solid #ff0039;");
    $("#tituloOpc").html("RESERVA DE VUELOS");
    $("#contenidoOpc").html("<br><br><br><center><img src=\"../dist/images/loader.gif\" width=\"25\" height=\"27\"><p>Cargando . . .</p></center>");
    $.ajax({
        type:"POST",
        url: "../reservacion/vuelos_reserva.jsp",
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
 
  $("#new_busqueda_reserva").submit(function(event){
    event.preventDefault();
    var origenvar = $("#origen").val();
    var destinovar = $("#destino").val();
    var fecha_vuelovar = $("#fecha_vuelo").val();
    $(".menucolor").attr("style", "border-left: 6px solid #000;");
    $("#opc1").attr("style", "border-left: 6px solid #ff0039;");
    $("#tituloOpc").html("RESERVA DE VUELOS");
    $("#contenidoOpc").html("<br><br><br><center><img src=\"../dist/images/loader.gif\" width=\"25\" height=\"27\"><p>Cargando . . .</p></center>");
    $.ajax({
        type:"POST",
        url: "../reservacion/vuelos_reserva.jsp",
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
$("#crear_nueva_reserva").submit(function(event){
    event.preventDefault();
    var vuelo = $('input[name=selvuelo]:checked').val();
    var clase =  $('input[name=clase_select]:checked').val();
   
    $(".menucolor").attr("style", "border-left: 6px solid #000;");
    $("#opc1").attr("style", "border-left: 6px solid #ff0039;");
    $("#tituloOpc").html("INGRESANDO RESERVA");
    $("#contenidoOpc").html("<br><br><br><center><img src=\"../dist/images/loader.gif\" width=\"25\" height=\"27\"><p>Cargando . . .</p></center>");
    $.ajax({
        type:"POST",
        url: "../reservacion/ing_reserva.jsp",
        dataType:"text",
        data:{
            idvuelo:vuelo,
            idclase:clase,
  	}
    }).done(function(data){
        $("#contenidoOpc").html(data);
    });
 });