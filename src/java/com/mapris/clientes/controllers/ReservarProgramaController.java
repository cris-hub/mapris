
package com.mapris.clientes.controllers;



import com.mapris.modelo.dao.InscripcionFacadeLocal;
import com.mapris.modelo.dao.ServicioFacadeLocal;
import com.mapris.modelo.entitie.Servicio;
import com.mapris.modelo.entitie.Usuario;
import com.mapris.util.MessageUtil;
import java.util.ArrayList;
import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.enterprise.context.RequestScoped;
import javax.inject.Named;


@Named(value = "reservarProgramaController")
@RequestScoped
public class ReservarProgramaController {

    @EJB
    private ServicioFacadeLocal sfl;
    
    @EJB
    private InscripcionFacadeLocal ifc;

    private Servicio nuevoServicio;

    public ReservarProgramaController() {
    }

    @PostConstruct
    public void init() {
        nuevoServicio = new Servicio();
    }

    public Servicio getNuevoServicio() {
        return nuevoServicio;
    }

    public void setNuevoServicio(Servicio nuevoServicio) {
        this.nuevoServicio = nuevoServicio;
    }
     
  

//    public void registrar() {
//        if (nuevoServicio != null) {
//            try {
//                nuevoServicio.set
//                nuevoServicio.getRoles().add(rolFacedaLocal.find(2));
//                nuevoServicio.setEstado(estadoFacadeLocal.find(2));
//                usuarioFacadeLocal.create(nuevoServicio);
//                MessageUtil.enviarMensajeInformacion("form-registro", "Registro satisfactorio", "");
//                init();
//            } catch (Exception e) {
//                e.printStackTrace();
//            }
//        } else {
//            MessageUtil.enviarMensajeError("form-registro", "no se han dioligenciado los campos ", "");
//        }
//    }

}
