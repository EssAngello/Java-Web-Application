var carrito = new Object(); // Objeto contenedor, se debe crear solo uno.

document.addEventListener("DOMContentLoaded",
    function(){
        if(localStorage.getItem("carrito")){
            carrito = JSON.parse(localStorage.getItem("carrito"));
            //cargarCarrito();
        }
    });

function añadirCarrito(identificador, nombre, cantidad, precio, imagen, director){

    console.log(carrito[identificador]);



    if(!carrito[identificador]){
        let producto = {}; // Objeto que deseamos almacenar
        producto.id = identificador; // Identificador único del objeto
        producto.nombre = nombre; // Nombre del objeto
        producto.cantidad = parseInt(cantidad); // Cantidad que tenemos en el carrito (1 por ejemplo)
        producto.precio = parseFloat(precio); // Precio unitario de cada elemento (100.0 por ejemplo)
        producto.imagen = imagen;
        producto.director = director;
        carrito[identificador] = producto;
        localStorage.setItem("carrito", JSON.stringify(carrito));
        /*
        var fila="<tr><td>"+nombre+"</td>td><textarea rows=1 cols=2 id="+nombre+">"+cantidad+"</textarea></td><td>"+precio+"</td><td><button>Modificar valor</button></td><td><button>Eliminar</button></td>";
        var btn = document.createElement("TR");
   	btn.innerHTML=fila;

        document.getElementById('tablita').appendChild(btn);
        */
    }
    else{
        carrito[identificador].cantidad = carrito[identificador].cantidad + parseInt(cantidad);
        localStorage.setItem("carrito", JSON.stringify(carrito));
    }
    //cargarCarrito();
}

function cargarCarrito(){
    if(localStorage.getItem("carrito"))
    {
        let datoscarrito = JSON.parse(localStorage.getItem("carrito"));
        let total = 0;
        for(let i in datoscarrito)
        {
            total = total + (datoscarrito[i].cantidad*datoscarrito[i].precio);
            var fila = document.createElement('DIV');
            fila.className = "fila";
            fila.id = "fila"+datoscarrito[i].id;
            var filita =
                "<div class=\"right-box\">" +
                "<div class=\"cantidad\">" +
                "<img class=\"menos\" src=\"imagenes/signo-menos.png\" alt=\"signo menos\" onclick='quitaruno("+datoscarrito[i].id+")'>"+
                "<h1 class=\"numero\" id='numero"+datoscarrito[i].id+"'>"+datoscarrito[i].cantidad+"</h1>"+
                "<img class=\"mas\" src=\"imagenes/signo-de-mas.png\" alt=\"signo mas\" onclick='añadiruno("+datoscarrito[i].id+")'>"+
                "</div>"+
                "<div class=\"total\">"+
                "<div class=\"bt-remove\" onclick=\"eliminarfilaproducto("+datoscarrito[i].id+")\">"+
                "<img class=\"eliminaricon\" src=\"imagenes/eliminar.png\" alt=\"eliminar\">"+
                "Eliminar"+
                "</div>"+
                "<div class=\"total-total\">"+
                "<h1 id='preciototal"+datoscarrito[i].id+"'>"+datoscarrito[i].precio*datoscarrito[i].cantidad+"€</h1>"+
                "</div>"+
                "</div>"+
                "</div>"+
                "<div class=\"nombre-preciounitario\">"+
                "<div class=\"nombre\">"+
                "<h1 class=\"textopeli\">"+datoscarrito[i].nombre+"</h1>"+
                "<h2 class=\"textodir\">dir: "+datoscarrito[i].director+"</h2>"+
                "</div>"+
                "<div class=\"preciounitario\">"+
                "<h1>"+datoscarrito[i].precio+"</h1>"+
                "</div>" +
                "</div>"+
                "<div class=\"imagen\">" +
                "<img class=\"imagencarrito\" src='"+ datoscarrito[i].imagen+"' alt=\"2046\" height=\"250\"/>" +
                "</div>";
            fila.innerHTML = filita;
            document.getElementsByClassName("carrito")[0].appendChild(fila);
        }
        document.getElementsByClassName("ytotallabel")[0].innerHTML=total.toString()+"€";
    }
    else{
        document.getElementsByClassName("ytotallabel")[0].innerHTML="0€";
    }
}

function quitaruno(identificador){
    if(carrito[identificador].cantidad!==1)
    {
        carrito[identificador].cantidad = carrito[identificador].cantidad - 1;
        document.getElementById("numero"+carrito[identificador].id).innerHTML=carrito[identificador].cantidad;

        let total= carrito[identificador].cantidad*carrito[identificador].precio;
        document.getElementById("preciototal"+carrito[identificador].id).innerHTML=total.toString()+"€";

        let totaltotal = parseInt(document.getElementsByClassName("ytotallabel")[0].innerHTML);
        totaltotal = totaltotal - 20;
        document.getElementsByClassName("ytotallabel")[0].innerHTML = totaltotal.toString()+"€";

        localStorage.setItem("carrito", JSON.stringify(carrito));
    }
}

function añadiruno(identificador){
    carrito[identificador].cantidad = carrito[identificador].cantidad + 1;

    document.getElementById("numero"+carrito[identificador].id).innerHTML=carrito[identificador].cantidad;
    let total= carrito[identificador].cantidad*carrito[identificador].precio;
    document.getElementById("preciototal"+carrito[identificador].id).innerHTML=total.toString()+"€";

    let totaltotal = parseInt(document.getElementsByClassName("ytotallabel")[0].innerHTML);
    totaltotal = totaltotal + 20;
    document.getElementsByClassName("ytotallabel")[0].innerHTML = totaltotal.toString()+"€";

    localStorage.setItem("carrito", JSON.stringify(carrito));
}

function eliminarfilaproducto(identificador){
    let fila = document.getElementById("fila"+carrito[identificador].id);
    fila.parentNode.removeChild(fila);

    let total = parseInt(document.getElementsByClassName("ytotallabel")[0].innerHTML);
    total = total - (carrito[identificador].cantidad*carrito[identificador].precio);
    document.getElementsByClassName("ytotallabel")[0].innerHTML = total.toString();

    delete carrito[identificador];
    localStorage.setItem("carrito", JSON.stringify(carrito));

}

function vaciarCarrito()
{
    localStorage.removeItem("carrito");
    carrito = {};
}

function obtenerCarrito(){
    let datoscarrito = JSON.parse(localStorage.getItem("carrito"));
    return datoscarrito;
}