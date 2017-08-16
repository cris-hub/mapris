/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mapris.usuarios.reportes.graficos;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import javax.annotation.ManagedBean;
import javax.enterprise.context.RequestScoped;
import javax.inject.Named;
import com.mapris.modelo.entitie.Usuario;
import com.mapris.modelo.dao.UsuarioFacadeLocal;
import com.sun.xml.rpc.processor.modeler.j2ee.xml.string;

/**
 *
 * @author SMEGS
 */
@Named(value = "lineChartBean")
@RequestScoped
public class LineChartBean {

    private List<Usuario> mesUsuarios;
    private UsuarioFacadeLocal ufl;
    private List<String> grafica1;

    public List<String> getGrafica1() {
        return grafica1;
    }

    public void setGrafica1(List<String> grafica1) {
        this.grafica1 = grafica1;
    }

    public LineChartBean() {
//        mesUsuario = ufl.usuarioRegistros();
//        

        grafica1 = new ArrayList<>();
        grafica1.add("5");
        grafica1.add("15");
        grafica1.add("25");
        grafica1.add("35");
        grafica1.add("45");
        grafica1.add("55");
        grafica1.add("65");

        reload();
    }

    public List<Usuario> getMesUsuarios() {
        return mesUsuarios;
    }

    public void setMesUsuarios(List<Usuario> mesUsuarios) {
        this.mesUsuarios = mesUsuarios;
    }

    private void reload() {
//        simpleList = new ArrayList<>();
//
//        Random r = new Random();
//        for (int i = 2000; i < 2010; i++) {
//            simpleList.add(r.nextInt(500) + 800);
//        }
    }

}
