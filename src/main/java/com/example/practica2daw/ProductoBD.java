package com.example.practica2daw;

import java.sql.Statement;
import java.util.*;

public class ProductoBD {
    private int id;
    private String descripcion;
    private float precio;
    private int stock;
    private String imagen;
    private String director;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public float getPrecio() {
        return precio;
    }

    public void setPrecio(float precio) {
        this.precio = precio;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public String getImagen() {
        return imagen;
    }

    public void setImagen(String imagen) {
        this.imagen = imagen;
    }

    public String getDirector(){ return director;}

    public void setDirector(String director){ this.director=director;}

}
