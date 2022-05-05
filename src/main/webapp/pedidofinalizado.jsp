<%--
  Created by IntelliJ IDEA.
  User: aange
  Date: 22/04/2022
  Time: 13:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="pedidofinalizado">
    <div class="pedidofinalizado-texto">
        <h1>Pedido realizado correctamente</h1>
        <h1>Gracias por su compra!</h1>
    </div>
    <div class="pedidofinalizado-check">
        <img src="https://www.pngmart.com/files/3/Green-Tick-Transparent-PNG.png">
    </div>
    <button class="custom-btn boton" onclick="Cargar('productos.jsp', 'cuerpo')">Inicio</button>
    <script>vaciarCarrito();</script>
</div>
