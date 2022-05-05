package com.example.practica2daw;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "Tramitacion", value = "/Tramitacion")
public class Tramitacion extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession sesion = request.getSession();

        String usuario = (String)sesion.getAttribute("usuario");
        System.out.println(usuario);
        UsuarioBD user = AccesoBD.getInstance().obtenerUsuarioBD(usuario);

        java.util.Date date = new java.util.Date();
        java.sql.Date sqlDate= new java.sql.Date(date.getTime());
        System.out.println(sqlDate);

        float total = (float) sesion.getAttribute("total");
        sesion.removeAttribute("total");
        AccesoBD.getInstance().insertarPedido(user.getCodigo(), sqlDate, total, 1);
        ArrayList <Producto> carrito = (ArrayList<Producto>)sesion.getAttribute("carrito");
        ArrayList<PedidoBD> pedidos = (ArrayList)AccesoBD.getInstance().obtenerPedidosBD(user.getCodigo());
        PedidoBD pedido = new PedidoBD();
        pedido = pedidos.get(pedidos.size()-1);
        Producto producto = new Producto();
        for(int i = 0; i<carrito.size(); i++)
        {
            producto = carrito.get(i);
            AccesoBD.getInstance().insertarDetallePedido(pedido.getCodigo(), producto.getId(), producto.getCantidad(), producto.getPrecio());
            AccesoBD.getInstance().decrementarExistenciaProducto(producto.getId(), producto.getCantidad());
        }
        response.sendRedirect("pedidofinalizado.jsp");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }
}
