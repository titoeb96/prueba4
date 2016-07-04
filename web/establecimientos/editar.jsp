<%@page import="accesodato.Coneccion"%>
<!DOCTYPE html>
<html lang="en">
    <head>
           <% HttpSession logeado = request.getSession(true);
   String result = (String) logeado.getAttribute("valido");
   if (result.equals("true") & result!=null ) {
        
   } else {
       response.sendRedirect("../index.jsp");
   }
       %>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
        <meta name="description" content="">
        <meta name="author" content="">
        <link rel="icon" href="../../favicon.ico">
        <title>Starter Template for Bootstrap</title>
        <link href="../template/css/bootstrap.min.css" rel="stylesheet">
    </head>
      <body>
    <nav class="navbar navbar-inverse navbar-fixed-top">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
            <a class="navbar-brand" href="#">Prueba 3</a>
        </div>
        <div id="navbar" class="collapse navbar-collapse">
          <ul class="nav navbar-nav">
             <li class="active"><a href="../menu.jsp">Inicio</a></li>
           <li><a href="../ciudades/index.jsp">Ciudades</a></li>
            <li><a href="index.jsp">Establecimientos</a></li>
            <li><a href="../paises/index.jsp">Paises</a></li>
            <li><a href="../usuarios/index.jsp">Usuarios</a></li>
            <li><a href="../salas/index.jsp">Salas</a></li>
            <li><a href="../alumnos/index.jsp">Alumnos</a></li>
          </ul>
        </div><!--/.nav-collapse -->
      </div>
    </nav>
   <div class="container">
        <br><br><br>
        <div class="row">
              <div class="panel panel-primary">
  <div class="panel-heading">
    <h3 class="panel-title">Editar Establecimientos</h3>
  </div>
        <br>
        <% String establecimiento_id=request.getParameter("establecimiento_id"); %>
        
        <form method="post" action="../ServletEstablecimiento">
         <table class="table-condensed table-hover table-bordered">
            <tr>
                <td>Establecimiento ID</td><td><input type="text" name="establecimiento_id" readonly="true" value="<% out.println(""+establecimiento_id);  %>"></td>
            </tr>
            <%  Coneccion con=new Coneccion();
                con.setConsulta("select * from Establecimientos where establecimiento_id='"+establecimiento_id+"'");
                while(con.getResultado().next()){
            
            
            %>
            
            <tr>
                <td>NOMBRE</td><td><input type="text" name="nombre" value="<% out.println(""+con.getResultado().getString("nombre"));  %>"></td>
            </tr>
             <tr>
                <td>FECHACREACION</td><td><input type="text" name="fecha_creacion" value="<% out.println(""+con.getResultado().getString("fecha_creacion"));  %>"></td>
            </tr>
              <tr>
                <td>CIUDAD_ID</td><td><input type="text" name="ciudad_id" value="<% out.println(""+con.getResultado().getString("ciudad_id"));  %>"></td>
            </tr>
             <tr>
                <td>CREADO POR</td><td><input type="text" name="creado_por" value="<% out.println(""+con.getResultado().getString("creado_por"));  %>"></td>
            </tr>
            
            
            <tr>
                <td><input type="submit" name="editar" value="Actualizar"></td>
            </tr>
            <% } %>
        </table>
        </form>
          <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="template/js/bootstrap.min.js"></script>
    </body>
    
</html>