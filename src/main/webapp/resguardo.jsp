<%@ page import="com.example.practica2daw.UsuarioBD" %>
<%@ page import="com.example.practica2daw.Producto" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: aange
  Date: 21/04/2022
  Time: 16:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    UsuarioBD usuario = (UsuarioBD)session.getAttribute("usuario-servlet");
    String nombre = usuario.getNombre();
    String apellidos = usuario.getApellidos();
    String domicilio = usuario.getDomicilio();
    String poblacion = usuario.getPoblacion();
    String provincia = usuario.getProvincia();
    String cp = usuario.getCp();
%>
<form id="formresguardo" method="post" action="#" onsubmit="ProcesarForm(this,'Tramitacion','cuerpo');return false">
<div class="resguardo">
    <div class="resguardo-container">
        <div class="cliente">
            <div class="fila-cliente">
                <div class="label">Nombre</div>
                <div class="col"><input type="text" name="nombre" value="<%=nombre%>"></div>
            </div>
            <div class="fila-cliente">
                <div class="label">Apellidos</div>
                <div class="col"><input type="text" name="apellidos" value="<%=apellidos%>"></div>
            </div>
            <div class="fila-cliente">
                <div class="label">Domicilio</div>
                <div class="col"> <input type="text" name="domicilio" value="<%=domicilio%>"> </div>
            </div>
            <div class="fila-cliente">
                <div class="label">Poblacion</div>
                <div class="col"> <input type="text" name="poblacion" value="<%=poblacion%>"> </div>
            </div>
            <div class="fila-cliente">
                <div class="label">Provincia</div>
                <div class="col"> <input type="text" name="provincia" value="<%=provincia%>"> </div>
            </div>
            <div class="fila-cliente">
                <div class="label">CP</div>
                <div class="col"> <input type="text" name="cp" value="<%=cp%>"> </div>
            </div>

        </div>
        <div class="clientepedido">
            <h5>pedido #001</h5>
            <ul class="order-list">
                <%
                    ArrayList<Producto> carrito = (ArrayList<Producto>)session.getAttribute("carrito");
                    float total = 0;
                    float subtotalproducto = 0;
                    for(Producto producto : carrito){
                        int id = producto.getId();
                        String nombreproducto = producto.getNombre();
                        float precio = producto.getPrecio();
                        int cantidad = producto.getCantidad();
                        String imagen = producto.getImagen();
                        subtotalproducto = precio * cantidad;
                        total = total + subtotalproducto;
                %>
                <li><img src="<%=imagen%>" alt="<%=nombre%>"><h4><%=nombreproducto%></h4><h5><%=precio%> € x <%=cantidad%></h5></li>
                <%
                    }
                    session.setAttribute("total",total);
                %>
            </ul>
            <h5>TOTAL</h5>
            <h1>€ <%=total%></h1>
        </div>
        <div class="continuar">
            <div class="codigobarras">
                <img src="https://alebes.files.wordpress.com/2019/03/barcode-306926_1280.png?w=648">
            </div>
            <div class="botones">
                <button onclick="Cargar('usuario.jsp','cuerpo')">Cancelar</button>
                <button type="submit">Completar</button>
            </div>
        </div>
    </div>
</div>
</form>