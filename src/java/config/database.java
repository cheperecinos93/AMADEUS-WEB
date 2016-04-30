/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package config;
import java.sql.*;
import java.io.*;
import java.util.Scanner;
/**
 *
 * @author Gerard Orellana
 */
public class database {
    
    private Connection conex;
    private String user;
    private String pass;
    private String db;
    private String host;
    private String conexion_string;
    private ResultSet rs;
    private Statement st;    
    public database(){
        try{
            host="localhost:3306";
            db="amadeus";
            user="root";
            pass="";
            conexion_string="jdbc:mysql://"+host+"/"+db;            
        }
        catch(Exception e){            
            System.out.println("Error de configuracion de datos de BD: "+e);
        }        
    }
    
    public void conectar(){
        try{
            Class.forName("com.mysql.jdbc.Driver");
            conex = DriverManager.getConnection(conexion_string,user,pass);
        }
        catch(SQLException e){
            System.out.println("No se pudo conectar con la Base de Datos");
        }
        catch(ClassNotFoundException e){
            throw new ClassCastException(e.getMessage());
        }
    }
    
    public ResultSet query(String consulta) throws SQLException{
        st = conex.createStatement();
        rs = st.executeQuery(consulta);
        return rs;
    }
    
    public void queryUpdate(String consulta) throws SQLException{
        st = conex.createStatement();
        st.executeUpdate(consulta);
    }
    
    public void desconectar() throws SQLException{
        if(conex!=null){
            conex.close();
        }
    }
}
