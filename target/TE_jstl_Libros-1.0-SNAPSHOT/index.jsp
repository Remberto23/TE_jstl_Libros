<%@page import="com.emergentes.modelo.Libro"%>
<%@page import="com.emergentes.modelo.GestorLibros"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    if (session.getAttribute("agenda") == null) {
        GestorLibros objeto1 = new GestorLibros();

        objeto1.insertarLibro(new Libro(1, "Al Faro", "Virginia Woolf", "Narra la historia de la familia Ramsey en la isla escocesa de Skye", "Fisico"));
        objeto1.insertarLibro(new Libro(2, "Antes del Fin", "Ernesto Sabato", "Trata de un estremecedor viaje interestelar", "Fisico"));
        objeto1.insertarLibro(new Libro(3, "Aquí Vivieron", "Manuel Mujica Láinez", "Cuenta la historia de una quinta de San Isidro", "Fisico"));

        session.setAttribute("agenda", objeto1);
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="./styles.css">
    </head>
    <body class="body_lista">
        <div id="contenedor">
            <h1>Lista de Libros</h1>
            <a href="Controller?op=nuevo" >Nuevo</a>
            <table border="1">
                <thead>
                    <tr>
                        <th>Id</th>
                        <th>Titulo</th>
                        <th>Autor</th>
                        <th>Resumen</th>
                        <th>Medio</th>
                        <th>Accion</th>
                    </tr>
                </thead>
                <c:forEach var="item" items="${sessionScope.agenda.getLista()}" >
                    <tr>
                        <td>${item.id}</td>
                        <td>${item.titulo}</td>
                        <td>${item.autor}</td>
                        <td>${item.resumen}</td>
                        <td>${item.medio}</td>
                        <td> <a href="Controller?op=modificar&id=${item.id}" >Modificar</a> |
                        <a href="Controller?op=eliminar&id=${item.id}" >Eliminar</a> </td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </body>
</html>
