

<%@page import="com.mycompany.techmart.helper.Helper"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="com.mycompany.techmart.dao.CategoryDao"%>
<%@page import="com.mycompany.techmart.entities.Category"%>
<%@page import="com.mycompany.techmart.entities.Product"%>
<%@page import="com.mycompany.techmart.helper.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

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

<%  CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
    List<Category> list = cdao.getCategorys();

//getting count
    Map<String, Long> m = Helper.getCounts(FactoryProvider.getFactory());

%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Product</title>
        <%@include file="components/css_js.jsp" %>
    </head>
    <body>
         <%@include file="components/narbar.jsp" %>

        <div class="container-fluid">
            <div class="row mt-5 mb-5">
                <div class="col-md-6 offset-md-3">



                    <div class="card">
                        <div class="card">
                            <div class="card-header custom-bg text-white">

                                <h3>Edit Product Details</h3>

                                <%                    int pId = Integer.parseInt(request.getParameter("p_id").trim());
                                    Session s = FactoryProvider.getFactory().openSession();
                                    Product product = (Product) s.get(Product.class, pId);


                                %>


                            </div>
                                <div class="mt-3 mb-3 container-fluid">
                            <form action="EditProductServlet" method="post">

                                <input value="<%= product.getpId() %>" name="pId" type="hidden" />

                                <div class="form-group">

                                    <input type="text" class="form-control" placeholder="Enter title of product" name="pName" required="" value="<%= product.getpName()%>"/>

                                </div>

                                <div class="form-group">

                                    <textarea style="height: 100px" class="form-control" placeholder="Enter description of product" name="pDesc" required=""><%=product.getpDesc() %></textarea>

                                </div>

                                <div class="form-group">

                                    <input type="number" class="form-control" placeholder="Enter price of product" name="pPrice" required="" value="<%= product.getpPrice()%>"/>

                                </div>

                                <div class="form-group">

                                    <input type="number" class="form-control" placeholder="Enter discount of product" name="pDiscount" required="" value="<%= product.getpDiscount()%>"/>

                                </div>

                                <div class="form-group">

                                    <input type="number" class="form-control" placeholder="Enter Quantity of product" name="pQuantity" required="" value="<%= product.getpQuantity()%>"/>

                                </div>





                                <div class="form-group">

                                    <select name="catId" id="" class="form-control">

                                        <%                                            for (Category c : list) {

                                        %>

                                        <option value="<%= c.getCategoryId()%>"><%= c.getCategoryTitle()%></option>


                                        <%

                                            }

                                        %>

                                    </select>


                                </div>

                                

                               <div class="container text-center">
                                    <button type="submit" class="btn btn-success">Edit</button>
                                    <a class="userEdit-a btn btn-secondary" href="viewProduct.jsp">Cancel</a>

                                </div>
                            </form>
                                </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
                                    
                                    
                                                                        <%@include file="components/footer.jsp" %>

    </body>
</html>
