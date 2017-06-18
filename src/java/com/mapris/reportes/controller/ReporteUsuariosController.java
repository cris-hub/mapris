
package com.mapris.reportes.controller;

import com.mapris.modelo.dao.UsuarioFacadeLocal;
import com.mapris.modelo.entitie.Usuario;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.inject.Named;
import javax.enterprise.context.RequestScoped;
import javax.faces.context.ExternalContext;
import javax.faces.context.FacesContext;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;


@Named(value = "reporteUsuariosController")
@RequestScoped
public class ReporteUsuariosController {
    @EJB
    private UsuarioFacadeLocal ufl;
    private List<Usuario> usuarios;
    private JasperPrint jp;
    
    public ReporteUsuariosController() {
    }
    @PostConstruct
    public void init() {
        usuarios = ufl.findAll();
    }
    public List<Usuario> getUsuarios() {
        return usuarios;
    }
    private void prepararExport() throws JRException {
        Map<String, Object> params = new HashMap<>();
//        params.put("UsuarioDelReporte", "Ismael Suárez");
        JRBeanCollectionDataSource bcds = new JRBeanCollectionDataSource(usuarios);
        String reportPath = FacesContext.getCurrentInstance().getExternalContext().getRealPath("/") + "/WEB-INF/reportes/usuarios/ReportesUsuarios.jasper";
        jp = JasperFillManager.fillReport(reportPath, params, bcds);
    }
    public void exportarPDF() throws IOException, JRException {
        prepararExport();
        ServletOutputStream out = null;
        String contentType = "application/pdf";
        FacesContext fc = FacesContext.getCurrentInstance();
        ExternalContext ec = fc.getExternalContext();
        HttpServletResponse res = (HttpServletResponse) ec.getResponse();
        res.setContentType(contentType);
        res.addHeader("Content-disposition", "attachment; filename=\"reporte.pdf\"");
        out = res.getOutputStream();
        JasperExportManager.exportReportToPdfStream(jp, out);
        fc.responseComplete();
    }

}
