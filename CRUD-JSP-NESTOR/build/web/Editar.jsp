<%-- 
    Document   : Editar
    Created on : 27-ene-2024, 18:36:02
    Author     : Usuario
--%>

<%@page import="java.sql.ResultSet"%>
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

            // Empezamos listando los datos de la tabla usuario pero de la fila seleccionada
            PreparedStatement ps;
            ResultSet rs;
            int id = Integer.parseInt(request.getParameter("id"));

            ps = (PreparedStatement) con.prepareStatement("select * from usuario where Id = " + id); // Se prepara una consulta SQL utilizando PreparedStatement.
            rs = ps.executeQuery(); // Se puede utilizar el objeto ResultSet para obtener los datos de la consulta y realizar las operaciones necesarias.

            while (rs.next()) {
        %>
        <div class="container">
            <h1>Modificar Registro</h1>
            <hr>
            <form action="" method="post" class="form-control" style="width: 500px; height: 400px">
                DNI:
                <input type="text" readonly="" class="form-control" value="<%= rs.getInt("Id") %>"> <!--readonly="": este atributo sirve para que el input o la caja de texto no se pueda editar por el usuario-->
                DNI:
                <input type="text" name="txtDNI" class="form-control" value="<%= rs.getString("DNI") %>">
                Nombres:
                <input type="text" name="txtNom" class="form-control" value="<%= rs.getString("Nombres") %>">
                <br>
                <br>
                <input type="submit" value="Guardar" class="btn btn-primary btn-lg">
                <a href="index.jsp">Regresar</a>
            </form>
            <% } %>
        </div>
        
    </body>
</html>
<%
    String dni, nom;
    dni = request.getParameter("txtDNI");
    nom = request.getParameter("txtNom");
    if (nom != null && dni != null) {
        ps = (PreparedStatement) con.prepareStatement("update usuario set DNI = '" + dni + "', Nombres = '" + nom + "' where Id = " + id);
        ps.executeUpdate();
        response.sendRedirect("index.jsp");
    }
%>
