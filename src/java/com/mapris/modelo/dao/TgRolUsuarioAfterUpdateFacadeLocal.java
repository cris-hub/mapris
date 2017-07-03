/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mapris.modelo.dao;

import com.mapris.modelo.entitie.TgRolUsuarioAfterUpdate;
import java.util.List;
import javax.ejb.Local;

/**
 *
 * @author Ruben
 */
@Local
public interface TgRolUsuarioAfterUpdateFacadeLocal {

    void create(TgRolUsuarioAfterUpdate tgRolUsuarioAfterUpdate);

    void edit(TgRolUsuarioAfterUpdate tgRolUsuarioAfterUpdate);

    void remove(TgRolUsuarioAfterUpdate tgRolUsuarioAfterUpdate);

    TgRolUsuarioAfterUpdate find(Object id);

    List<TgRolUsuarioAfterUpdate> findAll();

    List<TgRolUsuarioAfterUpdate> findRange(int[] range);

    int count();
    
}
