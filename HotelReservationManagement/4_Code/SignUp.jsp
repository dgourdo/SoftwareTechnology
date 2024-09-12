<%@ page import="java.sql.*"%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>


<html>
<head>
    <meta charset="utf-8">
    <title>Sign Up Page</title>
    <style>

        *{
            padding: 0;
            margin: 0;
        }

        body{
            background-size: cover;
            max-width: 800px;
            margin: auto;
            font-family: sans-serif;
            background-color: #fad7d7;
            margin: 20px;
            text-align:center
        }

        nav {
            background-image: linear-gradient(to bottom,MediumSlateBlue, #0ca0e7);
        }
        .container{
            background: #2d3e3f;
            width: 350px;
            height: 400px;
            padding-bottom: 20px;
            position: absolute;
            top:50%;
            left: 50%;
            transform: translate(-50%, -50%);
            margin: auto;
            padding: 70px 50px 20px 50px;
        }


        .fl{
            float: left;
            width: 110px;
            line-height: 35px;
        }

        .fontLabel{
            color: white;
        }

        .fr{
            float: right;
        }

        .clr{
            clear: both;
        }

        .box{
            width: 360px;
            height: 35px;
            margin-top: 10px;
            font-family: verdana;
            font-size: 12px;
        }

        .textBox{
            height: 35px;
            width: 190px;
            border: none;
            padding-left: 20px;
        }

        .new{
            float: left;
        }

        .iconBox{
            height: 35px;
            width: 40px;
            line-height: 38px;
            text-align: center;
            background: #ff6600;
        }

        .terms{
            line-height: 35px;
            text-align: center;
            background: #2d3e3f;
            color: white;
        }

        .submit{
            float: right;
            border: none;
            color: white;
            width: 110px;
            height: 35px;
            background: #ff6600;
            text-transform: uppercase;
            cursor: pointer;
        }

        .logo-text{
            font-family: Lucida Calligraphy;
            font-size: 34px;
            margin-top: 10px;
            text-shadow: 5px 5px 5px grey;
            color: white;
        }

        .logo-text2{
            font-family: Lucida Calligraphy;
            font-size: 20px;
            margin-top: 10px;
            color: Crimson;
        }

    </style>
</head>
<body>



<div class="container">
    <div class="logo-text">Hotel Gourdo</div>
    <div class="logo-text2">-Sign Up Page-</div>

    <form action="SignUp.jsp" method="get">
        <div class="box">
            <label  class="fl fontLabel"> First Name: </label>
            <div class="fr">
                <input type="text" name="firstName" maxlength="15" placeholder="First Name"
                       class="textBox" autofocus="on" required>
            </div>
            <div class="clr"></div>
        </div>
        <div class="box">
            <label class="fl fontLabel"> Last Name: </label>
            <div class="fr">
                <input type="text" required name="lastName" maxlength="15"
                       placeholder="Last Name" class="textBox">
            </div>
            <div class="clr"></div>
        </div>
        <div class="box">
            <label class="fl fontLabel"> Phone Number: </label>
            <div class="fr">
                <input type="text" required name="phoneNo" maxlength="10" placeholder="Phone Number" class="textBox">
            </div>
            <div class="clr"></div>
        </div>
        <div class="box">
            <label class="fl fontLabel"> email: </label>
            <div class="fr">
                <input type="email" required name="email" maxlength="20" placeholder="email" class="textBox">
            </div>
            <div class="clr"></div>
        </div>
        <div class="box">
            <label class="fl fontLabel"> password </label>
            <div class="fr">
                <input type="Password" required name="pass" minlength="8" maxlength="12" placeholder="password" class="textBox">
            </div>
            <div class="clr"></div>
        </div>
        <div class="box terms">
            <input type="checkbox" name="Terms" required> &nbsp; I accept the terms and conditions
        </div>
        <div class="box" style="background: #2d3e3f">
            <input type="Submit" name="Submit" class="submit" value="SIGN UP">
        </div>
    </form>


    <%
        if (request.getParameter("Submit") != null) {
            String url= "jdbc:mysql://localhost:3306/hotel";
            String username= "gourdo13";
            String password= "kotronas13";

            Connection connection;
            Statement dbStmt = null;

            try{
                try {
                    Class.forName("com.mysql.jdbc.Driver");
                } catch (ClassNotFoundException e) {
                    //throw new RuntimeException(e);
                }
                connection = DriverManager.getConnection(url, username, password);

                String firstName=request.getParameter("firstName");
                String lastName=request.getParameter("lastName");
                String phoneNo=request.getParameter("phoneNo");
                String email=request.getParameter("email");
                String pass=request.getParameter("pass");


                String sql = "insert into Client(email,password,firstname,lastname,tel)"
                        + "values ('"+email+"','"+pass+"','"+firstName+"','"+lastName+"','"+phoneNo+"')";


                int count=dbStmt.executeUpdate(sql);
                if(count==1) {
    %>
    <p class="message">Welcome to Hotel Gourdo!.</p>
    <%
    } else {
    %>
    <p class="message">An error has occured.</p>
    <%
                }
                connection.close();

            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    %>

</div>
</body>
</html>