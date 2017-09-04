package com.mapris.estadisticas.graficos;


import com.mapris.modelo.dao.UsuarioFacadeLocal;
import com.mapris.modelo.entitie.Usuario;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.ejb.Stateless;

import javax.inject.Named;
import org.primefaces.model.chart.Axis;
import org.primefaces.model.chart.AxisType;
import org.primefaces.model.chart.BarChartModel;
import org.primefaces.model.chart.HorizontalBarChartModel;
import org.primefaces.model.chart.ChartSeries;

/**
 *
 * @author Ruben
 */

@Named(value = "usuariosEstadisticas")
@Stateless
public class UsuariosEstadisticasController implements Serializable {
    private BarChartModel barModel;
    @EJB
    private UsuarioFacadeLocal ufl;
    private List<Usuario> usuarios;

    public UsuariosEstadisticasController() {
    }
 
    
    @PostConstruct
    public void init() {
        usuarios = ufl.findAll();
        createBarModel();
       
     
    }
 
    public BarChartModel getBarModel() {
        return barModel;
    }
     
    
 
    private BarChartModel initBarModel() {
        BarChartModel model = new BarChartModel();
 
        List<Usuario> list1 = new ArrayList();
        List<Usuario> list2 = new ArrayList();
        List<Usuario> list3 = new ArrayList();
        List<Usuario> list4 = new ArrayList();
        
        for (int i = 0; i < usuarios.size(); i++) {
            if (usuarios.get(i).getIdEstados().getIdEstados()==1) {
                list1.add(usuarios.get(i));
            }else if(usuarios.get(i).getIdEstados().getIdEstados()==2){
                
                list2.add(usuarios.get(i));
            }else if(usuarios.get(i).getIdEstados().getIdEstados()==3){
                
                list3.add(usuarios.get(i));
            }else if(usuarios.get(i).getIdEstados().getIdEstados()==4){
                
                list4.add(usuarios.get(i));
            }
        }
        
        ChartSeries usuarios = new ChartSeries();
        usuarios.setLabel("Usuarios");
        usuarios.set("Activos", list1.size());
        usuarios.set("Bloqueado", list2.size());
        usuarios.set("Sin Rol", list3.size());
        usuarios.set("Aplazado", list4.size());
      
 
        
 
        model.addSeries(usuarios);
        
         
        return model;
    }
     
  
     
    private void createBarModel() {
        barModel = initBarModel();
        barModel.setAnimate(true);
        barModel.setTitle("Usuarios/Estados");
        barModel.setLegendPosition("ne");
         
        Axis xAxis = barModel.getAxis(AxisType.X);
        xAxis.setLabel("Estados");
         
        Axis yAxis = barModel.getAxis(AxisType.Y);
        yAxis.setLabel("Número de usuarios");
        yAxis.setMin(0);
        yAxis.setMax(40);
    }
     
   
 
}