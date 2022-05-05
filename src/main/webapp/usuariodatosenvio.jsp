<%@ page import="com.example.practica2daw.UsuarioBD" %>
<%@ page import="com.example.practica2daw.AccesoBD" %><%--
  Created by IntelliJ IDEA.
  User: aange
  Date: 21/04/2022
  Time: 13:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    String usuarioActual = (String)session.getAttribute("usuario");
    AccesoBD con = AccesoBD.getInstance(); //Instancia de la clase factoría AccesoBD
    UsuarioBD user = con.obtenerUsuarioBD(usuarioActual);
    String nombre = user.getNombre();
    String apellidos = user.getApellidos();
    String domicilio = user.getDomicilio();
    String poblacion = user.getPoblacion();
    String provincia = user.getProvincia();
    String cp = user.getCp();
    String telefono = user.getTelefono();
    String mensaje = (String)session.getAttribute("mensaje");
    if (mensaje != null) { //Eliminamos el mensaje consumido
        session.removeAttribute("mensaje");
%>

<div class="usuariodatosenvio-text-container">
    <h2 id="usuariodatosenvio-text"><%=mensaje%></h2>
</div>

<%
    }
%>

<div class="datosenvio">
    <form action="#" class="formdatosenvio" onsubmit="ProcesarForm(this,'ActualizarDatosUsuario','opcionseleccionada');return false" method="post">
        <table class="tabladatosenvio">
            <tr>
                <td>
                    <label for="usuario">Usuario:</label>
                </td>
                <td>
                    <input id="usuario" name="usuario" type="text" disabled="true" value="<%=usuarioActual%>">
                </td>
            </tr>
            <tr>
                <td>
                    <label for="nombre">Nombre:</label>
                </td>
                <td>
                    <input id="nombre" name="nombre" type="text" value="<%=nombre%>">
                </td>
            </tr>
            <tr>
                <td>
                    <label for="apellidos">Apellidos:</label>
                </td>
                <td>
                    <input id="apellidos" name="apellidos" type="text" value="<%=apellidos%>">
                </td>
            </tr>
            <tr>
                <td>
                    <label for="domicilio">Domicilio:</label>
                </td>
                <td>
                    <input id="domicilio" name="domicilio" type="text" value="<%=domicilio%>">
                </td>
            </tr>
            <tr>
                <td>
                    <label for="poblacion">Poblacion:</label>
                </td>
                <td>
                    <input id="poblacion" name="poblacion" type="text" value="<%=poblacion%>">
                </td>
            </tr>
            <tr>
                <td>
                    <label for="provincia">Provincia:</label>
                </td>
                <td>
                    <input id="provincia" name="provincia" type="text" value="<%=provincia%>">
                </td>
            </tr>
            <tr>
                <td>
                    <label for="cp">CP:</label>
                </td>
                <td>
                    <input id="cp" name="cp" type="text" value="<%=cp%>">
                </td>
            </tr>
            <tr>
                <td>
                    <label for="telefono">Telefono:</label>
                </td>
                <td>
                    <input id="telefono" name="telefono" type="text" value="<%=telefono%>">
                </td>
            </tr>
            <tr>
                <td colspan = 2>
                    <button class="botonadminverde" type="submit" name="actualizardatos" value="Actualizar">
                        <span class="shadow"></span>
                        <span class="edgeverde"></span>
                        <span class="frontverde text">Actualizar</span>
                    </button>
                </td>
            </tr>
        </table>
    </form>
</div>
