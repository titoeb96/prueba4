<%@page import="net.sf.jasperreports.engine.*" %>
<%@page import="java.util.*" %>
<%@page import="java.io.*" %>
<%@page import="java.sql.*" %>
<%@page import="accesodato.Coneccion" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            try{
                
                Coneccion coneccion=Coneccion.getInstance();
                File reportFile = new File(application.getRealPath("//reportes//ciudades.jasper"));
                byte[] bytes = JasperRunManager.runReportToPdf(reportFile.getPath(), null, coneccion.getConeccion());
                response.setContentType("application/pdf");
                response.setContentLength(bytes.length);
                ServletOutputStream ouputStream=response.getOutputStream();
                ouputStream.write(bytes,0,bytes.length);
                ouputStream.flush();
                ouputStream.close();
            }catch(Exception ex){
                out.println(""+ex.getMessage());
            }
            %>
    </body>
</html>