package com.example.practica2daw;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Date;

public class AccesoBD {
    private static AccesoBD instanciaUnica = null;
    private Connection conexionBD = null;

    public static AccesoBD getInstance(){
        if (instanciaUnica == null){
            instanciaUnica = new AccesoBD();
        }
        return instanciaUnica;
    }

    private AccesoBD() {
        abrirConexionBD();
    }

    public void abrirConexionBD() {
        if (conexionBD == null)
        { // daw es el nombre de la base de datos que hemos creado con anterioridad.
            String nombreConexionBD = "jdbc:mysql://localhost/basededatosnew";
            try { // root y sin clave es el usuario por defecto que crea XAMPP.
                Class.forName("com.mysql.cj.jdbc.Driver");
                conexionBD = DriverManager.getConnection(nombreConexionBD,"root","");
            }
            catch(Exception e) {
                System.err.println("No se ha podido conectar a la base de datos");
                System.err.println(e.getMessage());
            }
        }
    }

    public void cerrarConexionBD()
    {
        if (conexionBD != null)
        {
            try{
                conexionBD.close();
                conexionBD = null;
            }
            catch(Exception e){ //Error en la conexión con la BD
                System.err.println("No se ha completado la desconexión a la base de datos");
                System.err.println(e.getMessage());
            }
        }
    }

    public boolean comprobarAcceso() {
        abrirConexionBD();
        return conexionBD != null;
    }

    public List<ProductoBD> obtenerProductosBD() {
        ArrayList<ProductoBD> productos = new ArrayList<>();
        try {
            String con;
            Statement s = conexionBD.createStatement();
            // hay que tener en cuenta las columnas de vuestra tabla de productos
            // también se puede utilizar una consulta del tipo:
            // con = "SELECT * FROM productos";
            con = "SELECT id,descripcion,precio,existencias,imagen,director FROM productos";
            ResultSet resultados = s.executeQuery(con);
            while(resultados.next()){
                ProductoBD producto;
                producto = new ProductoBD();

                producto.setId(resultados.getInt("id"));
                producto.setDescripcion(resultados.getString("descripcion"));
                producto.setPrecio(resultados.getFloat("precio"));
                producto.setStock(resultados.getInt("existencias"));
                producto.setImagen(resultados.getString("imagen"));
                producto.setDirector(resultados.getString("director"));
                productos.add(producto);
            }
        }
        catch(Exception e) {
            System.err.println("Error ejecutando la consulta a la base de datos");
            System.err.println(e.getMessage());
        }
        return productos;
    }

    public boolean decrementarExistenciaProducto(int codigo, int existencias)
    {
        abrirConexionBD();
        try{
            System.out.println(codigo);
            String con;
            Statement s = conexionBD.createStatement();
            // Consulta, buscamos una correspondencia usuario/clave
            con = "SELECT id,descripcion,precio,existencias,imagen FROM productos WHERE id = '"+ codigo+"'";
            ResultSet resultados = s.executeQuery(con);
            resultados.next();
            ProductoBD producto;
            producto = new ProductoBD();
            producto.setStock(resultados.getInt("existencias"));
            System.out.println(resultados.getInt("id"));

            int existenciass= producto.getStock()-existencias;
            System.out.println(existenciass);

            con = "UPDATE productos SET existencias = '"+ existenciass + "' WHERE id = '"+codigo+"'";
            int filas = s.executeUpdate(con);
            if (filas>0) // El usuario/clave se encuentra en la BD
            {
                return true;
            }
            else // El usuario/clave no se encuentra en la BD
            {
                return false;
            }
        }
        catch(Exception e) { // Error en la conexión con la BD
            System.err.println("Error decrementado existencias");
            System.err.println(e.getMessage());
            return false;
        }
    }

    public List<PedidoBD> obtenerPedidosBD(int persona) {
        abrirConexionBD();
        ArrayList<PedidoBD> pedidos = new ArrayList<>();
        try {
            String con;
            Statement s = conexionBD.createStatement();
            // hay que tener en cuenta las columnas de vuestra tabla de productos
            // también se puede utilizar una consulta del tipo:
            // con = "SELECT * FROM productos";
            con = "SELECT * FROM pedidos WHERE persona = '"+persona+"'";
            ResultSet resultados = s.executeQuery(con);
            while(resultados.next()){
                PedidoBD pedido;                ;
                pedido = new PedidoBD();

                pedido.setCodigo(resultados.getInt("id"));
                pedido.setPersona(resultados.getInt("persona"));
                pedido.setDate(resultados.getDate("fecha"));
                pedido.setImporte(resultados.getFloat("importe"));
                pedido.setEstado(resultados.getInt("estado"));
                pedidos.add(pedido);
            }
        }
        catch(Exception e) {
            System.err.println("Error ejecutando la consulta a la base de datos");
            System.err.println(e.getMessage());
        }
        return pedidos;
    }

    public boolean comprobarUsuarioBD(String usuario, String clave) {
        abrirConexionBD();
        try{
            String con;
            Statement s = conexionBD.createStatement();

            if(clave!=null)
            {
                con = "SELECT * FROM usuarios WHERE usuario='" + usuario + "' and clave='" + clave + "'";
                ResultSet resultados = s.executeQuery(con);
                if ( resultados.next() ) // El usuario/clave se encuentra en la BD
                {
                    return true;
                }
                else // El usuario/clave no se encuentra en la BD
                {
                    return false;
                }
            }
            else{
                // Consulta, buscamos una correspondencia usuario/clave
                con = "SELECT * FROM usuarios WHERE usuario='" + usuario + "'";
                ResultSet resultados = s.executeQuery(con);
                if ( resultados.next() ) // El usuario
                {
                    return true;
                }
                else // El usuario/clave no se encuentra en la BD
                {
                    return false;
                }
            }


        }
        catch(Exception e) { // Error en la conexión con la BD
            System.err.println("Error verificando usuaro/clave");
            System.err.println(e.getMessage());
            return false;
        }
    }

    public boolean actualizarDatosUsuario(String usuarioo, String nombre, String apellidos, String domicilio, String poblacion, String provincia, String cp, String telefono)
    {
        abrirConexionBD();
        try{
            String con;
            Statement s = conexionBD.createStatement();
            // Consulta, buscamos una correspondencia usuario/clave

            con = "UPDATE usuarios SET nombre = '" + nombre + "', apellidos = '" + apellidos + "' , domicilio = '" + domicilio + "', poblacion = '" + poblacion + "', provincia = '" + provincia + "' , cp = '"+cp+"', telefono = '"+telefono+"' WHERE usuario='" + usuarioo + "'";
            int filas = s.executeUpdate(con);
            if (filas>0) // El usuario/clave se encuentra en la BD
            {
                return true;
            }
            else // El usuario/clave no se encuentra en la BD
            {
                return false;
            }
        }
        catch(Exception e) { // Error en la conexión con la BD
            System.err.println("Error verificando usuaro/clave");
            System.err.println(e.getMessage());
            return false;
        }
    }

    public boolean cancelarPedido(int codigo, int estado)
    {
        abrirConexionBD();
        try{
            String con;
            Statement s = conexionBD.createStatement();
            // Consulta, buscamos una correspondencia usuario/clave

            con = "UPDATE pedidos SET estado = '" + estado + "' WHERE id='" + codigo + "'";
            int filas = s.executeUpdate(con);
            if (filas>0) // El usuario/clave se encuentra en la BD
            {
                return true;
            }
            else // El usuario/clave no se encuentra en la BD
            {
                return false;
            }
        }
        catch(Exception e) { // Error en la conexión con la BD
            System.err.println("Error verificando usuaro/clave");
            System.err.println(e.getMessage());
            return false;
        }
    }

    public boolean insertarPedido(int usuario, java.sql.Date fecha, float importe, int estado)
    {
        abrirConexionBD();
        try{
            String con;
            Statement s = conexionBD.createStatement();
            // Consulta, buscamos una correspondencia usuario/clave
            con =  "INSERT INTO pedidos(id,persona,fecha,importe,estado) VALUES (NULL,'"+usuario+"', '"+ fecha +"', '"+importe+"' , '"+estado+"')";
            int filas = s.executeUpdate(con);
            if (filas>0) // El usuario/clave se encuentra en la BD
            {
                return true;
            }
            else // El usuario/clave no se encuentra en la BD
            {
                return false;
            }
        }
        catch(Exception e) { // Error en la conexión con la BD
            System.err.println("Error verificando usuario/clave");
            System.err.println(e.getMessage());
            return false;
        }

    }

    public boolean insertarDetallePedido(int codigo_pedido, int codigo_producto, int unidades, float precio_unitario)
    {
        abrirConexionBD();
        try{
            String con;
            Statement s = conexionBD.createStatement();
            // Consulta, buscamos una correspondencia usuario/clave
            con =  "INSERT INTO detalle(id_pedido, id_producto, unidades, precio_unitario) VALUES ('"+codigo_pedido+"', '"+codigo_producto+"', '"+unidades+"', '"+precio_unitario+"')";
            int filas = s.executeUpdate(con);
            if (filas>0) // El usuario/clave se encuentra en la BD
            {
                return true;
            }
            else // El usuario/clave no se encuentra en la BD
            {
                return false;
            }
        }
        catch(Exception e) { // Error en la conexión con la BD
            System.err.println("Error verificando usuario/clave");
            System.err.println(e.getMessage());
            return false;
        }
    }

    public boolean registrarUsuario(int activo, int admin, String usuario, String clave, String nombre, String apellidos, String domicilio, String poblacion, String provincia, String cp, String telefono)
    {
        abrirConexionBD();
        try{
            String con;
            Statement s = conexionBD.createStatement();
            // Consulta, buscamos una correspondencia usuario/clave
            con =  "INSERT INTO usuarios(id,activo,admin,usuario,clave, nombre, apellidos, domicilio, poblacion, provincia, cp, telefono) VALUES (NULL,'1', '0', '"+usuario+"' , '"+clave+"', '"+nombre+"', '"+apellidos+"', '"+domicilio+"', '"+poblacion+"', '"+provincia+"', '"+cp+"', '"+telefono+"')";
            int filas = s.executeUpdate(con);
            if (filas>0) // El usuario/clave se encuentra en la BD
            {
                return true;
            }
            else // El usuario/clave no se encuentra en la BD
            {
                return false;
            }
        }
        catch(Exception e) { // Error en la conexión con la BD
            System.err.println("Error verificando usuario/clave");
            System.err.println(e.getMessage());
            return false;
        }

    }

    public UsuarioBD obtenerUsuarioBD(String usuarioo) {
        abrirConexionBD();
        UsuarioBD usuario;
        usuario = new UsuarioBD();
        try {
            String con;
            Statement s = conexionBD.createStatement();
            // hay que tener en cuenta las columnas de vuestra tabla de productos
            // también se puede utilizar una consulta del tipo:
            // con = "SELECT * FROM productos";
            con = "SELECT * FROM usuarios WHERE usuario='" + usuarioo+"'";
            ResultSet resultados = s.executeQuery(con);
            if(resultados.next()){
                usuario.setCodigo(resultados.getInt("id"));
                usuario.setActivo(resultados.getInt("activo"));
                usuario.setAdmin(resultados.getInt("admin"));
                usuario.setUsuario(resultados.getString("usuario"));
                usuario.setClave(resultados.getString("clave"));
                usuario.setNombre(resultados.getString("nombre"));
                usuario.setApellidos(resultados.getString("apellidos"));
                usuario.setDomicilio(resultados.getString("domicilio"));
                usuario.setPoblacion(resultados.getString("poblacion"));
                usuario.setProvincia(resultados.getString("provincia"));
                usuario.setCp(resultados.getString("cp"));
                usuario.setTelefono(resultados.getString("telefono"));
            }
        }
        catch(Exception e) {
            System.err.println("Error ejecutando la consulta a la base de datos");
            System.err.println(e.getMessage());
        }
        return usuario;
    }

}
