<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
    
        <title>JSP Page</title>
      
    </head>
    <body>
        <h1>LOGIN</h1>
       <form action="ServletLogin" method="POST">
  Usuario: <input type="text" name="usuario">
  <br>
    Clave : <input type="password" name="clave">
   <br>
   <input type="submit" value="Enviar">
</form>
        
        
    </body>
</html>