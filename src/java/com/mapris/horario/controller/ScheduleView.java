package com.mapris.horario.controller;

import com.mapris.modelo.dao.CursoFacadeLocal;
import com.mapris.modelo.dao.DetalleHorarioFacadeLocal;
import com.mapris.modelo.dao.HorarioFacadeLocal;
import com.mapris.modelo.dao.ServicioFacadeLocal;
import com.mapris.modelo.entitie.Curso;
import com.mapris.modelo.entitie.DetalleHorario;
import com.mapris.modelo.entitie.Horario;
import com.mapris.modelo.entitie.Servicio;
import java.io.Serializable;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;
import java.util.TimeZone;
import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import javax.faces.context.FacesContext;
import javax.faces.event.ActionEvent;

import org.primefaces.event.ScheduleEntryMoveEvent;
import org.primefaces.event.ScheduleEntryResizeEvent;
import org.primefaces.event.SelectEvent;
import org.primefaces.model.DefaultScheduleEvent;
import org.primefaces.model.DefaultScheduleModel;
import org.primefaces.model.LazyScheduleModel;
import org.primefaces.model.ScheduleEvent;
import org.primefaces.model.ScheduleModel;

@ManagedBean
@ViewScoped
public class ScheduleView implements Serializable {

    @EJB
    private HorarioFacadeLocal hfl;
    @EJB
    private CursoFacadeLocal cfl;
    @EJB
    private DetalleHorarioFacadeLocal dhfl;
    @EJB
    private ServicioFacadeLocal sfl;

    private ScheduleModel eventModel;

    private ScheduleModel lazyEventModel;

    private ScheduleEvent event = new DefaultScheduleEvent();
    private List<Curso> cursos;
    private List<Horario> horarios;

    public void recargarCursos() {
        cursos = cfl.findAll();
    }

    @PostConstruct
    public void init() {
        eventModel = new DefaultScheduleModel();
        recargarCursos();
        for (Curso curso : cursos) {
            horarios = curso.getHorarios();
            Servicio servicio = curso.getIdServicios();
            for (Horario horario : horarios) {
                Calendar gc = new GregorianCalendar();
                gc.setTime(horario.getFechaInicio());
                Date fechaFin = getDateMediaNoche(horario.getFechaFin());
                for (DetalleHorario dh : horario.getDetallesHorarios()) {
                    Date fechaInicio = getNextDay(horario.getFechaInicio(), dh.getHoraInicio(), dh.getDiaSemana());
                    while (fechaInicio.getTime() <= fechaFin.getTime()) {
                        Date d = fechaInicio;
                        System.out.println(d + " - " + horario.getFechaFin());
                        eventModel.addEvent(new DefaultScheduleEvent(
                                servicio.getNombre(), d, new Date(d.getTime() + (dh.getDuracion() * 3600000))));
                        fechaInicio = getNextDay(d);
                        fechaInicio = getNextDay(fechaInicio, dh.getHoraInicio(), dh.getDiaSemana());
                    }

                }
            }

        }

        lazyEventModel = new LazyScheduleModel() {

            @Override
            public void loadEvents(Date start, Date end) {
                Date random = getRandomDate(start);
                addEvent(new DefaultScheduleEvent("Lazy Event 1", random, random));

                random = getRandomDate(start);
                addEvent(new DefaultScheduleEvent("Lazy Event 2", random, random));
            }
        };
    }

    private void nextLunes(Calendar c) {
        while (c.get(Calendar.DAY_OF_WEEK) != Calendar.MONDAY) {
            c.add(Calendar.DATE, 1);
        }
    }

    public Date getRandomDate(Date base) {
        Calendar date = Calendar.getInstance();
        date.setTime(base);
        date.add(Calendar.DATE, ((int) (Math.random() * 30)) + 1);    //set random day of month

        return date.getTime();
    }

    public Date getInitialDate() {
        Calendar calendar = Calendar.getInstance();
        calendar.set(calendar.get(Calendar.YEAR), Calendar.FEBRUARY, calendar.get(Calendar.DATE), 0, 0, 0);

        return calendar.getTime();
    }

    public ScheduleModel getEventModel() {
        return eventModel;
    }

    public ScheduleModel getLazyEventModel() {
        return lazyEventModel;
    }

    private Calendar today() {
        Calendar calendar = Calendar.getInstance();
        calendar.set(calendar.get(Calendar.YEAR), calendar.get(Calendar.MONTH), calendar.get(Calendar.DATE), 0, 0, 0);

        return calendar;
    }

    private Date previousDay8Pm() {
        Calendar t = (Calendar) today().clone();
        t.set(Calendar.AM_PM, Calendar.PM);
        t.set(Calendar.DATE, t.get(Calendar.DATE) - 1);
        t.set(Calendar.HOUR, 8);

        return t.getTime();
    }

    private Date previousDay11Pm() {
        Calendar t = (Calendar) today().clone();
        t.set(Calendar.AM_PM, Calendar.PM);
        t.set(Calendar.DATE, t.get(Calendar.DATE) - 1);
        t.set(Calendar.HOUR, 11);

        return t.getTime();
    }

    private Date today1Pm() {
        Calendar t = (Calendar) today().clone();
        t.set(Calendar.AM_PM, Calendar.PM);
        t.set(Calendar.HOUR, 1);

        return t.getTime();
    }

    private Date theDayAfter3Pm() {
        Calendar t = (Calendar) today().clone();
        t.set(Calendar.DATE, t.get(Calendar.DATE) + 2);
        t.set(Calendar.AM_PM, Calendar.PM);
        t.set(Calendar.HOUR, 3);

        return t.getTime();
    }

    private Date today6Pm() {
        Calendar t = (Calendar) today().clone();
        t.set(Calendar.AM_PM, Calendar.PM);
        t.set(Calendar.HOUR, 6);

        return t.getTime();
    }

    private Date nextDay9Am() {
        Calendar t = (Calendar) today().clone();
        t.set(Calendar.AM_PM, Calendar.AM);
        t.set(Calendar.DATE, t.get(Calendar.DATE) + 1);
        t.set(Calendar.HOUR, 9);

        return t.getTime();
    }

    private Date nextDay11Am() {
        Calendar t = (Calendar) today().clone();
        t.set(Calendar.AM_PM, Calendar.AM);
        t.set(Calendar.DATE, t.get(Calendar.DATE) + 1);
        t.set(Calendar.HOUR, 11);

        return t.getTime();
    }

    private Date fourDaysLater3pm() {
        Calendar t = (Calendar) today().clone();
        t.set(Calendar.AM_PM, Calendar.PM);
        t.set(Calendar.DATE, t.get(Calendar.DATE) + 4);
        t.set(Calendar.HOUR, 3);

        return t.getTime();
    }

    public ScheduleEvent getEvent() {
        return event;
    }

    public void setEvent(ScheduleEvent event) {
        this.event = event;
    }

    public void addEvent(ActionEvent actionEvent) {
        if (event.getId() == null) {
            eventModel.addEvent(event);
        } else {
            eventModel.updateEvent(event);
        }

        event = new DefaultScheduleEvent();
    }

    public void onEventSelect(SelectEvent selectEvent) {
        event = (ScheduleEvent) selectEvent.getObject();
    }

    public void onDateSelect(SelectEvent selectEvent) {
        event = new DefaultScheduleEvent("", (Date) selectEvent.getObject(), (Date) selectEvent.getObject());
    }

    public void onEventMove(ScheduleEntryMoveEvent event) {
        FacesMessage message = new FacesMessage(FacesMessage.SEVERITY_INFO, "Event moved", "Day delta:" + event.getDayDelta() + ", Minute delta:" + event.getMinuteDelta());

        addMessage(message);
    }

    public void onEventResize(ScheduleEntryResizeEvent event) {
        FacesMessage message = new FacesMessage(FacesMessage.SEVERITY_INFO, "Event resized", "Day delta:" + event.getDayDelta() + ", Minute delta:" + event.getMinuteDelta());

        addMessage(message);
    }

    private void addMessage(FacesMessage message) {
        FacesContext.getCurrentInstance().addMessage(null, message);
    }

    public Date getDateHora(Calendar c, Date hora) {
        //c.set(Calendar.DATE, t.get(Calendar.DATE) );
        c.set(Calendar.HOUR, hora.getHours());
        c.set(Calendar.MINUTE, hora.getMinutes());

        return c.getTime();
    }
    
    public Date getDateMediaNoche(Date fecha) {
        Calendar c = new GregorianCalendar(fecha.getYear()+1900, fecha.getMonth(), fecha.getDate());
        c.set(Calendar.HOUR, 23);
        c.set(Calendar.MINUTE, 59);
        c.set(Calendar.SECOND, 59);
        return c.getTime();
    }
    
    public Date getNextDay(Date fecha) {
        Calendar c = new GregorianCalendar(fecha.getYear()+1900, fecha.getMonth(), fecha.getDate());
            c.set(Calendar.DATE, c.get(Calendar.DATE) + 1);
        return c.getTime();
    }

    public Date getNextDay(Date fecha, Date hora, Integer diaSemana) {
        Calendar c = new GregorianCalendar(fecha.getYear()+1900, fecha.getMonth(), fecha.getDate());
        while (c.get(Calendar.DAY_OF_WEEK) != diaSemana) {
            c.set(Calendar.DATE, c.get(Calendar.DATE) + 1);
        }
        return getDateHora(c, hora);
    }
}
