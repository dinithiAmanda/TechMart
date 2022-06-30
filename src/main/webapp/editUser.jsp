


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
        <title>Edit User</title>

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

                                <h3>Edit User Details</h3>

                                <%                    int userId = Integer.parseInt(request.getParameter("user_id").trim());
                                    Session s = FactoryProvider.getFactory().openSession();
                                    User user2 = (User) s.get(User.class, userId);


                                %>


                            </div>
                            <div class="mt-3 mb-3 container-fluid">
                                <form action="EditUserServlet" method="post">

                                    <input value="<%= user2.getUserId()%>" name="userId" type="hidden"/>

                                    <div class="form-group">
                                        <input name="userName" type="text" class="form-control" id="name"  aria-describedby="emailHelp" value="<%= user2.getUserName()%>"  required="">
                                    </div>
                                    <div class="form-group">
                                        <input name="userEmail" type="email" class="form-control" id="email"  aria-describedby="emailHelp" value="<%= user2.getUserEmail()%>" required="">
                                    </div>
                                    <div class="form-group">
                                        <input name="userPassword" type="password" class="form-control" id="password"  aria-describedby="emailHelp" value="<%= user2.getUserPassword()%>" >
                                    </div>
                                    <div class="form-group">
                                        <input name="userPhone" type="number" class="form-control" id="phone" aria-describedby="emailHelp" value="<%= user2.getUserPhone()%>">
                                    </div>
                                    <div class="form-group">
                                        <textarea name="userAddress" style="height:100px;" class="form-control" ><%= user2.getUserAddress()%></textarea>
                                    </div>

                                    <div class="form-group">
                                        <input name="agentBranch" type="text" class="form-control"  aria-describedby="emailHelp" value="<%= user2.getUserBranch()%>">

                                    </div>

                                    <div class="form-group">
                                        <select name="userType" class="form-control">
                                            <option>                                    <%= user2.getUserType()%>
                                            </option>
                                            <option>admin</option>
                                            <option>supplier</option>
                                            <option>agent</option>
                                            <option>normal</option>
                                        </select>
                                    </div>

                                    <div class="text-center">
                                        <button type="submit" class="btn btn-success">Edit</button>
                                        <a class="userEdit-a btn btn-secondary" href="viewUser.jsp">Cancel</a>
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
