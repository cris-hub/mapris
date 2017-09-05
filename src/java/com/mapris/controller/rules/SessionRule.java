/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mapris.controller.rules;


import com.mapris.modelo.dao.UsuarioFacadeLocal;
import com.mapris.modelo.entitie.Rol;
import com.mapris.modelo.entitie.Usuario;

import com.mapris.util.MessageUtil;
import javax.ejb.EJB;
import javax.ejb.Stateless;

/**
 *
 * @author Ismael
 */
@Stateless
public class SessionRule {

    @EJB
    private UsuarioFacadeLocal ufl;

    public Usuario iniciar(String documento, String clave) {
        Usuario u = null;
        if (documento != null && documento.length()> 0
                && clave != null && clave.length() > 0) {
            u = ufl.loginProcedure(documento, clave);
            if (u != null) {
                if (u.getIdEstados().getIdEstados() == 2) {
                    u = null;
                    MessageUtil.enviarMensajeErrorGlobal(
                            "Usuario bloqueado",
                            "Contacte al administrador par que solucione el incoveniente.");

                }else if (u.getIdEstados().getIdEstados()==3) {
                    
                    u = null;
                    MessageUtil.enviarMensajeErrorGlobal(
                            "Usuario sin rol asignado",
                            "Debe esperar 24 horas para hacer efectivo el acceso al sistema de información");
                    
                }else if (u.getIdEstados().getIdEstados()==4) {
                    
                    u = null;
                    MessageUtil.enviarMensajeErrorGlobal(
                            "El usuario aplazó",
                            "El usuario realizo una aplazamiento de su inscripción por ello no puede ingresar al sistema");
                    
                }
            } else {
                u=null;
                MessageUtil.enviarMensajeErrorGlobal(
                        "Datos incorrectos",
                        "Documento y/o clave invalidos");
            }
        } else {
            u=null;
            MessageUtil.enviarMensajeErrorGlobal(
                    "Datos obligatorios",
                    "Documento y/o clave son necesarios para iniciar sesión");
        }
        return u;
    }

    public Rol validarRol(Usuario u) {
        Rol r = null;
        if (u.getRoles() != null && u.getRoles().size() > 0) {
            r = u.getRoles().get(0);
        } else {
            MessageUtil.enviarMensajeErrorGlobal(
                    "Rol no asignado",
                    "Debe esperar a que se le asigne un rol dentro del sistema");
        }
        return r;
    }

}
