package com.mapris.estadisticas.graficos;


import com.mapris.modelo.dao.ClienteFacadeLocal;
import com.mapris.modelo.dao.PersonalmedicoFacadeLocal;
import com.mapris.modelo.dao.RolFacadeLocal;
import com.mapris.modelo.dao.UsuarioFacadeLocal;
import com.mapris.modelo.entitie.Cliente;
import com.mapris.modelo.entitie.Personalmedico;
import com.mapris.modelo.entitie.Rol;
import com.mapris.modelo.entitie.Usuario;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.annotation.PreDestroy;
import javax.ejb.EJB;
import javax.ejb.Stateless;
import javax.enterprise.context.RequestScoped;

import javax.inject.Named;
import org.primefaces.model.chart.Axis;
import org.primefaces.model.chart.AxisType;

import org.primefaces.model.chart.ChartSeries;
import org.primefaces.model.chart.PieChartModel;

/**
 *
 * @author Ruben
 */

@Named(value = "usuariosRolEstadisticas")
@RequestScoped
public class UsuariosRolEstadisticasController implements Serializable {
    private PieChartModel pieModel;
    @EJB
    private UsuarioFacadeLocal sfl;
    @EJB
    private ClienteFacadeLocal cfl;
    @EJB
    private PersonalmedicoFacadeLocal pfl;
    @EJB
    private RolFacadeLocal rfl;
    
    private List<Usuario> usuarios;
    private Integer clientes;
    private Integer personal;
    private Rol rolFind;
    
    public UsuariosRolEstadisticasController() {
    }
 
    
    @PostConstruct
    public void init() {
        usuarios = sfl.findAdministrador();
        clientes = cfl.count();
        personal = pfl.count();
        rolFind = rfl.find(1);
        createHorizontalBarModel();
       
     
    }

    public PieChartModel getPieModel() {
        return pieModel;
    }

    public void setPieModel(PieChartModel pieModel) {
        this.pieModel = pieModel;
    }

   
 
    
     
  
    private void createHorizontalBarModel() {
        pieModel = new PieChartModel();
 
                
      
       
        
        pieModel.set("Administradores", usuarios.size());
        pieModel.set("Cliente", clientes);
        pieModel.set("Personal Medico", personal);
        
         
        pieModel.setTitle("Usuarios del sistema");
        pieModel.setLegendPosition("e");
       
        pieModel.setShowDataLabels(true);
        
        
      
 
       
 
            
    }
     
   @PreDestroy
   public void remove(){
   usuarios = null;
   
   }
 
}