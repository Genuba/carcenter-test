package com.example.demo.Mecanicos;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity(name = "mecanicos")
@Table
public class Mecanicos {
    @Id
    private int documento;
    private String tipoDocumento;
    private String primerNombre;
    private String segundoNombre;
    private String primerApellido;
    private String segundoApellido;
    private String celular;
    private String direccion;
    private String email;
    private String estado;

    public Mecanicos(String tipoDocumento, int documento, String primerNombre, String segundoNombre, String primerApellido, String segundoApellido, String celular, String direccion, String email, String estado) {
        this.tipoDocumento = tipoDocumento;
        this.documento = documento;
        this.primerNombre = primerNombre;
        this.segundoNombre = segundoNombre;
        this.primerApellido = primerApellido;
        this.segundoApellido = segundoApellido;
        this.celular = celular;
        this.direccion = direccion;
        this.email = email;
        this.estado = estado;
    }

    public Mecanicos(String tipoDocumento, String primerNombre, String segundoNombre, String primerApellido, String segundoApellido, String celular, String direccion, String email, String estado) {
        this.tipoDocumento = tipoDocumento;
        this.primerNombre = primerNombre;
        this.segundoNombre = segundoNombre;
        this.primerApellido = primerApellido;
        this.segundoApellido = segundoApellido;
        this.celular = celular;
        this.direccion = direccion;
        this.email = email;
        this.estado = estado;
    }

    public Mecanicos() {
    }

    public String getTipoDocumento() {
        return tipoDocumento;
    }

    public int getDocumento() {
        return documento;
    }

    public String getPrimerNombre() {
        return primerNombre;
    }

    public String getSegundoNombre() {
        return segundoNombre;
    }

    public String getPrimerApellido() {
        return primerApellido;
    }

    public String getSegundoApellido() {
        return segundoApellido;
    }

    public String getCelular() {
        return celular;
    }

    public String getDireccion() {
        return direccion;
    }

    public String getEmail() {
        return email;
    }

    public String getEstado() {
        return estado;
    }
}
