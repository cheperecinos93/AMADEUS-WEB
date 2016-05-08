package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("<!-- LOGIN INDEX -->\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("    <head>\r\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\r\n");
      out.write("        <link href=\"dist/bootstrap/css/bootstrap.min.css\" rel=\"stylesheet\" media=\"screen\">\r\n");
      out.write("        <link href=\"dist/toastr/toastr.min.css\" rel=\"stylesheet\" media=\"screen\">\r\n");
      out.write("        <link href=\"dist/bootstrap/css/simple-sidebar.css\" rel=\"stylesheet\" media=\"screen\">\r\n");
      out.write("        <script type=\"text/JavaScript\" src=\"dist/jquery/jquery-2.1.4.min.js\"></script>\r\n");
      out.write("        <script type=\"text/JavaScript\" src=\"dist/bootstrap/js/bootstrap.min.js\"></script>\r\n");
      out.write("        <script type=\"text/JavaScript\" src=\"dist/toastr/toastr.min.js\"></script>\r\n");
      out.write("        <script type=\"text/JavaScript\" src=\"dist/toastr/configToastr.js\"></script>\r\n");
      out.write("        <link rel=\"shortcut icon\" href=\"dist/images/avion_icon.ico\" type='image/x-icon'>\r\n");
      out.write("        <title>AMADEUS AIRLINES</title>     \r\n");
      out.write("        ");

            String err="No Error";          
            if(request.getParameter("err")!=null){
                err=request.getParameter("err");
            }
            if(err.equals("1")){
                out.println("<script>$(document).ready(function() {toastr.info(\"<center>USUARIO O CONTRASE&Ntilde;A INCORRECTO</center>\"); });</script>");
            }
            if(err.equals("2")){
                out.println("<script>$(document).ready(function() {toastr.info(\"<center>USUARIO UNICAMENTE CLIENTE</center>\"); });</script>");
            }
        
      out.write("\r\n");
      out.write("    </head>\r\n");
      out.write("    <body>\r\n");
      out.write("    <div class=\"container-fluid\">\r\n");
      out.write("    <div class=\"row\">  \r\n");
      out.write("        <!-- NAVBAR -->\r\n");
      out.write("        <nav class=\"navbar navbar-default navbar-fixed-top\">\r\n");
      out.write("            <div class=\"container-fluid\">\r\n");
      out.write("                <div class=\"navbar-header\">\r\n");
      out.write("                    <button type=\"button\" class=\"navbar-toggle collapsed\" data-toggle=\"collapse\" data-target=\"#btncollapse\" aria-expanded=\"false\">\r\n");
      out.write("                    <span class=\"sr-only\">Toggle navigation</span>\r\n");
      out.write("                    <span class=\"icon-bar\"></span>\r\n");
      out.write("                    <span class=\"icon-bar\"></span>\r\n");
      out.write("                    <span class=\"icon-bar\"></span>\r\n");
      out.write("                     </button>\r\n");
      out.write("                    <a class=\"navbar-brand\" href=\"#\"><img src=\"dist/images/nav-avion.png\" width=\"20\" height=\"20\"></a>\r\n");
      out.write("                    <a class=\"navbar-brand\" href=\"#\">Amadeus Airlines</a>\r\n");
      out.write("                </div>\r\n");
      out.write("                <div class=\"collapse navbar-collapse\" id=\"btncollapse\">\r\n");
      out.write("                    <form class=\"navbar-form navbar-right\" method=\"post\" action=\"class/sesion.jsp\">\r\n");
      out.write("                        <div class=\"form-group\">\r\n");
      out.write("                            <input type=\"text\" class=\"form-control input-sm\" name=\"usuario\" placeholder=\"Usuario\">\r\n");
      out.write("                        </div>\r\n");
      out.write("                        <div class=\"form-group\">\r\n");
      out.write("                            <input type=\"password\" class=\"form-control input-sm\" name=\"pass\" placeholder=\"Contrase&ntilde;a\">\r\n");
      out.write("                        </div>\r\n");
      out.write("                        <div class=\"form-group\">\r\n");
      out.write("                            <center>\r\n");
      out.write("                            <button type=\"submit\" class=\"btn btn-danger btn-sm\">Iniciar Sesi&oacute;n</button>\r\n");
      out.write("                            <a href=\"registro/\" class=\"btn btn-primary btn-sm\">Registrarse</a>\r\n");
      out.write("                            </center>\r\n");
      out.write("                        </div>\r\n");
      out.write("                    </form>                \r\n");
      out.write("                </div>\r\n");
      out.write("            </div>\r\n");
      out.write("        </nav>\r\n");
      out.write("        <br><br>\r\n");
      out.write("        <!-- CAROUSEL -->\r\n");
      out.write("        <div id=\"carouselAmadeus\" class=\"carousel slide\" data-ride=\"carousel\">\r\n");
      out.write("            <!-- Indicators -->\r\n");
      out.write("            <ol class=\"carousel-indicators\">\r\n");
      out.write("                <li data-target=\"#carousel-example-generic\" data-slide-to=\"0\" class=\"active\"></li>\r\n");
      out.write("                <li data-target=\"#carousel-example-generic\" data-slide-to=\"1\"></li>\r\n");
      out.write("                <li data-target=\"#carousel-example-generic\" data-slide-to=\"2\"></li>\r\n");
      out.write("            </ol>\r\n");
      out.write("            <div class=\"carousel-inner\" role=\"listbox\">\r\n");
      out.write("                <div class=\"item active\">\r\n");
      out.write("                    <img src=\"dist/images/slide1.png\" class=\"img-responsive\">\r\n");
      out.write("                    <div class=\"carousel-caption\">\r\n");
      out.write("                        <h2>AMADEUS AIRLINES</h2>\r\n");
      out.write("                        <h3>Conoce la ciudad de tus sue&ntilde;os</h3>\r\n");
      out.write("                    </div>\r\n");
      out.write("                </div>\r\n");
      out.write("                <div class=\"item\">\r\n");
      out.write("                    <img src=\"dist/images/slide2.png\" class=\"img-responsive\">\r\n");
      out.write("                    <div class=\"carousel-caption\">\r\n");
      out.write("                        <h2>AMADEUS AIRLINES</h2>\r\n");
      out.write("                        <h3>Visita lo hermoso de la naturaleza</h3>\r\n");
      out.write("                    </div>\r\n");
      out.write("                </div>\r\n");
      out.write("                <div class=\"item\">\r\n");
      out.write("                    <img src=\"dist/images/slide3.png\" class=\"img-responsive\">\r\n");
      out.write("                    <div class=\"carousel-caption\">\r\n");
      out.write("                        <h2>AMADEUS AIRLINES</h2>\r\n");
      out.write("                        <h3>Estamos para servirte</h3>\r\n");
      out.write("                    </div>\r\n");
      out.write("                </div>\r\n");
      out.write("            </div>\r\n");
      out.write("            <a class=\"left carousel-control\" href=\"#carouselAmadeus\" role=\"button\" data-slide=\"prev\">\r\n");
      out.write("                <span class=\"glyphicon glyphicon-chevron-left\" aria-hidden=\"true\"></span>\r\n");
      out.write("                <span class=\"sr-only\">Previous</span>\r\n");
      out.write("            </a>\r\n");
      out.write("            <a class=\"right carousel-control\" href=\"#carouselAmadeus\" role=\"button\" data-slide=\"next\">\r\n");
      out.write("                <span class=\"glyphicon glyphicon-chevron-right\" aria-hidden=\"true\"></span>\r\n");
      out.write("                <span class=\"sr-only\">Next</span>\r\n");
      out.write("            </a>            \r\n");
      out.write("        </div>\r\n");
      out.write("        <section style=\"background-color: #ff0039;\">\r\n");
      out.write("            <div class=\"container-fluid\">\r\n");
      out.write("                <div class=\"row\">\r\n");
      out.write("                    <div class=\"col-lg-10 col-lg-offset-1 text-center\">\r\n");
      out.write("                        <h2 style=\"color:white;\">AMADEUS AIRLINES</h2>\r\n");
      out.write("                        <hr style=\"border: 3px solid white; width: 10%;\">\r\n");
      out.write("                        <p style=\"color:white;\">Viaje con nosotros, registrate ahora para poder ver todas la rutas y vuelos disponibles,precios y promociones especiales.</p>\r\n");
      out.write("                        <h3 style=\"color:white;\">Vuela con nosotros!</h3>\r\n");
      out.write("                        <a class=\"btn btn-primary btn-xl\" href=\"registro/\" style=\"color:white;\">Resgistrarse</a>                        \r\n");
      out.write("                    </div>\r\n");
      out.write("                </div>\r\n");
      out.write("            </div>\r\n");
      out.write("            <br>\r\n");
      out.write("        </section>\r\n");
      out.write("        <section>\r\n");
      out.write("            <div class=\"container-fluid\">\r\n");
      out.write("                <div class=\"row\">\r\n");
      out.write("                    <div class=\"col-lg-8 col-lg-offset-2 text-center\">\r\n");
      out.write("                        <h2>AMADEUS AIRLINES LO QUE NECESITAS!</h2>\r\n");
      out.write("                        <hr style=\"border: 3px solid #ff0039; width: 10%;\">\r\n");
      out.write("                    </div>\r\n");
      out.write("                </div>\r\n");
      out.write("                <div class=\"row\">\r\n");
      out.write("                    <div class=\"col-lg-4 col-md-4 col-sm-12\">\r\n");
      out.write("                        <br><br>\r\n");
      out.write("                        <center>\r\n");
      out.write("                            <img src=\"dist/images/viaje.png\" class=\"img-responsive\" width=\"170\" height=\"125\">\r\n");
      out.write("                            <h3>VIAJA SEGURO</h3>\r\n");
      out.write("                            <p>Flota de aviones con el mejor mantenimiento para evitar inconvenientes con tu vuelo.</p>\r\n");
      out.write("                        </center>\r\n");
      out.write("                    </div>\r\n");
      out.write("                    <div class=\"col-lg-4 col-md-4 col-sm-12\">\r\n");
      out.write("                        <center>\r\n");
      out.write("                            <img src=\"dist/images/tiempo.png\" class=\"img-responsive\" width=\"125\" height=\"125\">\r\n");
      out.write("                            <h3>VUELOS A TIEMPO</h3>\r\n");
      out.write("                            <p>El 95% de nuestros vuelos son muy puntuales en los horarios establecidos.</p>\r\n");
      out.write("                        </center>\r\n");
      out.write("                    </div>\r\n");
      out.write("                    <div class=\"col-lg-4 col-md-4 col-sm-12\">\r\n");
      out.write("                        <center>\r\n");
      out.write("                            <img src=\"dist/images/servicio.png\" class=\"img-responsive\" width=\"125\" height=\"125\">\r\n");
      out.write("                            <h3>SERVICIO EN VUELO</h3>\r\n");
      out.write("                            <p>Servicio de atenci&oacute;n personalizado para los clientes durante el vuelo.</p>\r\n");
      out.write("                        </center>\r\n");
      out.write("                    </div>\r\n");
      out.write("                </div>\r\n");
      out.write("            </div>\r\n");
      out.write("            <br>\r\n");
      out.write("        </section>        \r\n");
      out.write("        <section style=\"background-color: #000;\">\r\n");
      out.write("            <div class=\"container-fluid\">\r\n");
      out.write("            <div class=\"row\">\r\n");
      out.write("                <div class=\"col-lg-8 col-lg-offset-2 text-center\">\r\n");
      out.write("                    <h2 style=\"color:white;\">CONTACTOS AMADEUS AIRLINES</h2>\r\n");
      out.write("                    <hr style=\"border: 3px solid #ff0039; width: 10%;\">\r\n");
      out.write("                    <center><h5 style=\"color: white;\"><span class=\"glyphicon glyphicon-phone\"></span> Telefono: (503) 2000-0000 &nbsp;&nbsp;&nbsp;&nbsp;<span class=\"glyphicon glyphicon-envelope\"></span> Correo: amadeusair.info@gmail.com</h5></center>\r\n");
      out.write("                </div>\r\n");
      out.write("            </div>\r\n");
      out.write("            </div>\r\n");
      out.write("        </section>\r\n");
      out.write("    </div>\r\n");
      out.write("    </div>\r\n");
      out.write("    </body>\r\n");
      out.write("</html>\r\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
