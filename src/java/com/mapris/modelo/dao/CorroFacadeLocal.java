/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mapris.modelo.dao;

import com.mapris.modelo.entitie.Correo;
import java.util.List;
import javax.ejb.Local;

/**
 *
 * @author SMEGS
 */
@Local
public interface CorroFacadeLocal {
    void create(Correo aplazamiento);

    void edit(Correo aplazamiento);

    void remove(Correo aplazamiento);

    Correo find(Object id);

    List<Correo> findAll();

    List<Correo> findRange(int[] range);

    int count();

    
}
