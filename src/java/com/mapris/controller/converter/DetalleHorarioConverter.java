/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mapris.controller.converter;


import com.mapris.modelo.dao.DetalleHorarioFacadeLocal;
import com.mapris.modelo.entitie.DetalleHorario;
import javax.enterprise.inject.spi.CDI;
import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.faces.convert.Converter;
import javax.faces.convert.FacesConverter;

/**
 *
 * @author Smegs
 */
@FacesConverter(forClass = DetalleHorario.class, value = "detalleHorarioConverter")
public class DetalleHorarioConverter implements Converter{
    
    private DetalleHorarioFacadeLocal tdfl;

    public DetalleHorarioConverter() {
        tdfl = CDI.current().select(DetalleHorarioFacadeLocal.class).get();
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
        if(value != null && value instanceof DetalleHorario){
            DetalleHorario td = (DetalleHorario) value;
            return td.getIddetalleHorario().toString();
        }
        return null;
    }
    
}
