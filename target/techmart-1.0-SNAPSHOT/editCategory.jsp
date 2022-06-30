

<%@page import="com.mycompany.techmart.entities.Category"%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.mycompany.techmart.helper.FactoryProvider"%>
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
        <title>Edit Category</title>
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

                                <h3>Edit Category Details</h3>

                                <%                    int catId = Integer.parseInt(request.getParameter("cat_id").trim());
                                    Session s = FactoryProvider.getFactory().openSession();
                                    Category category = (Category) s.get(Category.class, catId);


                                %>


                            </div>
                                <div class="mt-3 mb-3 container-fluid">
                           <form action="EditCategoryServlet" method="post">

                                <input value="<%=category.getCategoryId()%>" name="catId" type="hidden">

                                <div class="form-group">
                                    <input type="text" class="form-control" name="catTitle" placeholder="Enter category title" required="" value="<%=category.getCategoryTitle()%>"/>
                                </div>

                                <div class="form-group">
                                    <textarea style="height: 250px;" class="form-control" placeholder="Enter category description" name="catDescription" required="" ><%= category.getCategoryDescription() %></textarea>
                                </div>

                                <div class="container text-center">
                                    <button type="submit" class="btn btn-success">Edit</button>
                                    <a class="userEdit-a btn btn-secondary" href="viewCategory.jsp">Cancel</a>

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
