<%@ page import="com.example.practica2daw.AccesoBD" %>
<%@ page import="com.example.practica2daw.ProductoBD" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: aange
  Date: 17/04/2022
  Time: 19:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="alert hide">
    <span class="fas fa-exclamation-circle"></span>
    <span class="msg">Atención: Producto añadido al carrito</span>
    <div class="close-btn">
        <span class="fas fa-times"></span>
    </div>
</div>
<div class="now-available">
    <h2 id="nowavailable">Now Available</h2>
</div>
<div class="productos">
    <%
        AccesoBD con = AccesoBD.getInstance();
        List<ProductoBD> productos = con.obtenerProductosBD();
    %>
    <%
        for(ProductoBD producto : productos){
            int existencias = producto.getStock();
            if(existencias <= 0)
                continue;
            int codigo = producto.getId();
            String descripcion = producto.getDescripcion();
            float precio = producto.getPrecio();
            String imagen = producto.getImagen();
            String director = producto.getDirector();
    %>
            <div class="container-pr">
                <img src="<%=imagen%>" alt="<%=descripcion%>" class="imagenpeli">
                <h3><%=descripcion%></h3>
                <div class="dir"><h4>Dir: <%=director%></h4></div>
                <div class="precio"><h4><%=precio%>€</h4></div>
                <button class="custom-btn boton" onclick="añadirCarrito(<%=codigo%>,'<%=descripcion%>',1,<%=precio%>,'<%=imagen%>', '<%=director%>')">COMPRAR</button>
            </div>
    <%
        }
    %>
    <!--<div class="container-pr">
        <img src="imagenespelis/12angrymen.jpg" alt="12 angry men" class="imagenpeli">
        <h3>12 Angry Men</h3>
        <div class="dir"><h4>Dir: Sidney Lumet</h4></div>
        <div class="precio"><h4>20€</h4></div>
        <button class="custom-btn boton" onclick="añadirCarrito(1,'12 Angry Men',1,20,'imagenespelis/12angrymen.jpg', 'Sidney Lumet')">COMPRAR</button>
    </div>
    <div class="container-pr">
        <img src="imagenespelis/2046.jpg" alt="2046" class="imagenpeli">
        <h3>2046</h3>
        <div class="dir"><h4>Dir: Wong Kar Wai</h4></div>
        <div class="precio"><h4>20€</h4></div>
        <button class="custom-btn boton" onclick="añadirCarrito(2,'2046',1,20,'imagenespelis/2046.jpg', 'Wong Kar Wai')">COMPRAR</button>
    </div>
    <div class="container-pr">
        <img src="imagenespelis/after%20life.jpg" alt="after life" class="imagenpeli">
        <h3>After Life</h3>
        <div class="dir"><h4>Dir: Hirokazu Koreeda</h4></div>
        <div class="precio"><h4>20€</h4></div>
        <button class="custom-btn boton" onclick="añadirCarrito(3,'After Life',1,20,'imagenespelis/after life.jpg', 'Hirokazu Koreeda')">COMPRAR</button>
    </div>
    <div class="container-pr">
        <img src="imagenespelis/amadeus.jpg" alt="amadeus" class="imagenpeli">
        <h3>Amadeus</h3>
        <div class="dir"><h4>Dir: Milos Forman</h4></div>
        <div class="precio"><h4>20€</h4></div>
        <button class="custom-btn boton" onclick="añadirCarrito(4,'Amadeus',1,20,'imagenespelis/amadeus.jpg', 'Milos Forman')">COMPRAR</button>
    </div>
    <div class="container-pr">
        <img src="imagenespelis/burning.jpg" alt="burning" class="imagenpeli">
        <h3>Burning</h3>
        <div class="dir"><h4>Dir: Lee Chang-Dong</h4></div>
        <div class="precio"><h4>20€</h4></div>
        <button class="custom-btn boton" onclick="añadirCarrito(5,'Burning',1,20,'imagenespelis/burning.jpg', 'Lee Chang-Dong')">COMPRAR</button>
    </div>
    <div class="container-pr">
        <img src="imagenespelis/chungking%20express.jpg" alt="chungking express" class="imagenpeli">
        <h3>Chungking Express</h3>
        <div class="dir"><h4>Dir: Wong Kar Wai</h4></div>
        <div class="precio"><h4>20€</h4></div>
        <button class="custom-btn boton" onclick="añadirCarrito(6,'Chungking Express',1,20,'imagenespelis/chungking express.jpg', 'Wong Kar Wai')">COMPRAR</button>
    </div>
    <div class="container-pr">
        <img src="imagenespelis/fallen%20angels.jpg" alt="fallen angels" class="imagenpeli">
        <h3>Fallen Angels</h3>
        <div class="dir"><h4>Dir: Wong Kar Wai</h4></div>
        <div class="precio"><h4>20€</h4></div>
        <button class="custom-btn boton" onclick="añadirCarrito(7,'Fallen Angels',1,20,'imagenespelis/fallen angels.jpg', 'Wong Kar Wai')">COMPRAR</button>
    </div>
    <div class="container-pr">
        <img src="imagenespelis/funny%20games.jpg" alt="funny games" class="imagenpeli">
        <h3>Funny Games</h3>
        <div class="dir"><h4>Dir: Michael Haneke</h4></div>
        <div class="precio"><h4>20€</h4></div>
        <button class="custom-btn boton" onclick="añadirCarrito(8,'Funny Games',1,20,'imagenespelis/funny games.jpg', 'Michael Haneke')">COMPRAR</button>
    </div>
    <div class="container-pr">
        <img src="imagenespelis/kikujiro.jpg" alt="kikujiro" class="imagenpeli">
        <h3>Kikujiro no natsu</h3>
        <div class="dir"><h4>Dir: Takeshi Kitano</h4></div>
        <div class="precio"><h4>20€</h4></div>
        <button class="custom-btn boton" onclick="añadirCarrito(9,'Kikujiro no natsu',1,20,'imagenespelis/kikujiro.jpg', 'Takeshi Kitano')">COMPRAR</button>
    </div>
    <div class="container-pr">
        <img src="imagenespelis/memories%20of%20murder.jpg" alt="memories of murder" class="imagenpeli">
        <h3>Memories of Murder</h3>
        <div class="dir"><h4>Dir: Boong Joong-Ho</h4></div>
        <div class="precio"><h4>20€</h4></div>
        <button class="custom-btn boton" onclick="añadirCarrito(10,'Memories of Murder',1,20,'imagenespelis/memories of murder.jpg', 'Boong Joong-Ho')">COMPRAR</button>
    </div>
    <div class="container-pr">
        <img src="imagenespelis/mrnobody.jpg" alt="mr nobody" class="imagenpeli">
        <h3>Mr. Nobody</h3>
        <div class="dir"><h4>Dir: Jaco Van Dormael</h4></div>
        <div class="precio"><h4>20€</h4></div>
        <button class="custom-btn boton" onclick="añadirCarrito(11,'Mr. Nobody',1,20,'imagenespelis/mrnobody.jpg', 'Jaco Van Dormael')">COMPRAR</button>
    </div>
    <div class="container-pr">
        <img src="imagenespelis/mulhollanddrive.jpg" alt="mulholland drive" class="imagenpeli">
        <h3>Mulholland Drive</h3>
        <div class="dir"><h4>Dir: David Lynch</h4></div>
        <div class="precio"><h4>20€</h4></div>
        <button class="custom-btn boton" onclick="añadirCarrito(12,'Mulholland Drive',1,20,'imagenespelis/mulhollanddrive.jpg', 'David Lynch')">COMPRAR</button>
    </div>
    <div class="container-pr">
        <img src="imagenespelis/nightcrawler.jpg" alt="nightcrawler" class="imagenpeli">
        <h3>Nightcrawler</h3>
        <div class="dir"><h4>Dir: Dan Gilroy</h4></div>
        <div class="precio"><h4>20€</h4></div>
        <button class="custom-btn boton" onclick="añadirCarrito(13,'Nightcrawler',1,20,'imagenespelis/nightcrawler.jpg', 'Dan Gilroy')">COMPRAR</button>
    </div>
    <div class="container-pr">
        <img src="imagenespelis/oldboy.jpg" alt="oldboy" class="imagenpeli">
        <h3>Oldboy</h3>
        <div class="dir"><h4>Dir: Park Chan-wook</h4></div>
        <div class="precio"><h4>20€</h4></div>
        <button class="custom-btn boton" onclick="añadirCarrito(14,'Oldboy',1,20,'imagenespelis/oldboy.jpg', 'Park Chan-wook')">COMPRAR</button>
    </div>
    <div class="container-pr">
        <img src="imagenespelis/parasite.jpg" alt="parasite" class="imagenpeli">
        <h3>Parasite</h3>
        <div class="dir"><h4>Dir: Boong Joong-ho</h4></div>
        <div class="precio"><h4>20€</h4></div>
        <button class="custom-btn boton" onclick="añadirCarrito(15,'Parasite',1,20,'imagenespelis/parasite.jpg', 'Boong Joong-ho')">COMPRAR</button>
    </div>
    <div class="container-pr">
        <img src="imagenespelis/signs.jpg" alt="signs" class="imagenpeli">
        <h3>Signs</h3>
        <div class="dir"><h4>Dir: M. Night Shyamalan</h4></div>
        <div class="precio"><h4>20€</h4></div>
        <button class="custom-btn boton" onclick="añadirCarrito(16,'Signs',1,20,'imagenespelis/signs.jpg', 'M. Night Shyamalan')">COMPRAR</button>
    </div>
    <div class="container-pr">
        <img src="imagenespelis/the%20game.jpg" alt="the game" class="imagenpeli">
        <h3>The Game</h3>
        <div class="dir"><h4>Dir: David Fincher</h4></div>
        <div class="precio"><h4>20€</h4></div>
        <button class="custom-btn boton" onclick="añadirCarrito(17,'The Game',1,20,'imagenespelis/the game.jpg', 'David Fincher')">COMPRAR</button>
    </div>
    <div class="container-pr">
        <img src="imagenespelis/the%20new%20world.jpg" alt="the new world" class="imagenpeli">
        <h3>The New World</h3>
        <div class="dir"><h4>Dir: Terrence Malick</h4></div>
        <div class="precio"><h4>20€</h4></div>
        <button class="custom-btn boton" onclick="añadirCarrito(18,'The New World',1,20,'imagenespelis/the new world.jpg', 'Terrence Malick')">COMPRAR</button>
    </div>
    <div class="container-pr">
        <img src="imagenespelis/the%20tree%20of%20life.jpg" alt="the tree of life" class="imagenpeli">
        <h3>The Tree Of Life</h3>
        <div class="dir"><h4>Dir: Terrence Malick</h4></div>
        <div class="precio"><h4>20€</h4></div>
        <button class="custom-btn boton" onclick="añadirCarrito(19,'The Tree Of Life',1,20,'imagenespelis/the tree of life.jpg', 'Terrence Malick')">COMPRAR</button>
    </div>
    <div class="container-pr">
        <img src="imagenespelis/the%20village.jpg" alt="the village" class="imagenpeli">
        <h3>The Village</h3>
        <div class="dir"><h4>Dir: M. Night Shyamalan</h4></div>
        <div class="precio"><h4>20€</h4></div>
        <button class="custom-btn boton" onclick="añadirCarrito(20,'The Village',1,20,'imagenespelis/the village.jpg', 'M. Night Shyamalan')">COMPRAR</button>
    </div>
    <div class="container-pr">
        <img src="imagenespelis/thirst.jpg" alt="thirst" class="imagenpeli">
        <h3>Thirst</h3>
        <div class="dir"><h4>Dir: Park Chan-wook</h4></div>
        <div class="precio"><h4>20€</h4></div>
        <button class="custom-btn boton" onclick="añadirCarrito(21,'Thirst',1,20,'imagenespelis/thirst.jpg', 'Park Chan-wook')">COMPRAR</button>
    </div>
    <div class="container-pr">
        <img src="imagenespelis/unbreakable.jpg" alt="unbreakable" class="imagenpeli">
        <h3>Unbreakable</h3>
        <div class="dir"><h4>Dir: M. Night Shyamalan</h4></div>
        <div class="precio"><h4>20€</h4></div>
        <button class="custom-btn boton" onclick="añadirCarrito(22,'Unbrakable',1,20,'imagenespelis/unbreakable.jpg', 'M. Night Shyamalan')">COMPRAR</button>
    </div>
    <div class="container-pr">
        <img src="imagenespelis/uncut%20gems.jpg" alt="uncut gems" class="imagenpeli">
        <h3>Uncut Gems</h3>
        <div class="dir"><h4>Dir: Ben Safdie, Joshua Safdie</h4></div>
        <div class="precio"><h4>20€</h4></div>
        <button class="custom-btn boton" onclick="añadirCarrito(23,'Uncut gems',1,20,'imagenespelis/uncut gems.jpg', 'Ben Safdie, Joshua Safdie')">COMPRAR</button>
    </div>
    <div class="container-pr">
        <img src="imagenespelis/whiplash.jpg" alt="whiplash" class="imagenpeli">
        <h3>Whiplash</h3>
        <div class="dir"><h4>Dir: Damien Chazelle</h4></div>
        <div class="precio"><h4>20€</h4></div>
        <button class="custom-btn boton" onclick="añadirCarrito(24,'Whiplash',1,20,'imagenespelis/whiplash.jpg', 'Damien Chazelle')">COMPRAR</button>
    </div>
    <div class="container-pr">
        <img src="imagenespelis/yi%20yi.jpg" alt="yi yi" class="imagenpeli">
        <h3>Yi Yi</h3>
        <div class="dir"><h4>Dir: Edward Yang</h4></div>
        <div class="precio"><h4>20€</h4></div>
        <button class="custom-btn boton" onclick="añadirCarrito(25,'Yi Yi',1,20,'imagenespelis/yi yi.jpg', 'Edward Yang')">COMPRAR</button>
    </div>-->
    <script>
        $('button').click(function(){
            $('.alert').addClass("show");
            $('.alert').removeClass("hide");
            $('.alert').addClass("showAlert");
            setTimeout(function(){
                $('.alert').removeClass("show");
                $('.alert').addClass("hide");
            },2500);
        });
        $('.close-btn').click(function(){
            $('.alert').removeClass("show");
            $('.alert').addClass("hide");
        });
    </script>
</div>
