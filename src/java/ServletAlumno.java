/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import negocio.Alumno;

/**
 *
 * @author tito
 */
@WebServlet(urlPatterns = {"/ServletAlumno"})
public class ServletAlumno extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
           if(request.getParameter("eliminar")!=null){
               int id=Integer.parseInt(request.getParameter("eliminar"));
               out.println("Eliminar ID:"+id);
               Alumno al=new Alumno();
               al.setAlumno_id(id);
               al.delete();
                response.sendRedirect("alumnos/index.jsp");
              }
         else if(request.getParameter("guardar")!=null){
                
              String nombre=request.getParameter("nombre");
             String apepat=request.getParameter("apepat");
              String apemat=request.getParameter("apemat");
              String fecha_nacimiento=request.getParameter("fecha_nacimiento");
               int sala_id=Integer.parseInt(request.getParameter("sala_id"));
               
               
               
               Alumno al=new Alumno();
               al.setNombre(nombre);
               al.setApepat(apepat);
               al.setApemat(apemat);
               al.setFecha_nacimiento(fecha_nacimiento);
               al.setSala_id(sala_id);
              al.save();
             
           response.sendRedirect("alumnos/index.jsp");
              
               
    }else if(request.getParameter("editar")!=null){
               int alumno_id=Integer.parseInt(request.getParameter("alumno_id"));
              String nombre=request.getParameter("nombre");
             String apepat=request.getParameter("apepat");
              String apemat=request.getParameter("apemat");
              String fecha_nacimiento=request.getParameter("fecha_nacimiento");
               int sala_id=Integer.parseInt(request.getParameter("sala_id"));
             
               Alumno al=new Alumno();
               al.setAlumno_id(alumno_id);
                 al.setNombre(nombre);
               al.setApepat(apepat);
               al.setApemat(apemat);
               al.setFecha_nacimiento(fecha_nacimiento);
               al.setSala_id(sala_id);
               al.update();
           response.sendRedirect("alumnos/index.jsp");
            
               
           }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
