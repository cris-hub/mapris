/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mapris.agenda.controllers;

import com.mapris.login.controller.SessionController;
import com.mapris.modelo.dao.ClienteFacadeLocal;
import com.mapris.modelo.dao.UsuarioFacadeLocal;
import com.mapris.modelo.entitie.Cliente;
import static com.mapris.modelo.entitie.Rol_.usuarios;
import com.mapris.modelo.entitie.Usuario;
import com.mapris.util.MessageUtil;
import java.io.Serializable;
import java.util.List;
import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.faces.view.ViewScoped;
import javax.inject.Inject;
import javax.inject.Named;

/**
 *
 * @author SMEGS
 */
@Named(value = "listarClientesController")
@ViewScoped
public class ListarClientesController implements Serializable{
//    cdi 

    @Inject
    private SessionController sessionController;

    @EJB
    private ClienteFacadeLocal cfl;

    private List<Cliente> clientes;

    private Cliente clienteSeleccionado;

    
    
    
    public ListarClientesController() {
    }

    @PostConstruct
    public void init() {
        recargarClientes();
    }
    
    private void recargarClientes(){
        clientes =  cfl.findAll();
    }
    
    private void eliminarUsuario(){
        Usuario uS = sessionController.getUsuario(); //Usuario que inicio session
        System.out.println("El usuario que inicio Sesion es : " + uS.getNombre());
        System.out.println("Voy a elimnar a :  " + clienteSeleccionado.getUsuario().getNombre());
        if (uS.getCedula().longValue() != clienteSeleccionado.getUsuario().getCedula()) {
            cfl.remove(clienteSeleccionado);
            recargarClientes();
        }else{
            MessageUtil.enviarMensajeError(null, "Error al eliminar el cliente", "No puede elimniarse usted mismo");
        }
        
    }
    
    

   



    public List<Cliente> getClientes() {
        return clientes;
    }

    public void setClientes(List<Cliente> clientes) {
        this.clientes = clientes;
    }

    public Cliente getClienteSeleccionado() {
        return clienteSeleccionado;
    }

    public void setClienteSeleccionado(Cliente clienteSeleccionado) {
        this.clienteSeleccionado = clienteSeleccionado;
    }


}
