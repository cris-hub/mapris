/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mapris.modelo.dao;

import com.mapris.modelo.entitie.TipoAplazamiento;
import java.util.List;
import javax.ejb.Local;

/**
 *
 * @author SMEGS
 */
@Local
public interface TipoAplazamientoFacadeLocal {

    void create(TipoAplazamiento tipoAplazamiento);

    void edit(TipoAplazamiento tipoAplazamiento);

    void remove(TipoAplazamiento tipoAplazamiento);

    TipoAplazamiento find(Object id);

    List<TipoAplazamiento> findAll();

    List<TipoAplazamiento> findRange(int[] range);

    int count();
    
}
