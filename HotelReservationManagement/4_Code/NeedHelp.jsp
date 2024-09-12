<%@ page import="java.sql.*"%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>


<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <title>Home Page</title>
    <style>
        * {
            box-sizing: border-box;
        }

        body {
            background-size: cover;
            max-width: 800px;
            margin: auto;
            font-family: sans-serif;
            background-color: #FAEBD7;
            margin: 20px;
            text-align:center
        }

        nav {
            background-image: linear-gradient(to bottom,MediumSlateBlue, #0ca0e7);
        }

        .container{
            background: Grey;
            width: 450px;
            height: 500px;
            padding-bottom: 80px;
            position: absolute;
            top:60%;
            left: 28%;
            transform: translate(-50%, -50%);
            margin: auto;
            padding: 70px 50px 20px 50px;
        }


        nav ul {
            list-style-type: none;
            display: flex;
            justify-content: flex-start;     /* ??? */
            border: 1px solid black;
            color: white;
        }
        nav li {
            width: 150px;
            padding: 10px;
            text-align: center;
        }
        nav a {
            text-decoration: none;
            color: inherit;
            padding: 10px;                      /* !!!!!!! */
            transition: background-color 0.5s,
            font-size 0.5s;
        }
        nav a:hover {                          /* !!!!!!! */
            text-decoration: underline;
            background-color: #096b85;
            font-size: 1.2em;
        }
        nav a:active {                        /* !!!!!!! */
            text-decoration: underline;
            background-color: #850920;
        }

        .book-button{
            display: inline-block;
            border: 1px solid black;
            border-radius: 10px;
            padding: 10px;
            margin: 20px;
            font-size: 20px;
            font-weight: bold;
            font-family: monospace;
            text-decoration: none;
            color: black;

            background-color: lightgray;
            transition: box-shadow, transform, background-color;       /* !!!!!!!!!! */
            transition-duration: 0.1s;
            box-shadow: 0 5px 0 #817e7e;
        }
        .book-button:hover {
            background-color: #bdbdbd;
            transform: scale(1.05);                                   /* !!!!!!!!!! */
        }
        .book-button:active {
            background-color: #bdbdbd;
            box-shadow: 0 3px 0 #817e7e;                             /* 5px -> 3px + 2px*/
            transform: translateY(2px);                             /* !!!!!!!!!! */
        }

        .logo-text{
            font-family: Lucida Calligraphy;
            font-size: 34px;
            margin-top: 10px;
            text-shadow: 5px 5px 5px grey;
        }

        ul {
            margin: 0px;
            padding: 0px;
        }

        .footer-section {
            width: 650px;
            height: 450px;
            background: #151414;
            padding-bottom: 100px;
            position: absolute;
            top:130%;
            left: 28%;
            transform: translate(-50%, -50%);
            margin: auto;
            padding: 70px 50px 20px 50px;

        }



        .cta-text {
            padding-left: 15px;
            display: inline-block;
        }
        .cta-text h4 {
            color: #fff;
            font-size: 20px;
            font-weight: 600;
            margin-bottom: 2px;
        }
        .cta-text span {
            color: #757575;
            font-size: 15px;
        }

        .footer-social-icon span {
            color: #fff;
            display: block;
            font-size: 20px;
            font-weight: 700;
            font-family: 'Poppins', sans-serif;
            margin-bottom: 20px;
        }

        .copyright-area{
            background: #202020;
            padding: 25px 0;
        }
        .copyright-text p {
            margin: 0;
            font-size: 14px;
            color: #878787;
        }
        .copyright-text p a{
            color: #ff5e14;
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



        .submit{
            float: right;
            border: none;
            color: white;
            width: 110px;
            height: 35px;
            background: #ff6600;
            cursor: pointer;
        }

        .logo-text2{
            font-family: Lucida Calligraphy;
            font-size: 20px;
            margin-top: 10px;
            color: SkyBlue;
        }


    </style>
</head>
<body>
<header>
    <nav>
        <ul>
            <li><a href="Login.jsp">Login</a></li>
            <li><a href="NeedHelp.jsp">Need help?</a></li>
            <li><a href="AboutUs.html">About Us</a></li>
            <li><a href="Rooms.html">Rooms</a></li>
        </ul>
    </nav>
</header>
<div class="logo-text">Hotel Gourdo</div>

<div class="container">
    <div class="logo-text2">Send us your Message!</div>
    <form  method="post" autocomplete="on">
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
            <div class="fr">
                <textarea id="textarea" name="textarea"  rows="4" cols="30" placeholder="Direct communication with a hotel employee..."></textarea>
            </div>
            <div class="clr"></div>
            <div class="fr">
                <div class="box" style="margin-bottom:20px">
                    <input type="Submit" name="Submit" class="submit" value="Send">
                </div>
                <div class="clr"></div>
            </div></div>
    </form>
</div>

<%
    if (request.getParameter("Submit") != null) {
        String url = "jdbc:mysql://localhost:3306/hotel";
        String username= "gourdo13";
        String password= "kotronas13";

        Connection connection = null;
        PreparedStatement preparedStatement = null;

        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(url, username, password);

            String firstName = request.getParameter("firstName");
            String lastName = request.getParameter("lastName");
            String phoneNo = request.getParameter("phoneNo");
            String email = request.getParameter("email");
            String textarea = request.getParameter("textarea");

            String sql = "insert into Message (m_email, m_firstname, m_lastname, m_tel, message) values (?, ?, ?, ?, ?)";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, email);
            preparedStatement.setString(2, firstName);
            preparedStatement.setString(3, lastName);
            preparedStatement.setString(4, phoneNo);
            preparedStatement.setString(5, textarea);

            int count = preparedStatement.executeUpdate();
            if (count == 1) {
%>
<p class="message">Thanks for your message. An employee of the hotel will contact you shortly via email</p>
<%
} else {
%>
<p class="message">An error has occurred.</p>
<%
            }

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        } finally {
            try { preparedStatement.close(); } catch (Exception e) { }
            try { connection.close(); } catch (Exception e) { }
        }
    }
%>





<footer class="footer-section">
    <div class="row">
        <div class="cta-text">
            <h4>Find us</h4>
            <span>Kotronas,Mani</span>
        </div>
        <img src="pin.jpg" alt="Map Pin" style="width: 30px; height: auto;">
    </div>
    <div class="cta-text">
        <h4>Call us</h4>
        <span>210-3411321</span>
    </div>
    <img src="tel.jpg" alt="Tel" style="width: 30px; height: auto;">
    <div class="single-cta">
        <div class="cta-text">
            <h4>Mail us</h4>
            <span>hotelgourdo@gmail.com</span>
        </div>
        <img src="email.jpg" alt="Email" style="width: 30px; height: auto;">
    </div>

    <div class="footer-social-icon" style="margin-top: 20px;">
        <span>Follow us</span>
        <a href="#"><img src="facebook.jpg" alt="Facebook" style="width: 30px; height: auto; display: inline-block;"></a>
        <a href="#"><img src="instagram.jpg" alt="Instagram" style="width: 30px; height: auto;  display: inline-block; margin-left: 10px;"></a>
    </div>

    <div class="copyright-area">
        <div class="copyright-text">
            <p>&copy; 2023 Hotel Gourdo |  All Rights Reserved | Powered by D.Gourdo</p>
        </div>
    </div>

</footer>


</body>

</html>