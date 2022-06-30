

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
        <title>View User</title>
        <%@include file="components/css_js.jsp" %>
    </head>
    <body>
        <%@include file="components/narbar.jsp" %>

        <div class="container">
            <div class="row">
                <div class="col-md-11">
                <h3>Display and Edit Users</h3>
                
            </div>
                <div class="col-md-1">
                <a href="admin.jsp">Back</a>
                
            </div>
            </div>
            
            



            <table class="table table-bordered">
                <thead class="bg-light">
                    <tr>
                        <th scope="col">Name</th>
                        <th scope="col">Email</th>
                        <th scope="col">Password</th>
                        <th scope="col">Phone Number</th>
                        <th scope="col">Address</th>
                        <th scope="col">Branch</th>
                        <th scope="col">User Type</th>

                        <th scope="col">Action</th>
                    </tr>
                </thead>

                <%                                        Session s = FactoryProvider.getFactory().openSession();

                    Query q = s.createQuery("from User");
                    List<User> list1 = q.list();
                    for (User user2 : list1) {

                %>
                <tbody>

                    <tr>

                        <td><%= user2.getUserName() %></td>
                        <td><%= user2.getUserEmail() %></td>
                        <td><%= user2.getUserPassword() %></td>
                        <td><%= user2.getUserPhone() %></td>
                        <td><%= user2.getUserAddress() %></td>
                        <td><%= user2.getUserBranch() %></td>
                        <td><%= user2.getUserType()%></td>
                        
                        


                        <td><a class="btn btn-outline-success" href="editUser.jsp?user_id=<%=user2.getUserId()%>">Edit</a> 
                            <a class="btn btn-outline-danger" href="DeleteServlet?user_id=<%=user2.getUserId()%>">Delete</a></td>
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
