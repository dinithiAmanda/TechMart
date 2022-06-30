
package com.mycompany.techmart.servlet;

import com.mycompany.techmart.entities.User;
import com.mycompany.techmart.helper.FactoryProvider;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.hibernate.Session;
import org.hibernate.Transaction;


public class EditUserServlet extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
           try {
                String name = request.getParameter("userName");
                String email = request.getParameter("userEmail");
                String password = request.getParameter("userPassword");
                String phone = request.getParameter("userPhone");
                String address = request.getParameter("userAddress");
                String branch = request.getParameter("agentBranch");
                String type = request.getParameter("userType");
                int userId = Integer.parseInt(request.getParameter("userId").trim());
                
                Session s = FactoryProvider.getFactory().openSession();
                Transaction tx = s.beginTransaction();               
                User user = s.get(User.class, userId);                
                user.setUserName(name);
                user.setUserEmail(email);
                user.setUserPassword(password);
                user.setUserPhone(phone);
                user.setUserAddress(address);
                user.setUserBranch(branch);
                user.setUserType(type);
                
                tx.commit();
                s.close();                
                response.sendRedirect("viewUser.jsp");

            } catch (Exception e) {
                e.printStackTrace();
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
