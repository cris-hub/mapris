/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mapris.citas.controllers;


import java.io.Serializable;
import javax.annotation.PostConstruct;
import javax.enterprise.context.SessionScoped;
import javax.inject.Named;

/**
 *
 * @author SMEGS
 */
@Named
@SessionScoped
public class VerRutinaController implements Serializable {

    

    public VerRutinaController() {
    }

    @PostConstruct
    public void init() {

    }

    

}
