<%-- 
    Document   : Agregar
    Created on : 27-ene-2024, 18:13:15
    Author     : Usuario
--%>

<%@page import="com.mysql.jdbc.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="com.mysql.jdbc.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <title>JSP Page</title>
    </head>
    <body>
        <div class="container">
            <h1>Agregar Registro</h1>
            <hr>
            <form action="" method="post" class="form-control" style="width: 500px; height: 400px">
                DNI:
                <input type="text" name="txtDNI" class="form-control">
                Nombres:
                <input type="text" name="txtNom" class="form-control">
                <br>
                <br>
                <input type="submit" value="Guardar" class="btn btn-primary btn-lg">
                <a href="index.jsp">Regresar</a>
            </form>

        </div>

    </body>
</html>
<%
    // Conectando a la base de datos
    Connection con;
    String url = "jdbc:mysql://localhost:3307/registrocrudsimple";
    String Driver = "com.mysql.jdbc.Driver";
    String user = "root";
    String clave = "";

    /*Se carga el controlador JDBC utilizando Class.forName(Driver). Esto es necesario para que 
      el controlador esté disponible para su uso.*/
    Class.forName(Driver);
    con = (Connection) DriverManager.getConnection(url, user, clave); // Se establece la conexión con la bd utilizando DriverManager.getConnection(url, user, clave).

    // Capturamos los datos
    PreparedStatement ps;
    String dni, nom;
    dni = request.getParameter("txtDNI");
    nom = request.getParameter("txtNom");
    if (nom != null && dni != null) {
        ps = (PreparedStatement) con.prepareStatement("insert into usuario(DNI, Nombres) values('" + dni + "', '" + nom + "')");
        ps.executeUpdate();
        response.sendRedirect("index.jsp");
    }
%>