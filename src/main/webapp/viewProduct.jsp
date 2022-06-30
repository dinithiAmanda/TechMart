

<%@page import="com.mycompany.techmart.entities.Product"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.query.Query"%>
<%@page import="com.mycompany.techmart.helper.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%

    User user = (User) session.getAttribute("current-user");
    if (user == null) {

        session.setAttribute("message", "You are not logged in || Login first");
        response.sendRedirect("login.jsp");
        return;
    } else {
        if (user.getUserType().equals("normal")) {

            session.setAttribute("message", "You are not admin | Do not access this page");
            response.sendRedirect("login.jsp");

            return;
        }
    }


%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Product</title>
        <%@include file="components/css_js.jsp" %>
    </head>
    <body>
       <%@include file="components/narbar.jsp" %>

        <div class="container">
            <div class="row">
                <div class="col-md-11">
                <h3>Display and Edit Product</h3>
                
            </div>
                <div class="col-md-1">
                <a href="admin.jsp">Back</a>
                
            </div>
            </div>
            
            



            <table class="table table-bordered">
                <thead class="bg-light">
                    <tr>
                        <th scope="col">Name</th>
                        <th scope="col">Description</th>
                        <th scope="col">Photo</th>
                        <th scope="col">Quantity</th>
                        <th scope="col">Price</th>
                        <th scope="col">Discount</th>


                        <th scope="col">Action</th>
                    </tr>
                </thead>

                <%                                        Session s = FactoryProvider.getFactory().openSession();

                    Query q = s.createQuery("from Product");
                    List<Product> list1 = q.list();
                    for (Product product : list1) {

                %>
                <tbody>

                    <tr>

                        <td><%= product.getpName() %></td>
                        <td><%= product.getpDesc() %></td>
                        <td><%= product.getpPhoto() %></td>
                        <td><%= product.getpQuantity() %></td>
                        <td><%= product.getpPrice() %></td>
                        <td><%= product.getpDiscount() %></td>

                        
                        


                        <td><a class="btn btn-outline-success" href="editProduct.jsp?p_id=<%= product.getpId() %>">Edit</a> 
                    </tr>

                </tbody>
                <%    }
                    s.close();
                %>

            </table>


        </div>
                
                                                    <%@include file="components/footer.jsp" %>

    </body>
</html>
