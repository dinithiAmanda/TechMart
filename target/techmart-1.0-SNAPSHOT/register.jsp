

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration</title>

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

                                <h3>Sign up here</h3>

                            </div>

                            <div class="container text-center">
                                <img src="images/registration.png" style="max-width: 100px;" class="img-fluid" alt="alt"/>
                            </div>

                            <div class="card-body px-5">
                                <%@include file="components/message.jsp" %>




                                <form action="RegisterServlet" method="post">
                                    <div class="form-group">
                                        <label for="name">User Name</label>
                                        <input name="user_name" type="text" class="form-control" id="name" placeholder="Enter your name" aria-describedby="emailHelp" placeholder="Enter email" required="">
                                    </div>
                                    <div class="form-group">
                                        <label for="email">User Email</label>
                                        <input name="user_email" type="email" class="form-control" id="email" placeholder="Enter your email" aria-describedby="emailHelp" placeholder="Enter email">
                                    </div>
                                    <div class="form-group">
                                        <label for="password">User Password</label>
                                        <input name="user_password" type="password" class="form-control" id="password" placeholder="Enter password" aria-describedby="emailHelp" placeholder="Enter email">
                                    </div>
                                    <div class="form-group">
                                        <label for="phone">User Phone</label>
                                        <input name="user_phone" type="number" class="form-control" id="phone" placeholder="Enter your phone number" aria-describedby="emailHelp" placeholder="Enter email">
                                    </div>
                                    <div class="form-group">
                                        <label for="address">User Address</label>
                                        <textarea name="user_address" style="height:200px;" class="form-control" placeholder="Enter your address"></textarea>
                                    </div>
                                    <a href="login.jsp" class="text-center d-block mb-2">have you register? log here</a>

                                    <div class="container text-center">

                                        <button class="btn btn-outline-success">Register</button>
                                        <button type="reset" class="btn btn-outline-warning">Clean</button>

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
