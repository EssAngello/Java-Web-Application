<%--
  Created by IntelliJ IDEA.
  User: aange
  Date: 17/04/2022
  Time: 20:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <script src="jquery-3.6.0.min.js"></script>
    <title>Angello Litrico</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="imagenes/al%20logo%20(2).jpg">
    <link rel="stylesheet" href="estilos.css">
    <link rel="stylesheet" href="estilosproductos.css">
    <link rel="stylesheet" href="estiloscontacto.css">
    <link rel="stylesheet" href="estiloscarrito.css">
    <link rel="stylesheet" href="estilosusuario.css">
    <link rel="stylesheet" href="estilosadmin.css">
    <link rel="stylesheet" href="estilosusuariomenu.css">
    <link rel="stylesheet" href="estilosusuariodatosenvio.css">
    <link rel="stylesheet" href="estilosusuariogestionarpedidos.css">
    <link rel="stylesheet" href="estilosusuariopedidoactual.css">
    <link rel="stylesheet" href="estilosadminmenu.css">
    <link rel="stylesheet" href="estilosadminusuarios.css">
    <link rel="stylesheet" href="estilosadminpedidos.css">
    <link rel="stylesheet" href="estilosadminproductos.css">
    <link rel="stylesheet" href="estilosresguardo.css">
    <link rel="stylesheet" href="estilospedidofinalizado.css">
    <script src="libCapas2021.js"></script>
    <script src="inicio.js"></script>
    <script src="funcionescarrito.js"></script>
    <script src="usuariojs.js"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Dongle&display=swap" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Cinzel&display=swap" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Cinzel&family=Playfair+Di
    splay+SC:ital,wght@1,900&display=swap" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display+SC:ital@1&display=swap" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500&display=swap" rel="stylesheet">
    <link href='https://fonts.googleapis.com/css?family=Lato:300,400|Montserrat:700' rel='stylesheet' type='text/css'>
    <link href="https://fonts.googleapis.com/css2?family=Akshar&display=swap" rel="stylesheet">
</head>
<body onload="Cargar('inicio de verdad.html', 'cuerpo')">
<nav class="nav">
    <img class="logo" alt src="imagenes/angello%20litrico%20logo.png">
    <ul id="nav-bar" class="nav-bar">

        <li class="a"><a href="#" onclick="Cargar('inicio de verdad.html','cuerpo')">Nosotros</a><div class="linea"></div></li>
        <li class="a"><a href="#" onclick="Cargar('productos.jsp','cuerpo')">Productos</a><div class="linea"></div></li>
        <li class="a"><a href="#" onclick="Cargar('contacto.html','cuerpo')">Contacto</a><div class="linea"></div></li>
        <li class="a"><a href="#" onclick="Cargar('carrito.html','cuerpo')"><img alt="carrito" src="imagenes/shopping-cart.png" class="carrito-img"></a><div class="linea"></div></li>
        <li class="a"><img onclick="Cargar('usuario.jsp','cuerpo')" alt="usuario" src="imagenes/user.png" class="user-img"><div class="linea"></div></li>
        <li class="a"><img onclick="Cargar('admin.html','cuerpo')" alt="admin" src="imagenes/leadership.png" class="admin-img"><div class="linea"></div></li>
        <li class="b"><a href="javascript:void(0);" class="iconbars" onclick="navbarresponsive()"><i class="fa fa-bars"></i></a></li>
    </ul>

</nav>

<div id="cuerpo">

</div>
<footer>
    <div class="containerfooter">
        <div class="footer-logo">
            <img src="imagenes/angello%20litrico%20logo.png" alt="footer logo" class="footer-logo-img">
        </div>
        <div class="footer-map">
            <h2>Location</h2>
            <div style="width: 100%"><iframe width="100%" height="100%" src="https://maps.google.com/maps?width=100%25&amp;height=600&amp;hl=en&amp;q=1%20Grafton%20Street,%20Dublin,%20Ireland+(My%20Business%20Name)&amp;t=&amp;z=14&amp;ie=UTF8&amp;iwloc=B&amp;output=embed"></iframe></div>
        </div>
        <div class="nada"></div>
        <div class="the-collection">
            <h3>Shopping</h3>
            <ul style="list-style-type: none; line-height: 150%;">
                <li><a href="#">Productos</a></li>
                <li><a href="#">Carrito</a></li>
            </ul>
        </div>
        <div class="my-user">
            <h3>My User</h3>
            <ul style="list-style-type: none; line-height: 150%;">
                <li><a href="#">Mi Usuario</a></li>
                <li><a href="#">Administración</a></li>
            </ul>
        </div>
        <div class="footer-contact-us">
            <div class="footer-contact-us-left">
                <h3>Contact</h3>
                <ul style="list-style-type: none">
                    <li>E-mail:</li>
                    <li>Teléfono:</li>
                    <li>Dirección:</li>
                    <li>Fax:</li>
                </ul>
            </div>
            <div class="footer-contact-us-right">
                <h3>#######</h3>
                <ul style="list-style-type: none">
                    <li>anbracer@alumni.uv.es</li>
                    <li>+34 123 456 789</li>
                    <li>Av/Burjassot</li>
                    <li>+34 123 456 789</li>
                </ul>
            </div>
        </div>
        <div class="follow-us">
            <h2>Follow Us</h2>
            <i class="fa fa-apple" id="apple"></i>
            <i class="fa fa-twitter" id="twitter"></i>
            <i class="fa fa-youtube" id="youtube"></i>
            <i class="fa fa-instagram" id="instagram"></i>
            <i class="fa fa-facebook-square" id="facebook"></i>
        </div>
    </div>
</footer>
</body>
</html>
