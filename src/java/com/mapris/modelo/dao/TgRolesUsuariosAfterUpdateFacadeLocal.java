/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mapris.modelo.dao;

import com.mapris.modelo.entitie.TgRolesUsuariosAfterUpdate;
import java.util.List;
import javax.ejb.Local;

/**
 *
 * @author SMEGS
 */
@Local
public interface TgRolesUsuariosAfterUpdateFacadeLocal {

    void create(TgRolesUsuariosAfterUpdate tgRolesUsuariosAfterUpdate);

    void edit(TgRolesUsuariosAfterUpdate tgRolesUsuariosAfterUpdate);

    void remove(TgRolesUsuariosAfterUpdate tgRolesUsuariosAfterUpdate);

    TgRolesUsuariosAfterUpdate find(Object id);

    List<TgRolesUsuariosAfterUpdate> findAll();

    List<TgRolesUsuariosAfterUpdate> findRange(int[] range);

    int count();
    
}
