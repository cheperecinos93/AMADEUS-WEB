<!-- SESION DE USUARIO -->
<%@page import="java.util.*" session="true"%>
<%@page import="config.*" %>
<%@page import="java.sql.*" %>
<%
    //MANEJO DE SESIONES DE USUARIO
    HttpSession sesion=request.getSession();
    try{
        database db=new database();
        md5 cifra = new md5();
        String usuario=request.getParameter("usuario");
        String pass=request.getParameter("pass");
        if(usuario==null && pass==null){
            response.sendRedirect("../");
        }
        else{        
            db.conectar();
            String sql = "CALL Login_PA0001('"+usuario+"','"+cifra.md5_encode(pass)+"')";
            ResultSet rs=db.query(sql);                       
            if(rs.first()){
                if(rs.getString("rol_idrol").equals("3")){
                    sesion.setAttribute("iduser",rs.getString("idusuarios"));
                    sesion.setAttribute("usuario",rs.getString("usuario"));
                    sesion.setAttribute("nombre",rs.getString("nombre"));
                    sesion.setAttribute("estado",rs.getString("estado"));
                    sesion.setAttribute("correo",rs.getString("correo"));
                    response.sendRedirect("../usuario/");
                }
                else{
                    //ERROR ROL SOLO CLIENTES ACCESO
                    out.println("Error cliente");
                    response.sendRedirect("../?err=2");
                }               
            }
            else{
                //ERROR DE USUARIO O CONTRASEÑA
                out.println("Error us pass");
                response.sendRedirect("../?err=1");
            }
            db.desconectar(); 
        }
    }
    catch(Exception e){
        System.out.println("Error de conexion en BD"+e);    
    }
%>
