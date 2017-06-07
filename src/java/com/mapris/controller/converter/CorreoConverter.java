/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mapris.controller.converter;


import com.mapris.modelo.dao.CorreoFacadeLocal;
import com.mapris.modelo.entitie.Correo;
import com.mapris.modelo.entitie.Rol;
import javax.enterprise.inject.spi.CDI;
import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.faces.convert.Converter;
import javax.faces.convert.FacesConverter;

/**
 *
 * @author KoLach0
 */
@FacesConverter(forClass = Rol.class, value = "correoConverter")
public class CorreoConverter implements Converter{
    
    private CorreoFacadeLocal tdfl;

    public CorreoConverter() {
        tdfl = CDI.current().select(CorreoFacadeLocal.class).get();
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
        if(value != null && value instanceof Rol){
            Correo correo = (Correo) value;
            return correo.getIdCorreo().toString();
        }
        return null;
    }
    
}
