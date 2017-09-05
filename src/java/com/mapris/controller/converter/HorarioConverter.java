/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mapris.controller.converter;


import com.mapris.modelo.dao.HorarioFacadeLocal;
import com.mapris.modelo.dao.RolFacadeLocal;
import com.mapris.modelo.entitie.Horario;
import com.mapris.modelo.entitie.Rol;
import javax.enterprise.inject.spi.CDI;
import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.faces.convert.Converter;
import javax.faces.convert.FacesConverter;

/**
 *
 * @author Smegs
 */
@FacesConverter(forClass = Horario.class, value = "horarioConverter")
public class HorarioConverter implements Converter{
    
    private HorarioFacadeLocal tdfl;

    public HorarioConverter() {
        tdfl = CDI.current().select(HorarioFacadeLocal.class).get();
    }
    
    @Override
    public Object getAsObject(FacesContext context, UIComponent component, String value) {
        if(value != null && value.length() > 0){
            return tdfl.find(Integer.valueOf(value));
        } 
        return null;
    }

    @Override
    public String getAsString(FacesContext context, UIComponent component, Object value) {
        if(value != null && value instanceof Horario){
            Horario td = (Horario) value;
            return td.getIdHorario().toString();
        }
        return null;
    }
    
}
