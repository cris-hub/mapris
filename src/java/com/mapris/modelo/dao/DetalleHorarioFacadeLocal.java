/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mapris.modelo.dao;

import com.mapris.modelo.entitie.DetalleHorario;
import java.util.List;
import javax.ejb.Local;

/**
 *
 * @author APRENDIZ
 */
@Local
public interface DetalleHorarioFacadeLocal {

    void create(DetalleHorario detalleHorario);

    void edit(DetalleHorario detalleHorario);

    void remove(DetalleHorario detalleHorario);

    DetalleHorario find(Object id);

    List<DetalleHorario> findAll();

    List<DetalleHorario> findRange(int[] range);

    int count();
    
}
