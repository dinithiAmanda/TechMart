<%@page import="org.hibernate.query.Query"%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.mycompany.techmart.helper.Helper"%>
<%@page import="java.util.Map"%>
<%@page import="com.mycompany.techmart.entities.Category"%>
<%@page import="java.util.List"%>
<%@page import="com.mycompany.techmart.helper.FactoryProvider"%>
<%@page import="com.mycompany.techmart.dao.CategoryDao"%>
<%@page import="com.mycompany.techmart.entities.User"%>
<%@page import="com.mycompany.techmart.entities.*"%>
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







<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin</title>
        <%@include file="components/css_js.jsp" %>
    </head>
    <body>
        <%@include file="components/narbar.jsp" %>

        <div class="container admin">

            <div class="container-fluid">

                <div class="container-fluid mt-3">

                    <%@include file="components/message.jsp" %>
                </div>


            </div>






            <!--first row-->
            <div class="row mt-3">
                <div class="col-md-6">
                    <div class="card" data-toggle="modal" data-target="#add-category-modal">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 125px" class="img-fluid" src="images/category list.png" alt="alt"/>
                            </div>
                            <h1><%= list.size()%></h1>

                            <p class="mt-2">Click here to add new category</p>
                            <h1 class="text-uppercase text-muted">Add Category</h1>
                        </div>
                    </div>
                </div>

                <div class="col-md-6">
                    <div class="card" data-toggle="modal" data-target="#add-product-modal">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 125px" class="img-fluid" src="images/add product.png" alt="alt"/>
                            </div>
                            <h1><%= m.get("productCount")%></h1>

                            <p class="mt-2">Click here to add new Product</p>
                            <h1 class="text-uppercase text-muted">Add Products</h1>
                        </div>
                    </div>
                </div>


            </div>


            <!--second row-->
            <div class="row mt-3">
                <div class="col-md-6">
                    <div class="card" data-toggle="modal" data-target="#add-salesAgent-modal">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 125px" class="img-fluid" src="images/add sales agent.png" alt="alt"/>
                            </div>



                            <p class="mt-2">Click here to Add Sales Agents</p>
                            <h1 class="text-uppercase text-muted">Add Sales Agents</h1>
                        </div>
                    </div>
                </div>


                <div class="col-md-6">
                    <div class="card" data-toggle="modal" data-target="">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 125px" class="img-fluid" src="images/order.png" alt="alt"/>
                            </div>
                            <p class="mt-2">Click here to view customer order</p>
                            <h1 class="text-uppercase text-muted">view customer order</h1>
                        </div>
                    </div>
                </div>

            </div>


            <!--Third row-->
            <div class="row mt-3">
                <div class="col-md-6">
                    <div class="card" data-toggle="modal" data-target="">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 125px" class="img-fluid" src="images/inventory.png" alt="alt"/>
                            </div>
                            <p class="mt-2">Click here to view inventory details</p>
                            <h1 class="text-uppercase text-muted">view inventory report</h1>
                        </div>
                    </div>
                </div>


                <div class="col-md-6">
                    <div class="card" data-toggle="modal" data-target="">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 125px" class="img-fluid" src="images/sales.png" alt="alt"/>
                            </div>
                            <p class="mt-2">Click here to view total sales</p>
                            <h1 class="text-uppercase text-muted">view total sales</h1>
                        </div>
                    </div>
                </div>

            </div>


            <!--add category modal-->

            <!-- Modal -->
            <div class="modal fade" id="add-category-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-lg" role="document">
                    <div class="modal-content">
                        <div class="modal-header custom-bg text-white">
                            <h5 class="modal-title" id="exampleModalLabel">Fill category details</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">

                            <form action="ItemOperationServlet" method="post">

                                <input type="hidden" name="operation" value="addcategory">

                                <div class="form-group">
                                    <input type="text" class="form-control" name="catTitle" placeholder="Enter category title" required=""/>
                                </div>

                                <div class="form-group">
                                    <textarea style="height: 250px;" class="form-control" placeholder="Enter category description" name="catDescription" required=""></textarea>
                                </div>

                                <div class="container text-center">
                                    <button class="btn btn-outline-success">Add Category</button>
                                    <a class="btn btn-outline-warning" href="viewCategory.jsp">view category</a>
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>

                                </div>

                            </form>


                        </div>

                    </div>
                </div>
            </div>

            <!--End category modal-->


            <!--Product modal-->

            <!-- Modal -->
            <div class="modal fade" id="add-product-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-lg" role="document">
                    <div class="modal-content">
                        <div class="modal-header custom-bg text-white">
                            <h5 class="modal-title" id="exampleModalLabel">Product Details</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">

                            <form action="ItemOperationServlet" method="post" enctype="multipart/form-data">

                                <input type="hidden" name="operation" value="addproduct" />

                                <div class="form-group">

                                    <input type="text" class="form-control" placeholder="Enter title of product" name="pName" required=""/>

                                </div>

                                <div class="form-group">

                                    <textarea style="height: 100px" class="form-control" placeholder="Enter description of product" name="pDesc" required=""></textarea>

                                </div>

                                <div class="form-group">

                                    <input type="number" class="form-control" placeholder="Enter price of product" name="pPrice" required=""/>

                                </div>

                                <div class="form-group">

                                    <input type="number" class="form-control" placeholder="Enter discount of product" name="pDiscount" required=""/>

                                </div>

                                <div class="form-group">

                                    <input type="number" class="form-control" placeholder="Enter Quantity of product" name="pQuantity" required=""/>

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

                                <div class="form-group">
                                    <label for="pPic">Select picture of product</label>
                                    <br>
                                    <input type="file" id="pPic" name="pPic" required=""/>

                                </div>

                                <div class="container text-center">

                                    <button class="btn btn-outline-success">Add Product</button>
                                    <a class="btn btn-outline-warning" href="viewProduct.jsp">view product</a>
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>

                                </div>

                            </form>



                        </div>

                    </div>
                </div>
            </div>



            <!--End Product modal-->


            <!--add Sales Agent modal-->

            <!-- Modal -->
            <div class="modal fade" id="add-salesAgent-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-lg" role="document">
                    <div class="modal-content">
                        <div class="modal-header custom-bg text-white">
                            <h5 class="modal-title" id="exampleModalLabel">Fill Sales Agent details</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">

                            <form action="AgentServlet" method="post">

                                <input type="hidden" name="added" value="addSalesAgent">

                                <div class="form-group">
                                    <input name="userName" type="text" class="form-control" id="name" placeholder="Enter Name" aria-describedby="emailHelp" placeholder="Enter email" required="">
                                </div>
                                <div class="form-group">
                                    <input name="userEmail" type="email" class="form-control" id="email" placeholder="Enter Email" aria-describedby="emailHelp" placeholder="Enter email">
                                </div>
                                <div class="form-group">
                                    <input name="userPassword" type="password" class="form-control" id="password" placeholder="Enter Password" aria-describedby="emailHelp" placeholder="Enter email">
                                </div>
                                <div class="form-group">
                                    <input name="userPhone" type="number" class="form-control" id="phone" placeholder="Enter Phone" aria-describedby="emailHelp" placeholder="Enter email">
                                </div>
                                <div class="form-group">
                                    <textarea name="userAddress" style="height:100px;" class="form-control" placeholder="Enter Address"></textarea>
                                </div>

                                <div class="form-group">
                                    <input type="text" class="form-control" name="agentBranch" placeholder="Enter Branch"/>
                                </div>

                                <div class="form-group">
                                    <select name="userType" class="form-control">
                                        <option>admin</option>
                                        <option>supplier</option>
                                        <option>agent</option>
                                        <option>normal</option>
                                    </select>
                                </div>



                                <div class="container text-center">
                                    <button class="btn btn-outline-success">Add users</button>
                                    <a class="btn btn-outline-warning" href="viewUser.jsp">view users</a>
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>

                                </div>

                            </form>


                        </div>

                    </div>
                </div>
            </div>
            <!--End Sales Agent modal-->
        </div>



        <%@include file="components/modals.jsp" %>
        <%@include file="components/footer.jsp" %>

    </body>
</html>
