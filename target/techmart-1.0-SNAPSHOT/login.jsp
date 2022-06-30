

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>

        <%@include file="components/css_js.jsp" %>

    </head>
    <body>

        <%@include file="components/narbar.jsp" %>

        <div class="container">
            <div class="row">
                <div class="col-md-8 offset-md-2">

                    <div class="card mt-5">

                        <div class="card-header custom-bg text-white">
                            <h3>Login here</h3>
                        </div>

                        <div class="card-body">

                            <%@include file="components/message.jsp" %>

                            <form action="LoginServlet" method="post">
                                <div class="form-group row">
                                    <label for="staticEmail" class="col-sm-2 col-form-lable">Email</label>
                                    <div class="col-sm-10">
                                        <input name="email" type="email" class="form-control-plaintext" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="email@example.com">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="inputPassword1" class="col-sm-2 col-form-lable">Password</label>
                                    <div class="col-sm-10">
                                        <input name="password" type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
                                    </div>
                                </div>
                                <a href="register.jsp" class="text-center d-block mb-2">can't register? click here</a>
                                <div class="container text-center">
                                    <button type="submit" class="btn btn-dark custom-bg border-0">Login</button>
                                    

                                </div>
                            </form>
                        </div>



                    </div>

                </div>
            </div>
        </div>         
                            <%@include file="components/footer.jsp" %>
    </body>
</html>
