$("#estado_vuelos").submit(function(event){ 
 	event.preventDefault();
        $(".menucolor").attr("style", "border-left: 6px solid #000;");
        $("#opc2").attr("style", "border-left: 6px solid #ff0039;");
        $("#tituloOpc").html("ESTADO DE VUELOS");
        $("#contenidoOpc").html("<br><br><br><center><img src=\"../dist/images/loader.gif\" width=\"25\" height=\"27\"><p>Cargando . . .</p></center>");
	//var nombrebuscar = $("#buscarp").val();
        alert("Funciona");
        /*$.ajax({
        type:"POST",
	url: "",
	dataType:"text",
  	data:{
            //buscarnombre:nombrebuscar,
  	}
	}).done(function(data) {
           // $("#contenidoOpc").html(data);
            
	});*/
 });

