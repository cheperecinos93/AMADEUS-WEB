  $("#alerta").hide();
  
  $("#registro").submit(function(event){
    event.preventDefault();
    var vnombre = $("#nombre").val();
    var vcorreo = $("#correo").val();
    var vusuario = $("#usuario").val();
    var vpass = $("#passreg").val();
    var vconfipass = $("#confipassreg").val();
    var vtelefono = $("#telefono").val();
    var vpasaporte = $("#pasaporte").val();
    var vtcredito = $("#tcredito").val();
    if(vpass != vconfipass){
      $("#alerta").addClass('alert alert-danger');
      $("#alerta").html("<strong>Error de Resitro: </strong> Las contraseñas no coinciden.");
      $("#alerta").show();
      $("#passreg").val("");
      $("#confipassreg").val("");
      $("#passreg").focus();
    }
    else{
    $.ajax({
        type:"POST",
        url: "registro.jsp",
        dataType:"text",
        data:{
            nombre:vnombre,
            correo:vcorreo,
            usuario:vusuario,
            pass:vpass,
            telefono:vtelefono,
            pasaporte:vpasaporte,
            tcredito:vtcredito,
  	}
    }).done(function(data){
            var res = data.toString();
            if(res==1){
            $("#alerta").removeClass();
            $("#alerta").addClass('alert alert-success');
            $("#alerta").html("<strong>Registro Exitoso: </strong> Gracias por registrarse en AMADEUS AIRLINES ya puede <a href='../index.jsp'><strong style='color:white'><u>iniciar sesion.</u></strong></a>");
            $("#alerta").show();
            $("#registro")[0].reset();
            }
            else if(res==2){
            $("#alerta").removeClass();
            $("#alerta").addClass('alert alert-danger');
            $("#alerta").html("<strong>Error de Resitro: </strong> El nombre de Usuario no se encuentra disponible");
            $("#alerta").show();
            $("#usuario").val("");
            $("#usuario").focus();
            }
            else {    
            $("#alerta").removeClass();
            $("#alerta").addClass('alert alert-danger');
            $("#alerta").html("<strong>Error de Resitro: </strong> El correo ya se encuentra registrado.");
            $("#alerta").show();
            $("#correo").val("");
            $("#correo").focus();
            } 
    }).fail(function(data) {
            $("#alerta").removeClass();
            $("#alerta").addClass('alert alert-danger');
            $("#alerta").html("<strong>Error de Resitro: </strong> No se pudo completar el registro correctamente.");
            $("#registro")[0].reset();
            $("#alerta").show();
    });      
    }   
 });
 
 


