package com.mapris.estadisticas.graficos;


import com.mapris.modelo.dao.ServicioFacadeLocal;
import com.mapris.modelo.entitie.Servicio;
import com.mapris.modelo.entitie.Servicio;
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
import org.primefaces.model.chart.BarChartModel;
import org.primefaces.model.chart.HorizontalBarChartModel;
import org.primefaces.model.chart.ChartSeries;

/**
 *
 * @author Ruben
 */

@Named(value = "tipoServicioEstadisticas")
@RequestScoped
public class TipoServicioController implements Serializable {
    
    private HorizontalBarChartModel horizontalBarModel;
    @EJB
    private ServicioFacadeLocal sfl;
    private List<Servicio> tipos;

    public TipoServicioController() {
    }
 
    
    @PostConstruct
    public void init() {
        tipos = sfl.findAll();
        createHorizontalBarModel();
       
     
    }

    public HorizontalBarChartModel getHorizontalBarModel() {
        return horizontalBarModel;
    }

    public void setHorizontalBarModel(HorizontalBarChartModel horizontalBarModel) {
        this.horizontalBarModel = horizontalBarModel;
    }
 
    
     
  
    private void createHorizontalBarModel() {
        horizontalBarModel = new HorizontalBarChartModel();
 
        List<Servicio> list1 = new ArrayList();
        List<Servicio> list2 = new ArrayList();
        List<Servicio> list3 = new ArrayList();
        List<Servicio> list4 = new ArrayList();
        
        for (int i = 0; i < tipos.size(); i++) {
            if (tipos.get(i).getTiposServicios().getIdTipoServicio()==1) {
                list1.add(tipos.get(i));
            }else if(tipos.get(i).getTiposServicios().getIdTipoServicio()==2){
                
                list2.add(tipos.get(i));
            }else if(tipos.get(i).getTiposServicios().getIdTipoServicio()==3){
                
                list3.add(tipos.get(i));
            }else if(tipos.get(i).getTiposServicios().getIdTipoServicio()==4){
                
                list4.add(tipos.get(i));
            }
        }
        
        ChartSeries tipos = new ChartSeries();
       
        tipos.setLabel("Servicios");
        
        tipos.set("Programa", list1.size());
        tipos.set("Rutina", list2.size());
        tipos.set("Servicio", list3.size());
        tipos.set("Cita", list4.size());
        
      
 
       
 
        horizontalBarModel.addSeries(tipos);
        
        horizontalBarModel.setAnimate(true);
        horizontalBarModel.setTitle("Tipos De Servicio");
        horizontalBarModel.setLegendPosition("e");
        horizontalBarModel.setDatatipFormat("<span style=\"display:none;\">%s</span><span>%s</span>");
        horizontalBarModel.setStacked(true);
        
        Axis xAxis = horizontalBarModel.getAxis(AxisType.X);
        xAxis.setTickFormat("%.1f");
        xAxis.setLabel("Número de Servicios");
        xAxis.setMin(0);
        xAxis.setMax(10);
         
        Axis yAxis = horizontalBarModel.getAxis(AxisType.Y);
        yAxis.setLabel("Tipo");        
    }
     
   @PreDestroy
   public void remove(){
   tipos = null;
   
   }
 
}