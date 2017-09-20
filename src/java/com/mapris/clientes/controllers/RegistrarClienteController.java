package com.mapris.clientes.controllers;

import com.mapris.modelo.dao.EstadoFacadeLocal;
import com.mapris.modelo.dao.ClienteFacadeLocal;
import com.mapris.modelo.dao.InscripcionFacadeLocal;
import com.mapris.modelo.dao.RolFacadeLocal;
import com.mapris.modelo.dao.UsuarioFacadeLocal;

import com.mapris.modelo.entitie.Cliente;
import com.mapris.modelo.entitie.Inscripcion;
import com.mapris.modelo.entitie.Rol;
import com.mapris.modelo.entitie.Usuario;
import com.mapris.util.MessageUtil;
import com.mapris.util.NotifyView;
import java.util.ArrayList;

import java.util.Calendar;
import java.util.Date;
import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.enterprise.context.RequestScoped;
import javax.inject.Inject;
import javax.inject.Named;

/**
 *
 * @author SMEGS
 */
@Named(value = "registroClienteController")
@RequestScoped
public class RegistrarClienteController {
    
    @EJB
    
    private EstadoFacadeLocal efl;
    
    @EJB
    private UsuarioFacadeLocal usuarioFacadeLocal;
    
    @EJB
    private ClienteFacadeLocal cfl;
    
    @EJB
    private RolFacadeLocal rolFacedaLocal;
    @EJB
    private EstadoFacadeLocal estadoFacadeLocal;
    @EJB
    private InscripcionFacadeLocal ifl;
    
    
    
    private Cliente nuevoCliente;
    
    private Usuario nuevoUsuario;
    
    private Inscripcion inscripcionCliente;

     private Calendar hoy;
    
    public RegistrarClienteController() {
    }
    
    @PostConstruct
    public void init() {
        nuevoCliente = new Cliente();
        nuevoUsuario = new Usuario();
        inscripcionCliente = new Inscripcion();
        this.hoy = Calendar.getInstance();
        
    }
    
    public Cliente getNuevoCliente() {
        return nuevoCliente;
    }
    
    public void setNuevoCliente(Cliente nuevoCliente) {
        this.nuevoCliente = nuevoCliente;
    }
    
    public Usuario getNuevoUsuario() {
        return nuevoUsuario;
    }
    
    public void setNuevoUsuario(Usuario nuevoUsuario) {
        this.nuevoUsuario = nuevoUsuario;
    }

    public Inscripcion getInscripcionCliente() {
        return inscripcionCliente;
    }

    public void setInscripcionCliente(Inscripcion inscripcionCliente) {
        this.inscripcionCliente = inscripcionCliente;
    }
    
    
    
    public void registrar() {
        Date hoy = new Date();
        
        if (nuevoUsuario != null && nuevoCliente != null) {
            
            try {
                
                Calendar cal = Calendar.getInstance();
                 cal.setTime(nuevoUsuario.getFechaNaci());
                 
                
                if (cal.get(Calendar.YEAR) >= this.hoy.get(Calendar.YEAR) ) {
                    
                    nuevoUsuario=null;
                    System.out.println("No paso 1");
                    MessageUtil.enviarMensajeErrorGlobal("No se puede registrar", "La fecha introducida es igual o supera el año actual.");
                    
                }else if(cal.get(Calendar.YEAR) > (this.hoy.get(Calendar.YEAR)-18)   ){
                    
                    System.out.println("" + (this.hoy.get(Calendar.YEAR)-18) );
                    nuevoUsuario=null;
                   System.out.println("No paso 2");
                    MessageUtil.enviarMensajeErrorGlobal("No se puede registrar", "Tu fecha de nacimiento indica que eres menor de edad");
                    
                
                } else{
                
                
                
                nuevoCliente.setIdUsuario(null);
                nuevoUsuario.setFechaRegistro(hoy);
                nuevoUsuario.setRoles(new ArrayList<Rol>());
                
                    if (inscripcionCliente.getFkIdCurso().getIdServicios().getTiposServicios().getTiposServicio().equalsIgnoreCase("Programa Prenatal")) {
                        nuevoUsuario.getRoles().add(rolFacedaLocal.find(2));
                        nuevoUsuario.setIdEstados(estadoFacadeLocal.find(2));
                    } else if(inscripcionCliente.getFkIdCurso().getIdServicios().getTiposServicios().getTiposServicio().equalsIgnoreCase("Programa Posnatal")){
                     
                        nuevoUsuario.getRoles().add(rolFacedaLocal.find(3));
                        nuevoUsuario.setIdEstados(estadoFacadeLocal.find(3));
                    
                    }else if(inscripcionCliente.getFkIdCurso().getIdServicios().getTiposServicios().getTiposServicio().equalsIgnoreCase("Club bebe")){
                    
                     
                        nuevoUsuario.getRoles().add(rolFacedaLocal.find(4));
                        nuevoUsuario.setIdEstados(estadoFacadeLocal.find(4));
                    
                    }
                usuarioFacadeLocal.create(nuevoUsuario);
                
                
                Usuario user = usuarioFacadeLocal.buscarIdUsuario(nuevoUsuario.getCedula());
                
                nuevoCliente.setIdUsuario(user.getIdUsuario());
                nuevoCliente.setEstado("Habilitado");
                nuevoCliente.setIdEmpresas(nuevoCliente.getIdEmpresas());
                
                inscripcionCliente.setIdUsuario(nuevoCliente);
                inscripcionCliente.setEstado("Activa");

                
                cfl.create(nuevoCliente);
                ifl.create(inscripcionCliente);
                MessageUtil.enviarMensajeInformacionGlobal("Registro satisfactorio", "El cliente se ha creado con exito");
                init();
                }
            } catch (Exception e) {
                e.printStackTrace();
                System.out.println("Empresa: " + nuevoCliente.getIdEmpresas().getIdEmpresa());
                
            }
        } else {
            MessageUtil.enviarMensajeInformacionGlobal("Error al registrar el usuario", "No se pudo registrar el cliente");
        }
    }
    
    public void cambioDeEstado(Cliente c) {
        try {
            if (c.getUsuario().getIdEstados().getIdEstados() == 1 && c.getEstado().equalsIgnoreCase("Habilitado")) {
                c.getUsuario().setIdEstados(efl.find(2));
                c.setEstado("Deshabilitado");
                
            } else {
                c.getUsuario().setIdEstados(efl.find(1));
                c.setEstado("Habilitado");
            }
            
            cfl.edit(c);
            MessageUtil.enviarMensajeInformacion("form-data-table-sesiones", "Actualización", "Se ha cambiado el estado del usuario.");
        } catch (Exception e) {
            e.printStackTrace();
            MessageUtil.enviarMensajeErrorGlobal("Error al cambiar el estado del usuario", e.getStackTrace().toString());
            System.out.println("KoLacho estuvo aqui");
            
            
        }
        
    }
    
    public String getIconUsuarioBloqueo(Cliente c) {
        
        return (c.getUsuario().getIdEstados().getIdEstados() == 2 && c.getEstado().equalsIgnoreCase("Deshabilitado")) ? "lock" : "unlock";
    }
}
