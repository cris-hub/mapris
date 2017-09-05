/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mapris.controller.converter;


import com.mapris.modelo.dao.CursoFacadeLocal;
import com.mapris.modelo.dao.RolFacadeLocal;
import com.mapris.modelo.entitie.Curso;
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
@FacesConverter(forClass = Curso.class, value = "cursoConverter")
public class CursoConverter implements Converter{
    
    private CursoFacadeLocal tdfl;

    public CursoConverter() {
        tdfl = CDI.current().select(CursoFacadeLocal.class).get();
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
        if(value != null && value instanceof Curso){
            Curso td = (Curso) value;
            return td.getIdCurso().toString();
        }
        return null;
    }
    
}
