/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.avn.doublesubmitcookiepattern;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.util.Base64;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author chandima
 */
public class Login extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */

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
        requestService(request, response);
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

    private void requestService(HttpServletRequest request, HttpServletResponse response) {
        PrintWriter out = null;
        try {
            response.setContentType("text/html;charset=UTF-8");
            out = response.getWriter();
            try {
                String username = request.getParameter("username");
                String password = request.getParameter("password");
                
                Cookie[] cookies = request.getCookies();//request for auto generated cookies in the browser
                cookies[0].setPath("/");
                
                if (username.equals("admin") && password.equals("admin")) {
                    HttpSession session = request.getSession();
                    session.setAttribute("username", username);
                    String csrfToken = generateCSRFToken();
                    System.out.println("Generated Token :"+csrfToken);
                    Cookie c1 = new Cookie(cookies[0].getValue(), csrfToken);//double submit parts
                    cookies[0].setValue(csrfToken);
                    cookies[0].setPath("/");
                    response.addCookie(c1);
                    session.setAttribute("csrfToken", csrfToken);//double submit parts
                    try {
                        response.sendRedirect("home.jsp");
                    } catch (IOException ex) {
                        Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, ex);
                    }
                } else {
                    out.println("Invalid username or password | try 'admin' for both username and password");
                }
            }finally {
                out.close();
            }
        } catch (IOException ex) {
            Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, ex);
        }finally {
            out.close();
        }
    }

    private static String generateCSRFToken(){
        String CSRFToken = null;
        byte[] bytes = new byte[16];
        try {
            SecureRandom secureRandom = SecureRandom.getInstanceStrong();
            secureRandom.nextBytes(bytes);
            CSRFToken = new String(Base64.getEncoder().encode(bytes));
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
        return CSRFToken;
    }
    
}
