package com.mapris.estadisticas.graficos;


import com.mapris.modelo.dao.AplazamientoFacadeLocal;
import com.mapris.modelo.entitie.Aplazamiento;


import com.mapris.modelo.entitie.Aplazamiento;


import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.annotation.PreDestroy;
import javax.ejb.EJB;

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

@Named(value = "aplazamientoEstadisticaController")
@RequestScoped
public class AplazamientoEstadisticaController implements Serializable {
    
      private BarChartModel barModel;
    @EJB
    private AplazamientoFacadeLocal afl;
    private List<Aplazamiento> aplazamiento;

    public AplazamientoEstadisticaController() {
    }
 
    
    @PostConstruct
    public void init() {
        aplazamiento = afl.findAll();
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
 
        List<Aplazamiento> list1 = new ArrayList();
        List<Aplazamiento> list2 = new ArrayList();
        List<Aplazamiento> list3 = new ArrayList();
   
        
        for (int i = 0; i < aplazamiento.size(); i++) {
            if (aplazamiento.get(i).getInicio().getMonth()==6) {
                list1.add(aplazamiento.get(i));
            }else if(aplazamiento.get(i).getInicio().getMonth()==7){
                
                list2.add(aplazamiento.get(i));
            }else if(aplazamiento.get(i).getInicio().getMonth()==8){
                
                list3.add(aplazamiento.get(i));
            }
        }
        
        ChartSeries aplazamiento = new ChartSeries();
       
        aplazamiento.setLabel("Servicios");
        
        aplazamiento.set("Julio", list1.size());
        aplazamiento.set("Agosto", list2.size());
        aplazamiento.set("Septiembre", list3.size());
        
      
 
       
 
        barModel.addSeries(aplazamiento);
        
        barModel.setAnimate(true);
        barModel.setTitle("Aplazamientos/Últimos tres meses");
        barModel.setLegendPosition("e");
        barModel.setDatatipFormat("<span style=\"display:none;\">%s</span><span>%s</span>");
        barModel.setStacked(true);
        
        Axis xAxis = barModel.getAxis(AxisType.X);
       xAxis.setLabel("Mes");
        
         
        Axis yAxis = barModel.getAxis(AxisType.Y);
        yAxis.setLabel("Número de aplazamientos");
        yAxis.setMin(0);
        yAxis.setMax(20);
    }
     
   @PreDestroy
   public void remove(){
   aplazamiento = null;
   
   }
 
}