<%@page import="java.util.*" session="true"%>
<%@page import="config.*" %>
<%@page import="java.sql.*" %>
<%
    //REGISTRO DE USUARIOS
        String nombre=request.getParameter("nombre");
        String correo=request.getParameter("correo");
        String usuario=request.getParameter("usuario");
        String pass=request.getParameter("pass");
        String telefono=request.getParameter("telefono");
        String pasaporte=request.getParameter("pasaporte");
        String tcredito=request.getParameter("tcredito");
        database db=new database();
        md5 cifra = new md5();
        db.conectar();
        String sql="INSERT INTO usuarios (nombre,correo,usuario,pass,telefono,pasaporte,tarjeta_credito,estado,rol_idrol) VALUES ('"+nombre+"','"+correo+"','"+usuario+"','"+cifra.md5_encode(pass)+"','"+telefono+"','"+pasaporte+"','"+cifra.md5_encode(tcredito)+"',1,3)";
        db.queryUpdate(sql);
        db.desconectar();

%>