<%@page import="accesodato.Coneccion"%>
<!DOCTYPE html>
<html lang="en">
    <head>
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
              <li><a href="index.jsp">Ciudades</a></li>
            <li><a href="../establecimientos/index.jsp">Establecimientos</a></li>
            <li><a href="../paises/index.jsp">Paises</a></li>
            <li><a href="../usuarios/index.jsp">Usuarios</a></li>
            <li><a href="../salas/index.jsp">Salas</a></li>
            <li><a href="../alumnos/index.jsp">Alumnos</a></li>
          </ul>
          </ul>
        </div><!--/.nav-collapse -->
      </div>
    </nav>
   <div class="container">
        <br><br><br>
        <div class="row">
              <div class="panel panel-primary">
  <div class="panel-heading">
    <h3 class="panel-title">Editar Ciudades</h3>
  </div>
        <br>
        <% String ciudad_id=request.getParameter("ciudad_id"); %>
        
        <form method="post" action="../ServletCiudad">
        <table class="table-condensed table-hover table-bordered">
            <tr>
                <td>CIUDAD ID</td><td><input type="text" name="ciudad_id" readonly="true" value="<% out.println(""+ciudad_id);  %>"></td>
            </tr>
            <%  Coneccion con=new Coneccion();
                con.setConsulta("select * from Ciudades where ciudad_id='"+ciudad_id+"'");
                while(con.getResultado().next()){
            
            
            %>
            
            <tr>
                <td>NOMBRE</td><td><input type="text" name="nombre" value="<% out.println(""+con.getResultado().getString("nombre"));  %>"></td>
            </tr>
             <tr>
                <td>PAIS_ID</td><td><input type="text" name="pais_id" value="<% out.println(""+con.getResultado().getString("pais_id"));  %>"></td>
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