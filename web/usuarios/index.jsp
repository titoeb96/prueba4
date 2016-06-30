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
             <li><a href="../ciudades/index.jsp">Ciudades</a></li>
            <li><a href="../establecimientos/index.jsp">Establecimientos</a></li>
            <li><a href="../paises/index.jsp">Paises</a></li>
            <li><a href="index.jsp">Usuarios</a></li>
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
    <h3 class="panel-title">Listar Usuarios</h3>
  
  </div>
  </div>
        <br>
        <a href="crear.jsp">CREAR Usuarios</a>
        <br>
        <a href="newjsp.jsp">Reportes</a>
        <br>
        <a href="../menu.jsp">REGRESAR AL MENU PRINCIPAL</a>
        <br>
        <form method="post" action="index.jsp">
            Buscar por Nombre:<input type="text" name="buscarNombre" ><input type="submit" value="Buscar">
        </form>
         <table class="table-condensed table-hover table-bordered">
            <thead>
            <th>ID</th>
            <th>USUARIO</th>
            <th>CLAVE</th>
            <th>FECHA DE NACIMIENTO</th>
           
        </thead>
        <tbody>
            <%
                Coneccion con = new Coneccion();
                if (request.getParameter("buscarNombre") != null) {
                    if (request.getParameter("buscarNombre").isEmpty()) {
                        con.setConsulta("select * from Usuarios where estado='activo'");
                    } else {
                        String nombre = request.getParameter("buscarNombre");
                        con.setConsulta("select * from Usuarios where usuario like '%"+nombre+"%' and estado='activo'");
                    }
                }else{
                    con.setConsulta("select * from Usuarios where estado='activo'");
                }
            %>
            <% while (con.getResultado().next()) { %>
            <tr>
                <%
                    out.println("<td>" + con.getResultado().getString("usuario_id") + "</td>");
                    out.println("<td>" + con.getResultado().getString("usuario") + "</td>");
                    out.println("<td>" + con.getResultado().getString("clave") + "</td>");
                    out.println("<td>" + con.getResultado().getString("fecha_nacimiento") + "</td>");
                    
                 out.println("<td>" + "<a href='../ServletUsuario?eliminar=" + con.getResultado().getString("usuario_id") + "'>Eliminar</a>" + "</td>");
                    out.println("<td>" + "<a href='editar.jsp?usuario_id=" + con.getResultado().getString("usuario_id") + "'>Editar</a>" + "</td>");
                %>

            </tr>
            <% }%>
        </tbody>

    </table>
      
</body>
</script
          <!-- Bootstrap core JavaScript
        ================================================== -->
        <!-- Placed at the end of the document so the pages load faster -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <script src="template/js/bootstrap.min.js"></script>

</html>