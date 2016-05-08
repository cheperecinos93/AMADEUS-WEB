<%@page import="com.itextpdf.text.Document"%>
<%@page import="com.itextpdf.text.Paragraph"%>
<%@page import="com.itextpdf.text.pdf.PdfWriter"%>
<%@page import="com.itextpdf.text.pdf.*"%>
<%@page import="java.util.*" session="true"%> 
<%@page import="config.*" %>
<%@page import="java.sql.*" %>
<%@page import="com.itextpdf.text.Image" %>
<%
    String codigoreserva=request.getParameter("codigo");
    response.setContentType("application/pdf");
    String iduser="",idvuelo="",idclase="",idavion="",nombre="",origen="",destino="",fecha="",clase="",asiento="";
    Image imagen,barras; 
    database db = new database();
        try{
            db.conectar();
            //OBTENER DATOS DE USUARIO PARA GENERAR TICKET ELECTRONICO
            String sql="CALL PDF_PA0004('"+codigoreserva+"')";
            ResultSet rs = db.query(sql);
            rs.first();
            iduser=rs.getString("usuarios_idusuarios");
            idvuelo=rs.getString("vuelos_idvuelos");
            idclase=rs.getString("clase_vuelo_idclase_vuelo");
            //OBTENER DATOS DE USUARIO PARA GENERAR TICKET ELECTRONICO
            String sql2="CALL PDF_PA0005('"+iduser+"')";
            ResultSet rs2 = db.query(sql2);
            rs2.first();
            nombre=rs2.getString("nombre");
            //OBTENER DATOS DE USUARIO PARA GENERAR TICKET ELECTRONICO
            String sql3="CALL PDF_PA0006('"+idvuelo+"')";
            ResultSet rs3 = db.query(sql3);
            rs3.first();
            origen=rs3.getString("origen");
            destino=rs3.getString("destino");
            fecha=rs3.getString("fecha");
            idavion=rs3.getString("avion_idavion");
            //OBTENER DATOS DE USUARIO PARA GENERAR TICKET ELECTRONICO
            String sql4="CALL PDF_PA0007('"+idclase+"')";
            ResultSet rs4 = db.query(sql4);
            rs4.first();
            clase=rs4.getString("clase");
            //OBTENER DATOS DE USUARIO PARA GENERAR TICKET ELECTRONICO
            String sql5="CALL PDF_PA0008('"+idavion+"','"+iduser+"')";
            ResultSet rs5 = db.query(sql5);
            if(rs5.first()) {                                
                asiento=rs5.getString("Nombre_Asiento");
            }          
            db.desconectar();
        }
        catch(Exception e){
            System.out.println("Error obteniendo informacion. . . "+e);
        }
        
    Document document = new Document();
    PdfWriter.getInstance(document, response.getOutputStream());
    document.open();
        imagen= Image.getInstance(getClass().getResource("/config/icons/logo.png"));
        imagen.scaleAbsolute(100,28);
            
        PdfPTable table = new PdfPTable(2);
        table.getDefaultCell().setBorder(PdfPCell.NO_BORDER);        
        PdfPCell imagencell = new PdfPCell(imagen);
        imagencell.setFixedHeight(40);
        imagencell.setBorder(PdfPCell.NO_BORDER);
        table.addCell(imagencell);        
        table.addCell(new Paragraph("TICKET ELECTRONICO"));
        
        PdfPCell separacion = new PdfPCell();
        separacion.setBorder(com.itextpdf.text.Rectangle.BOTTOM);
        separacion.setColspan(2);
        table.addCell(separacion);
        
        table.addCell(" ");
        table.addCell(" ");     
        
        PdfPCell cellnombre = new PdfPCell(new Paragraph("Nombre: "+nombre));
        cellnombre.setBorder(PdfPCell.NO_BORDER);
        cellnombre.setColspan(2);
        table.addCell(cellnombre);
        
        table.addCell(" ");
        table.addCell(" ");        
        
        table.addCell("Clase: "+clase);
        table.addCell("Fecha: "+fecha);
        
        table.addCell(" ");
        table.addCell(" ");
        
        table.addCell("Origen:"+origen);
        table.addCell("Destino: "+destino);
        
        table.addCell(" ");
        table.addCell(" ");
        
        table.addCell("Asiento: "+asiento);
        table.addCell("Código Reserva: "+codigoreserva);
        
        table.addCell(" ");
        table.addCell(" ");      
        
        barras= Image.getInstance(getClass().getResource("/config/icons/barras.jpg"));
        barras.scaleAbsolute(440,25); 
        
        PdfPCell cellbarra = new PdfPCell(barras);
        cellbarra.setBorder(PdfPCell.NO_BORDER);         
        cellbarra.setColspan(2);
        cellbarra.setFixedHeight(30);
        table.addCell(cellbarra);
        
        document.add(table);
    document.close();
%>