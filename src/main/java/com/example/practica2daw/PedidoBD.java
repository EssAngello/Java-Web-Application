package com.example.practica2daw;

import java.sql.Date;

public class PedidoBD {
    private int codigo;
    private int persona;
    private java.util.Date date;
    private float importe;
    private int estado;

    public int getCodigo() {
        return codigo;
    }

    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }

    public int getPersona() {
        return persona;
    }

    public void setPersona(int persona) {
        this.persona = persona;
    }

    public Date getDate() {
        return (Date) date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public float getImporte() {
        return importe;
    }

    public void setImporte(float importe) {
        this.importe = importe;
    }

    public int getEstado() {
        return estado;
    }

    public void setEstado(int estado) {
        this.estado = estado;
    }


}