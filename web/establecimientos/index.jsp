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
    <h3 class="panel-title">Listar Establecimientos</h3>
  </div>
  </div>
        <br>
        <a href="crear.jsp">CREAR Establecimiento</a>
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
            <th>NOMBRE</th>
            <th>FECHA CREACION</th>
            <th>CIUDAD</th>
            <th>CREADO POR</th>
        </thead>
        <tbody>
            <%
                Coneccion con = new Coneccion();
                if (request.getParameter("buscarNombre") != null) {
                    if (request.getParameter("buscarNombre").isEmpty()) {
                        con.setConsulta("select Establecimientos.establecimiento_id,Establecimientos.nombre,Establecimientos.fecha_creacion,Establecimientos.creado_por,Ciudades.nombre as ciudad from Establecimientos,Ciudades where Establecimientos.estado='activo' and Ciudades.ciudad_id=Establecimientos.ciudad_id");
                    } else {
                        String nombre = request.getParameter("buscarNombre");
                        con.setConsulta("select Establecimientos.establecimiento_id,Establecimientos.nombre,Establecimientos.fecha_creacion,Establecimientos.creado_por,Ciudades.nombre as ciudad from Establecimientos,Ciudades where Establecimientos.nombre like '%"+nombre+"%' and Establecimientos.estado='activo' and Establecimientos.ciudad_id=Ciudades.ciudad_id");
                    }
                }else{
                    con.setConsulta("select Establecimientos.establecimiento_id,Establecimientos.nombre,Establecimientos.fecha_creacion,Establecimientos.creado_por,Ciudades.nombre as ciudad from Establecimientos,Ciudades where Establecimientos.estado='activo' and Ciudades.ciudad_id=Establecimientos.ciudad_id");
                }
            %>
            <% while (con.getResultado().next()) { %>
            <tr>
                <%
                    out.println("<td>" + con.getResultado().getString("establecimiento_id") + "</td>");
                    out.println("<td>" + con.getResultado().getString("nombre") + "</td>");
                    out.println("<td>" + con.getResultado().getString("fecha_creacion") + "</td>");
                    out.println("<td>" + con.getResultado().getString("ciudad") + "</td>");
                    out.println("<td>" + con.getResultado().getString("creado_por") + "</td>");
                 out.println("<td>" + "<a href='../ServletEstablecimiento?eliminar=" + con.getResultado().getString("establecimiento_id") + "'>Eliminar</a>" + "</td>");
                    out.println("<td>" + "<a href='editar.jsp?establecimiento_id=" + con.getResultado().getString("establecimiento_id") + "'>Editar</a>" + "</td>");
                %>

            </tr>
            <% }%>
        </tbody>

    </table>

</div>

          <!-- Bootstrap core JavaScript
        ================================================== -->
        <!-- Placed at the end of the document so the pages load faster -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <script src="template/js/bootstrap.min.js"></script>
</body>
</html>