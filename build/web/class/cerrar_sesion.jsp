<!-- CERRAR SESION DE USUARIO -->
<%@page import="java.util.*" session="true"%> 
<%
    //MANEJO DE SESIONES DE USUARIO
    HttpSession sesion=request.getSession();
    sesion.invalidate();
    response.sendRedirect("../");
%>