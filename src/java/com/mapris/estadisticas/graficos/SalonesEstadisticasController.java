    package com.mapris.estadisticas.graficos;


import com.mapris.modelo.dao.ServicioFacadeLocal;

import com.mapris.modelo.entitie.Servicio;


import java.io.Serializable;

import java.util.List;

import javax.annotation.PostConstruct;
import javax.ejb.EJB;

import javax.enterprise.context.RequestScoped;

import javax.inject.Named;
import org.primefaces.model.chart.Axis;
import org.primefaces.model.chart.AxisType;
import org.primefaces.model.chart.BarChartModel;

import org.primefaces.model.chart.ChartSeries;

/**
 *
 * @author Ruben
 */

@Named(value = "serviciosEstadisticaController")
@RequestScoped
public class SalonesEstadisticasController implements Serializable {
    
      private BarChartModel barModel;
    @EJB
    private ServicioFacadeLocal sfl;
    private List<Servicio> servicios1;
    private List<Servicio> servicios2;
    private List<Servicio> servicios3;
    private List<Servicio> servicios4;

    public SalonesEstadisticasController() {
    }
 
    
    @PostConstruct
    public void init() {
        servicios1 = sfl.findSalones(1);
        servicios2 = sfl.findSalones(2);
        servicios3 = sfl.findSalones(3);
        servicios4 = sfl.findSalones(4);
        createHorizontalBarModel();
       
     
    }

    public BarChartModel getBarModel() {
        return barModel;
    }

    public void setBarModel(BarChartModel barModel) {
        this.barModel = barModel;
    }

  
    
     
  
    private void createHorizontalBarModel() {
         barModel = new BarChartModel();
 
     
        
        ChartSeries servicios = new ChartSeries();
       
        servicios.setLabel("Servicios");
        
        servicios.set("PreNatal", servicios1.size());
        servicios.set("PosParto", servicios2.size());
        servicios.set("Club Bebé", servicios3.size());
        servicios.set("Spa", servicios4.size());
        
      
 
       
 
        barModel.addSeries(servicios);
        
        barModel.setAnimate(true);
        barModel.setTitle("Salones/Servicios");
        barModel.setLegendPosition("e");
        barModel.setDatatipFormat("<span style=\"display:none;\">%s</span><span>%s</span>");
        barModel.setStacked(true);
        
        Axis xAxis = barModel.getAxis(AxisType.X);
       xAxis.setLabel("Servicios");
        
         
        Axis yAxis = barModel.getAxis(AxisType.Y);
        yAxis.setLabel("Número de servicios");
        yAxis.setMin(0);
        yAxis.setMax(20);
    }
     
   
 
}