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
          </ul>
        </div><!--/.nav-collapse -->
      </div>
    </nav>
          <div class="container">
        <br><br><br>
        <div class="row">
              <div class="panel panel-primary">
  <div class="panel-heading">
    <h3 class="panel-title">Crear Establecimientos</h3>
  </div>
        <br>
        <form method="post" action="../ServletEstablecimiento">
       <table class="table-condensed table-hover table-bordered">
            
            <div class="panel-body">
                        <form method="POST" action="../ServletUsuario">
                            <div class="form-group">
                                <label for="nombre">Nombre </label>
                                <input type="text" class="form-control" name="nombre" id="nombre" placeholder="Ingresar Nombre">
                            </div>
                            <div class="form-group">
                                <label for="nombre">Fecha_Creacion</label>
                                <input type="date" class="form-control" name="fecha_creacion" id="nombre" placeholder="Ingresar fecha">
                            </div>
                            
                            <div class="form-group">
                                <label for="nombre">Creado_por</label>
                                <input type="text" class="form-control" name="creado_por" id="nombre" placeholder="Ingresar Autor">
                            </div>
                            <div class="form-group">
                                <label for="nombre">Ciudad</label>
                                <%
                                    Coneccion con=new Coneccion();
                                    con.setConsulta("select * from ciudades where estado='activo'");
                                %>
                                <select  name="ciudad_id" class="form-control">
                                    <% while(con.getResultado().next()){ %>
                                    <option value=<% out.println(""+con.getResultado().getString("ciudad_id")); %>><% out.println(""+con.getResultado().getString("nombre")); %></option>
                                    <% } %>
                                </select>
                                <td><input type="submit" name="guardar" value="Guardar"></td>
                         

                            </div>
        </form>
             

    </body>
</html>