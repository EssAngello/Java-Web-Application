<%--
  Created by IntelliJ IDEA.
  User: aange
  Date: 20/04/2022
  Time: 15:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    //Se obtiene el usuario actual registrado en el servicio web, del entorno de sesión
    String usuarioActual = (String)session.getAttribute("usuario");

    if (usuarioActual == null) //No hay usuario registrado
    { //Mostramos el formulario para la introducción del usuario y la clave
%>
<div class="usuario-text-container">
    <h2 id="usuario-text">
        <%
            //Utilizamos una variable en la sesión para informar de los mensajes de Error
            String mensaje = (String)session.getAttribute("mensaje");
            if (mensaje != null) { //Eliminamos el mensaje consumido
                session.removeAttribute("mensaje");
        %>
        <%=mensaje%>
        <%
        }
        else{
        %>
        Usuario
        <%
            }
        %>
    </h2>
</div>
<div class="usuario">
    <div class="container right-panel-active">
        <!-- Sign Up -->
        <div class="container__form container--signup">
            <form action="#" class="form" onsubmit="ProcesarForm(this,'Registration','cuerpo');return false" id="form1">
                <h2 class="form__title">Sign Up</h2>
                <input type="text" placeholder="User" class="input" name="usuario"/>
                <!--<input type="email" placeholder="Email" class="input" />-->
                <input type="password" placeholder="Password" class="input" name="clave"/>
                <button class="btn" type="submit">Sign Up</button>
            </form>
        </div>

        <!-- Sign In -->
        <div class="container__form container--signin">
            <form action="#" class="form" onsubmit="ProcesarForm(this,'Login','cuerpo');return false" id="form2" >
                <h2 class="form__title">Sign In</h2>
                <input type="text" placeholder="User" class="input" name="usuario"/>
                <input type="password" placeholder="Password" class="input" name="clave"/>
                <a href="#" class="link">Forgot your password?</a>
                <button class="btn" type="submit">Sign In</button>
            </form>
        </div>

        <!-- Overlay -->
        <div class="container__overlay">
            <div class="overlay">
                <div class="overlay__panel overlay--left">
                    <button class="btn" id="signIn" onclick="signInBtn()">Sign In</button>
                </div>
                <div class="overlay__panel overlay--right">
                    <button class="btn" id="signUp" onclick="signUpBtn()">Sign Up</button>
                </div>
            </div>
        </div>
    </div>
</div>

<%

}
else {
    //Si existe un usuario, se mostrará las opciones del apartado del usuario
%>


<div class="usuariomenu">
    <div class="botones-usuario">
        <button class="custom-btn boton" onclick="Cargar('usuariodatosenvio.jsp','opcionseleccionada')" style="height: 50px;">Datos envio</button>
        <button class="custom-btn boton" onclick="Cargar('usuariogestionarpedidos.html','opcionseleccionada')" style="height: 50px;">Gestionar Pedidos</button>
        <button class="custom-btn boton" onclick="Cargar('usuariopedidoactual.html','opcionseleccionada')" style="height: 50px;">Pedido Actual</button>
        <button class="custom-btn boton" style="height: 50px;">Cerrar Sesion</button>
    </div>
    <div class="opcionseleccionada" id="opcionseleccionada">

    </div>
</div>

<script>Cargar('usuariopedidoactual.html','opcionseleccionada')</script>

<%
    }
%>
