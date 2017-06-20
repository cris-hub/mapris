/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mapris.usuarios.reportes.graficos;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import javax.annotation.PostConstruct;
import javax.enterprise.context.RequestScoped;
import javax.inject.Named;

/**
 *
 * @author SMEGS
 */
@Named(value = "lineChartBean")
@RequestScoped
public class LineChartBean {
    
    
    
    
    
    

    protected List<Integer> simpleList;

    public List<Integer> getSimpleList() {
        return simpleList;
    }

    @PostConstruct
    public void LineChartBean() {
        reload();
    }

    private void reload() {
        simpleList = new ArrayList<>();

        Random r = new Random();
        for (int i = 2000; i < 2010; i++) {
            simpleList.add(r.nextInt(500) + 800);
        }
    }
}
