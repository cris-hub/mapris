/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mapris.util;

import javax.faces.application.FacesMessage;
import javax.faces.context.FacesContext;
import org.apache.commons.lang3.StringEscapeUtils;
import org.primefaces.push.EventBus;
import org.primefaces.push.EventBusFactory;

/**
 *
 * @author Ismael
 */
public class MessageUtil {

    public static void enviarMensajeError(String idClient, String summary, String detail) {
        enviarMensajeComun(FacesMessage.SEVERITY_ERROR, idClient, summary, detail);
    }

    public static void enviarMensajeErrorGlobal(String summary, String detail) {
        enviarMensajeComun(FacesMessage.SEVERITY_ERROR, null, summary, detail);
    }

    public static void enviarMensajeInformacion(String idClient, String summary, String detail) {
        enviarMensajeComun(FacesMessage.SEVERITY_INFO, idClient, summary, detail);
    }

    public static void enviarMensajeInformacionGlobal(String summary, String detail) {
        enviarMensajeComun(FacesMessage.SEVERITY_INFO, null, summary, detail);
    }

    private static void enviarMensajeComun(FacesMessage.Severity severity, String idClient, String summary, String detail) {
        FacesMessage fm = new FacesMessage(severity, summary, detail);
        FacesContext.getCurrentInstance().addMessage(idClient, fm);
    }

    public static void notificarPush(String summary, String detail) {

        String chanel = "/notify";

        EventBus eventBus = EventBusFactory.getDefault().eventBus();
        FacesMessage fm = new FacesMessage(summary, detail);
        eventBus.publish(chanel, fm);
        
        

    }
}
