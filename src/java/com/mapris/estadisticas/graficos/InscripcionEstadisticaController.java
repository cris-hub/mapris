package com.mapris.estadisticas.graficos;


import com.mapris.modelo.dao.InscripcionFacadeLocal;

import com.mapris.modelo.entitie.Inscripcion;

import com.mapris.modelo.entitie.Servicio;
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

import org.primefaces.model.chart.HorizontalBarChartModel;
import org.primefaces.model.chart.ChartSeries;

/**
 *
 * @author Ruben
 */

@Named(value = "inscripcionEstadisticaController")
@RequestScoped
public class InscripcionEstadisticaController implements Serializable {
    
    private HorizontalBarChartModel horizontalBarModel;
    @EJB
    private InscripcionFacadeLocal ifl;
    private List<Inscripcion> inscripcion;

    public InscripcionEstadisticaController() {
    }
 
    
    @PostConstruct
    public void init() {
        inscripcion = ifl.findAll();
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
 
        List<Inscripcion> list1 = new ArrayList();
        List<Inscripcion> list2 = new ArrayList();
        List<Inscripcion> list3 = new ArrayList();
        List<Inscripcion> list4 = new ArrayList();
        
        for (int i = 0; i < inscripcion.size(); i++) {
            if (inscripcion.get(i).getFkIdCurso().getIdCurso()==1) {
                list1.add(inscripcion.get(i));
            }else if(inscripcion.get(i).getFkIdCurso().getIdCurso()==2){
                
                list2.add(inscripcion.get(i));
            }else if(inscripcion.get(i).getFkIdCurso().getIdCurso()==3){
                
                list3.add(inscripcion.get(i));
            }else if(inscripcion.get(i).getFkIdCurso().getIdCurso()==4){
                
                list4.add(inscripcion.get(i));
            }
        }
        
        ChartSeries inscripcion = new ChartSeries();
       
        inscripcion.setLabel("Servicios");
        
        inscripcion.set("Yoga", list1.size());
        inscripcion.set("Pilates", list2.size());
        inscripcion.set("Esferodinamia", list3.size());
        inscripcion.set("Pasta", list4.size());
        
      
 
       
 
        horizontalBarModel.addSeries(inscripcion);
        
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
   inscripcion = null;
   
   }
 
}