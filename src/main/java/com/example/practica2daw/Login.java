package com.example.practica2daw;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "Login", value = "/Login")
public class Login extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String usuario = request.getParameter("usuario"); //Se obtiene el nombre de usuario
        String clave = request.getParameter("clave"); //Se obtiene la clave de usuario del formulario
        HttpSession sesion = request.getSession(true); //Se accede al entorno de la sesión
        AccesoBD con = AccesoBD.getInstance(); //Instancia de la clase factoría AccesoBD
        UsuarioBD user = con.obtenerUsuarioBD(usuario);
        if ((usuario != null) && (clave!=null) && (usuario != "") && (clave!="")) //Se si se han pasado usuario y clave
        {
            if (con.comprobarUsuarioBD(usuario, clave)) // Se comprueba en la base de datos
            { // Registramos al usuario en el entorno de la sesión
                sesion.setAttribute("usuario", usuario);
            }
            else if(user.getActivo()!=1)
            {
                sesion.setAttribute("mensaje","El usuario no esta activo");
            }
            else // El usuario/clave no se encuentra en la BD
            { // Registramos el error en el entorno de la sesión
                sesion.setAttribute("mensaje","Usuario y/o clave incorrectos");
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
