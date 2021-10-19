

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="./styles.css">
    </head>
    <body>
        
        <jsp:useBean id="miLibro" scope="request" class="com.emergentes.modelo.Libro" />
        <form action="Controller" method="post" class="box">
            <h1 class="title">
            <c:if test="${requestScope.op == 'nuevo'}" var="res" scope="request" >
                Registro de
            </c:if>
            <c:if test="${requestScope.op == 'modificar'}" var="res" scope="request" >
                Modificar
            </c:if>
            Libro
        </h1>
            <input type="hidden" name="id" value="<jsp:getProperty name="miLibro" property="id" />" />

            <label>Titulo. . .: </label>
            <input type="text" name="titulo" value="<jsp:getProperty name="miLibro" property="titulo" />" /><br><br>

            <label>Autor. . .: </label>
            <input type="text" name="autor" value="<jsp:getProperty name="miLibro" property="autor" />" /><br><br>

            <label>Resumen: </label>
            <textarea name="resumen" rows="6" cols="45px" placeholder="Escribe aquí tus comentarios" 
                      ><jsp:getProperty name="miLibro" property="resumen" /></textarea><br><br>

            <label>Medio: </label><br>
            <input type="radio" name="medio" value="Fisico" id="fis" <c:if test="${miLibro.medio == 'Fisico'}" var="res" scope="request">checked="checked"</c:if> > <label for="fis">Fisico</label><br>

                <input type="radio" name="medio" value="Magnetico" id="mag" <c:if test="${miLibro.medio == 'Magnetico'}" var="res" scope="request">checked="checked"</c:if> ><label for="mag">Magnetico</label>

                <input type="hidden" name="opg" value="${requestScope.op}"/>
            <input type="hidden" name="op" value="grabar"/>
            <button type="submit" value="Enviar" >Enviar</button>
        </form>


    </body>
</html>
