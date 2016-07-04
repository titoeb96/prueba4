<%@page import="net.sf.jasperreports.engine.*" %>
<%@page import="java.util.*" %>
<%@page import="java.io.*" %>
<%@page import="java.sql.*" %>
<%@page import="accesodato.Coneccion" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
         <% HttpSession logeado = request.getSession(true);
   String result = (String) logeado.getAttribute("valido");
   if (result.equals("true") & result!=null ) {

   } else {
       response.sendRedirect("../index.jsp");
   }
       %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            try {
                Coneccion con = new Coneccion();
                File reportFile = new File(application.getRealPath("//reportes//alumnos"
                        + ".jasper"));
                byte[] bytes = JasperRunManager.runReportToPdf(reportFile.getPath(), null, con.getConexion());
                response.setContentType("application/pdf");
                response.setContentLength(bytes.length);
                ServletOutputStream outputStream=response.getOutputStream();
                outputStream.write(bytes,0,bytes.length);
                outputStream.flush();
                outputStream.close();
            } catch (Exception ex) {
                out.println("ERROR DE CONEXION AL GENERAR EL REPORTE! 😃");
            }

        %>
    </body>
</html>