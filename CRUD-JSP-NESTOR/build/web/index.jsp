<%-- 
    Document   : index
    Created on : 26-ene-2024, 21:18:05
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
        String url="jdbc:mysql://localhost:3307/registrocrudsimple";
        String Driver="com.mysql.jdbc.Driver";
        String user="root";
        String clave="";
        
        /*Se carga el controlador JDBC utilizando Class.forName(Driver). Esto es necesario para que 
        el controlador esté disponible para su uso.*/
        Class.forName(Driver);
        con = (Connection) DriverManager.getConnection(url, user, clave); // Se establece la conexión con la bd utilizando DriverManager.getConnection(url, user, clave).
        
        // Empezamos listando los datos de la tabla usuario
        PreparedStatement ps;
        ResultSet rs;
        ps = (PreparedStatement) con.prepareStatement("select * from usuario"); // Se prepara una consulta SQL utilizando PreparedStatement.
        rs=ps.executeQuery(); // Se puede utilizar el objeto ResultSet para obtener los datos de la consulta y realizar las operaciones necesarias.
        
        // Creamos la tabla
        %>
        <div class="container">
            <h1>Lista de Registro</h1>
            <hr>
            <a class="btn btn-success btn-lg" href="Agregar.jsp">
                <img src="imagenes/agregar-archivo.png" alt="Agregar" width="16" height="16"> Nuevo Registro
            </a>
            <br>
            <table class="table table-bordered">
                <tr>
                    <th class="text-center">ID</th>
                    <th class="text-center">DNI</th>
                    <th>NOMBRE</th>
                    <th class="text-center">ACCIONES</th>
                </tr>
                <%
                    while(rs.next()){
                %>
                <tr>
                    <td class="text-center"><%= rs.getInt("Id") %></td>
                    <td class="text-center"><%= rs.getString("DNI") %></td>
                    <td><%= rs.getString("Nombres") %></td>
                    <td class="text-center">
                        <a href="Editar.jsp?id=<%= rs.getInt("Id") %>" class="btn btn-warning btn-sm">
                            <img src="imagenes/lapiz.png" alt="Editar" width="16" height="16"> Editar
                        </a>
                        <a href="Delete.jsp?id=<%= rs.getInt("Id") %>" class="btn btn-danger btn-sm">
                            <img src="imagenes/basura.png" alt="Eliminar" width="16" height="16"> Eliminar
                        </a>
                    </td>
                </tr>
                <% } %>
            </table>
        </div>
    </body>
    <!--
    CREATE TABLE usuario(
 	id int AUTO_INCREMENT,
        DNI varchar(100),
        Nombres varchar(100),
        CONSTRAINT pk_idRegistro PRIMARY KEY(id)
    );
    -->
</html>
