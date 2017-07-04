/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mapris.archivos.controller;

import com.mapris.login.controller.SessionController;
import com.mapris.modelo.dao.FileBean;
import com.mapris.util.MessageUtil;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import javax.annotation.PostConstruct;
import javax.faces.context.ExternalContext;
import javax.faces.context.FacesContext;
import javax.faces.view.ViewScoped;
import javax.inject.Inject;
import javax.inject.Named;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.Part;

/**
 *
 * @author SMEGS
 */
@Named(value = "cargarArchivoController")
@ViewScoped
public class CargarArchivosController implements Serializable {

    @Inject
    private SessionController sc;
    //Ruta en built de donde se guardara el archivo
    private final static String UPLOAD_DIR = "/files/profileimg/";
    private String extension;

    /**
     * Creates a new instance of FileUploadController
     */
    public CargarArchivosController() {

    }

    public String getExtension() {
        return extension;
    }

    public void setExtension(String extension) {
        this.extension = extension;
    }
    

    @PostConstruct
    public void init() {
    }

    public static ExternalContext getExternalContext() {
        ExternalContext ec = FacesContext.getCurrentInstance().getExternalContext();
        return ec;
    }

    public void uploadProfileImage() {
        try {

            List<FileBean> filesBeans = getFilesUpload(CargarArchivosController.getExternalContext());

            for (FileBean fileBean : filesBeans) {
                if (fileBean.getExtension().equals("png")) {
                    setExtension(fileBean.getExtension()) ;
                    extension = fileBean.getExtension();
                    savePartProfileimg(CargarArchivosController.getExternalContext(), fileBean);
                    MessageUtil.enviarMensajeInformacion(null, "Formato correcto", "La imagen ha sido cargada satisfactoriamente");
                } else {
                    MessageUtil.enviarMensajeError(null, "Formato Incorrecto", "Solo puedes subir imagenes te tipo 'png' ");
                }
            }
            deleteFile(CargarArchivosController.getExternalContext(), "perfil." + extension);
        } catch (IOException ex) {
            MessageUtil.enviarMensajeError(null, "Formato Incorrecto", "Solo puedes subir imagenes te tipo 'png' o 'jpg'");
            ex.printStackTrace();
        } catch (ServletException ex) {
            ex.printStackTrace();
        }
    }

    private List<FileBean> getFilesUpload(ExternalContext ec) throws IOException, ServletException {
        List<FileBean> files = new ArrayList<>();
        Collection<Part> parts = getParts(ec);
        for (Part part : parts) {
            if (part.getSize() > 0 && part.getSubmittedFileName() != null) {
                files.add(new FileBean(part.getName(), part.getContentType(), part.getSize(), part));
            }
        }
        return files;
    }

    private Collection<Part> getParts(ExternalContext ec) throws IOException, ServletException {
        HttpServletRequest rq = (HttpServletRequest) ec.getRequest();
        return rq.getParts();
    }

    private void save() {

    }

    private void savePartProfileimg(ExternalContext ec, FileBean fileBean) throws IOException {
        File dir = new File(ec.getRealPath("") + UPLOAD_DIR + sc.getUsuario().getCedula().toString() + "/perfil/");
        dir.mkdirs();
        File file = new File(dir, "perfil."+extension);
        file.createNewFile();

        FileOutputStream outputStream = new FileOutputStream(file);

        InputStream inputStream = fileBean.getPart().getInputStream();

        byte[] buffer = new byte[1024];
        int length;

        while ((length = inputStream.read(buffer)) != -1) {
            outputStream.write(buffer, 0, length);
        }
        outputStream.close();
        inputStream.close();
    }

    private void deleteFile(ExternalContext ec, String name) {
        File dir = new File(ec.getRealPath("") + UPLOAD_DIR);
        dir.mkdirs();
        File file = new File(dir, name);
        file.delete();
    }
}
