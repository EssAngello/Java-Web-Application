package com.example.practica2daw;

import javax.json.Json;
import javax.json.JsonObject;
import javax.json.JsonReader;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;

@WebServlet(name = "recogerCarrito", value = "/recogerCarrito")
public class recogerCarrito extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws IOException {
        ArrayList<Producto> carrito = new <Producto>ArrayList();
        InputStreamReader reader = new InputStreamReader(request.getInputStream());

        JsonReader jsonReader = Json.createReader(reader);
        JsonObject jobj = jsonReader.readObject();

        for(String key : jobj.keySet()) {
            JsonObject prod = jobj.getJsonObject(key);
            Producto nuevo = new Producto();
            nuevo.setId(prod.getInt("id"));
            nuevo.setNombre(prod.getString("nombre"));
            nuevo.setPrecio(Float.parseFloat(String.valueOf(prod.getInt("precio"))));
            nuevo.setCantidad(prod.getInt("cantidad"));
            nuevo.setImagen(prod.getString("imagen"));
            carrito.add(nuevo);
        }
        HttpSession sesion = request.getSession();
        String usuario = (String)sesion.getAttribute("usuario");
        UsuarioBD user = AccesoBD.getInstance().obtenerUsuarioBD(usuario);
        sesion.setAttribute("usuario-servlet", user);
        sesion.setAttribute("carrito", carrito);

        //request.getRequestDispatcher("resguardo.jsp").forward(request, response);
        response.sendRedirect("resguardo.jsp");
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
