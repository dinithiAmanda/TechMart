package com.mycompany.techmart.servlet;

import com.mycompany.techmart.entities.Product;
import com.mycompany.techmart.helper.FactoryProvider;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.hibernate.Session;
import org.hibernate.Transaction;

public class EditProductServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            try {
                String name = request.getParameter("pName");
                String description = request.getParameter("pDesc");
                int price = Integer.parseInt(request.getParameter("pPrice"));
                int discount = Integer.parseInt(request.getParameter("pDiscount"));
                int quantity = Integer.parseInt(request.getParameter("pQuantity"));
                int pId = Integer.parseInt(request.getParameter("pId").trim());

                Session s = FactoryProvider.getFactory().openSession();
                Transaction tx = s.beginTransaction();

                Product product = s.get(Product.class, pId);
                product.setpName(name);
                product.setpDesc(description);
                product.setpPrice(price);
                product.setpDiscount(discount);
                product.setpQuantity(quantity);

                tx.commit();
                s.close();
                response.sendRedirect("viewProduct.jsp");

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
