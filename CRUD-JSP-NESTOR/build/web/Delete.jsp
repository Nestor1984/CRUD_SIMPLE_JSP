<%-- 
    Document   : Delete
    Created on : 27-ene-2024, 18:36:14
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
            int id = Integer.parseInt(request.getParameter("id"));
            ps = (PreparedStatement) con.prepareStatement("delete from usuario where Id = " + id); // Se prepara una consulta SQL utilizando PreparedStatement.
            ps.executeUpdate();
            response.sendRedirect("index.jsp");
        %>
    </body>
</html>
