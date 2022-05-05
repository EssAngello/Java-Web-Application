package com.example.practica2daw;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ActualizarDatosUsuario", value = "/ActualizarDatosUsuario")
public class ActualizarDatosUsuario extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
        HttpSession sesion = request.getSession();
        String usuario = request.getParameter("usuario");
        String nombre = request.getParameter("nombre");
        String apellidos = request.getParameter("apellidos");
        String domicilio = request.getParameter("domicilio");
        String poblacion = request.getParameter("poblacion");
        String provincia = request.getParameter("provincia");
        String cp = request.getParameter("cp");
        String telefono = request.getParameter("telefono");

        if(AccesoBD.getInstance().actualizarDatosUsuario(usuario,nombre,apellidos,domicilio,poblacion,provincia,cp,telefono))
            sesion.setAttribute("mensaje","Datos actualizados correctamente");
        else
            sesion.setAttribute("mensaje","Error al actualizaar los datos");

        response.sendRedirect("usuariodatosenvio.jsp");
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
