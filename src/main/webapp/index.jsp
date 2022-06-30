

<%@page import="com.mycompany.techmart.helper.Helper"%>
<%@page import="com.mycompany.techmart.entities.Category"%>
<%@page import="com.mycompany.techmart.dao.CategoryDao"%>
<%@page import="com.mycompany.techmart.entities.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.mycompany.techmart.dao.ProductDao"%>
<%@page import="com.mycompany.techmart.helper.FactoryProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tech Mart</title>

        <%@include file="components/css_js.jsp" %>

    </head>
    <body>
        <%@include file="components/narbar.jsp" %>

        <div class="container-fluid">

            <div class="row mt-3 mx-2">

                <%                    String cat = request.getParameter("category");
                   

                    ProductDao dao = new ProductDao(FactoryProvider.getFactory());
                    List<Product> list = null;
                    if (cat == null || cat.trim().equals("all items")) {
                        list = dao.getAllProduct();

                    } else if (cat.trim().equals("all items")) {
                        list = dao.getAllProduct();

                    } else {

                        int cid = Integer.parseInt(cat.trim());
                        list = dao.getAllProductById(cid);

                    }

                    CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
                    List<Category> clist = cdao.getCategorys();

                %>

                <!--show category-->
                <div class="col-md-2">

                    <div class="list-group mt-4">

                        <a href="index.jsp?category=all items" class="list-group-item list-group-item-action active">
                            All Items
                        </a>




                        <%                    for (Category c : clist) {


                        %>

                        <a href="index.jsp?category=<%= c.getCategoryId()%>" class="list-group-item list-group-item-action"><%= c.getCategoryTitle()%></a>

                        <%                                }

                        %>

                    </div>

                </div>

                <!--show product-->
                <div class="col-md-10">

                    <!--row-->
                    <div class="row mt-4">

                        <div class="col-md-12">

                            <div class="card-columns">

                                <!--traversing product-->
                                <%                                for (Product p : list) {

                                %>


                                <!--product cart-->
                                <div class="card  product-cart">


                                    <div class="container text-center">
                                        <img src="images/Items/<%= p.getpPhoto()%>" style="max-height: 200px; max-width: 100%; width: auto;" class="card-img-top m-2" alt="...">

                                    </div>

                                    <div class="card-body">

                                        <h5 class="card-title"><%= p.getpName()%></h5>

                                        <p class="card-text">

                                            <%= Helper.get10Words(p.getpDesc())%>
                                        </p>


                                    </div>

                                    <div class="card-footer text-center">

                                        <button class="btn custom-bg text-white"onclick="add_to_cart(<%= p.getpId()%>, '<%= p.getpName()%>', <%= p.getPriceAfterApplyingDiscount()%>)">Add to cart</button>
                                        <button class="btn btn-outline-warning"> &#8360;<%= p.getPriceAfterApplyingDiscount()%>/- <span class="text-secondary discount-label strike"> &#8360; <%= p.getpPrice()%> </span><span class="text-secondary discount-label"><%= p.getpDiscount()%>% off</span> </button>

                                    </div>


                                </div>


                                <%                                }
                                    if (list.size() == 0) {
                                        out.println("<h3>We cannot find any matches</h3>");

                                    }

                                %>


                            </div>

                        </div>

                    </div>

                </div>

            </div>
        </div>
                                
                                <%@include file="components/modals.jsp"%>
                                <%@include file="components/footer.jsp" %>
    </body>
</html>
