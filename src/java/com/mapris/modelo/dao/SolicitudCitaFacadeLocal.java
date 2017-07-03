/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mapris.modelo.dao;

import com.mapris.modelo.entitie.SolicitudCita;
import java.util.List;
import javax.ejb.Local;

/**
 *
 * @author Ruben
 */
@Local
public interface SolicitudCitaFacadeLocal {

    void create(SolicitudCita solicitudCita);

    void edit(SolicitudCita solicitudCita);

    void remove(SolicitudCita solicitudCita);

    SolicitudCita find(Object id);

    List<SolicitudCita> findAll();

    List<SolicitudCita> findRange(int[] range);

    int count();
    
}
