/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mapris.modelo.dao;

import static com.lowagie.text.pdf.PdfName.T;
import com.mapris.modelo.entitie.Aplazamiento;
import java.util.Iterator;
import java.util.Set;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.validation.ConstraintViolation;
import javax.validation.Validation;
import javax.validation.Validator;
import javax.validation.ValidatorFactory;

/**
 *
 * @author SMEGS
 */
@Stateless
public class AplazamientoFacade extends AbstractFacade<Aplazamiento> implements AplazamientoFacadeLocal {

    @PersistenceContext(unitName = "maprisPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public AplazamientoFacade() {
        super(Aplazamiento.class);
    }

    @Override
    public void create(Aplazamiento aplazamiento) {

        ValidatorFactory factory = Validation.buildDefaultValidatorFactory();
        Validator validator = factory.getValidator();
        Set<ConstraintViolation<Aplazamiento>> constraintViolations = validator.validate(aplazamiento);
        if (constraintViolations.size() > 0) {
            Iterator<ConstraintViolation<Aplazamiento>> iterator = constraintViolations.iterator();
            while (iterator.hasNext()) {
                ConstraintViolation<Aplazamiento> cv = iterator.next();
                System.err.println(cv.getRootBeanClass().getName() + "." + cv.getPropertyPath() + " " + cv.getMessage());
            }
        } else {
            getEntityManager().persist(aplazamiento);
        }
    }
}
