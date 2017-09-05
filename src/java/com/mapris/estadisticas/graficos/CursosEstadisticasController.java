package com.mapris.estadisticas.graficos;


import com.mapris.modelo.dao.CursoFacadeLocal;


import com.mapris.modelo.entitie.Curso;


import java.io.Serializable;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.PostConstruct;
import javax.annotation.PreDestroy;
import javax.ejb.EJB;

import javax.enterprise.context.RequestScoped;

import javax.inject.Named;


import org.primefaces.model.chart.DonutChartModel;

/**
 *
 * @author Ruben
 */

@Named(value = "cursosEstadisticaController")
@RequestScoped
public class CursosEstadisticasController implements Serializable {
    
     private DonutChartModel donutModel;
    @EJB
    private CursoFacadeLocal cfl;
    private List<Curso> cursos;

    public CursosEstadisticasController() {
    }
 
    
    @PostConstruct
    public void init() {
        cursos = cfl.findAll();
        createDonut();
       
     
    }

    public DonutChartModel getDonutModel() {
        return donutModel;
    }

    public void setDonutModel(DonutChartModel donutModel) {
        this.donutModel = donutModel;
    }

   
     
  
    private void createDonut() {
         donutModel = new DonutChartModel();
 
        List<Curso> list1 = new ArrayList();
        List<Curso> list2 = new ArrayList();
        List<Curso> list3 = new ArrayList();
             
   
        
        for (int i = 0; i < cursos.size(); i++) {
            if (cursos.get(i).getEstado().equalsIgnoreCase("En ejecucion")) {
                list1.add(cursos.get(i));
            }else if(cursos.get(i).getEstado().equalsIgnoreCase("En proceso")){
                
                list2.add(cursos.get(i));
            }else if(cursos.get(i).getEstado().equalsIgnoreCase("Finalizado")){
                
                list3.add(cursos.get(i));
            }
        }
        
        
        
         Map<String, Number> circle1 = new LinkedHashMap<String, Number>();
        circle1.put("En Ejecución", list1.size());
        circle1.put("En Proceso", list2.size());
        circle1.put("Finalizado", list3.size());
        
        donutModel.addCircle(circle1);
         
        donutModel.setShowDataLabels(true);
        donutModel.setDataFormat("value");
        donutModel.setTitle("Estados de los Cursos");
        donutModel.setLegendPosition("w");
        
        
      
 
       
    }
    
   
     
   @PreDestroy
   public void remove(){
   cursos = null;
   
   }
 
}