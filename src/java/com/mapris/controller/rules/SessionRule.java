/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mapris.controller.rules;


import com.mapris.modelo.entities.Rol;
import com.mapris.modelo.entities.Usuario;
import com.mapris.modelo.facade.UsuarioFacade;
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
    private UsuarioFacade ufl;

    public Usuario iniciar(Long documento, String clave) {
        Usuario u = null;
        if (documento != null && documento > 0
                && clave != null && clave.length() > 0) {
            u = ufl.login(documento, clave);
//            if (u != null) {
//                if (u.getEstado() == 2) {
//                    u = null;
//                    MessageUtil.enviarMensajeErrorGlobal(
//                            "Usuario bloqueado",
//                            "Contacte al administrador par que solucione el incoveniente.");
//
//                }
//            } else {
//                MessageUtil.enviarMensajeErrorGlobal(
//                        "Datos incorrectos",
//                        "Documento y/o clave invalidos");
//            }
        } else {
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
