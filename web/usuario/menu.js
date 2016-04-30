//***** OPCIONES DE MENU PARA AJAX *****

$("#opc1").click(function(){
    $(".menucolor").attr("style", "border-left: 6px solid #000;");
    $("#opc1").attr("style", "border-left: 6px solid #ff0039;");
    $("#tituloOpc").html("VUELOS DISPONIBLES");
    $("#contenidoOpc").html("<br><br><br><center><img src=\"../dist/images/loader.gif\" width=\"25\" height=\"27\"><p>Cargando . . .</p></center>");
    $.post("../vuelos/disponibles.jsp")
    .done(function( data ) {
        $("#contenidoOpc").html(data);
    });
});

$("#opc2").click(function(){
    $(".menucolor").attr("style", "border-left: 6px solid #000;");
    $("#opc2").attr("style", "border-left: 6px solid #ff0039;");
    $("#tituloOpc").html("ESTADO DE VUELOS");
    $("#contenidoOpc").html("<br><br><br><center><img src=\"../dist/images/loader.gif\" width=\"25\" height=\"27\"><p>Cargando . . .</p></center>");
    $.post("../vuelos/estado.jsp")
    .done(function( data ) {
        $("#contenidoOpc").html(data);
    });
});

$("#opc3").click(function(){
    $(".menucolor").attr("style", "border-left: 6px solid #000;");
    $("#opc3").attr("style", "border-left: 6px solid #ff0039;");
    $("#tituloOpc").html("CREAR RESERVACION");
    $("#contenidoOpc").html("<br><br><br><center><img src=\"../dist/images/loader.gif\" width=\"25\" height=\"27\"><p>Cargando . . .</p></center>");
    $.post("../reservacion/crear.jsp")
    .done(function( data ) {
        $("#contenidoOpc").html(data);
    });
});

$("#opc4").click(function(){
    $(".menucolor").attr("style", "border-left: 6px solid #000;");
    $("#opc4").attr("style", "border-left: 6px solid #ff0039;");
    $("#tituloOpc").html("MIS RESERVACIONES");
    $("#contenidoOpc").html("<br><br><br><center><img src=\"../dist/images/loader.gif\" width=\"25\" height=\"27\"><p>Cargando . . .</p></center>");
    $.post("../reservacion/mis_reservas.jsp")
    .done(function( data ) {
        $("#contenidoOpc").html(data);
    });
});

$("#opc5").click(function(){
    $(".menucolor").attr("style", "border-left: 6px solid #000;");
    $("#opc5").attr("style", "border-left: 6px solid #ff0039;");
    $("#tituloOpc").html("CHECK-IN");
    $("#contenidoOpc").html("<br><br><br><center><img src=\"../dist/images/loader.gif\" width=\"25\" height=\"27\"><p>Cargando . . .</p></center>");
    $.post("../check-in/check_in.jsp")
    .done(function( data ) {
        $("#contenidoOpc").html(data);
    });
});