package com.example.practica2daw;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "Registration", value = "/Registration")
public class Registration extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String usuario = request.getParameter("usuario"); //Se obtiene el nombre de usuario
        String clave = request.getParameter("clave"); //Se obtiene la clave de usuario del formulario
        HttpSession sesion = request.getSession(true); //Se accede al entorno de la sesión
        AccesoBD con = AccesoBD.getInstance(); //Instancia de la clase factoría AccesoBD

        if ((usuario != null) && (clave!=null) && (usuario != "") && (clave!="")) //Se si se han pasado usuario y clave
        {
            if (con.comprobarUsuarioBD(usuario, null)) // Se comprueba en la base de datos
            {
                sesion.setAttribute("mensaje", "Este usuario ya existe");
            }
            else
            {
                if(AccesoBD.getInstance().registrarUsuario(1, 0, usuario, clave, null, null, null, null, null, null, null))
                    sesion.setAttribute("mensaje","Usuario registrado");
                else{
                    sesion.setAttribute("mensaje","Error al registrar al usuario");
                }
            }
        }
        else
        { // Registramos el error en el entorno de la sesión
            sesion.setAttribute("mensaje", "Falta introducir el usuario o la clave");
        }
        response.sendRedirect("usuario.jsp"); //Redirigimos la petición a la página de login

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
