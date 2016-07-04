/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package negocio;

import accesodato.Coneccion;
import java.util.Vector;

/**
 *
 * @author Administrador
 */
public class Usuario {
    private int usuario_id;
    private String usuario;
    private String clave;
    private String fecha_nacimiento;
    private String estado;
    Coneccion con;
public Usuario(){
        con=new Coneccion();
    }
    public int getUsuario_id() {
        return usuario_id;
    }

    public void setUsuario_id(int usuario_id) {
        this.usuario_id = usuario_id;
    }

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public String getClave() {
        return clave;
    }

    public void setClave(String clave) {
        this.clave = clave;
    }

    public String getFecha_nacimiento() {
        return fecha_nacimiento;
    }

    public void setFecha_nacimiento(String fecha_nacimiento) {
        this.fecha_nacimiento = fecha_nacimiento;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }
public void save(){
    con.setInsertar("insert into Usuarios(usuario,clave,fecha_nacimiento,estado) values('"+this.getUsuario()+"','"+this.getClave()+"','"+this.getFecha_nacimiento()+"','activo')");
}
 public void update(){
     con.setInsertar("update usuarios set usuario='"+this.getUsuario()+"',clave='"+this.getClave()+"',fecha_nacimiento='"+this.getFecha_nacimiento()+"' where usuario_id='"+this.getUsuario_id()+"'");
 }
    public void delete (){
        con.setInsertar("update usuarios set estado='pasivo' where usuario_id='"+this.getUsuario_id()+"'");
 
    
}
}