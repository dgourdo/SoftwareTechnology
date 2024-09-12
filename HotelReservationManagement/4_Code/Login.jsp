<%@ page import="java.sql.*"%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>


<!DOCTYPE html><html>
<head>
    <meta charset="UTF-8">
    <title>Login Page</title>
    <style>
        * {
            box-sizing: border-box;
        }

        body {
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
  background: #151414;
  position: relative;
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

.login-page {
  width: 360px;
  padding: 8% 0 0;
  margin: auto;
}

.login-page .form .login{
  margin-top: -31px;
margin-bottom: 26px;
}

.form {
  position: relative;
  z-index: 1;
  background: #FFFFFF;
  max-width: 360px;
  margin: 0 auto 100px;
  padding: 45px;
  text-align: center;
  box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
  background-color: LightSteelBlue;
  font-family: "Roboto", sans-serif;
}

.form input {
  font-family: "Roboto", sans-serif;
  outline: 0;
  background: #f2f2f2;
  width: 100%;
  border: 0;
  margin: 0 0 15px;
  padding: 15px;
  box-sizing: border-box;
  font-size: 14px;
}
.form button {
  font-family: "Roboto", sans-serif;
  text-transform: uppercase;
  outline: 0;
  background-color: #328f8a;
  background-image: linear-gradient(45deg,#328f8a,#08ac4b);
  width: 100%;
  border: 0;
  padding: 15px;
  color: #FFFFFF;
  font-size: 14px;
  cursor: pointer;
}
.form .message {
  margin: 15px 0 0;
  color: black;
  font-size: 14px;
}
.form .message a {
  color: Navy;
  text-decoration: none;
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

<div class="login-page">
    <div class="form">
        <div class="login">
            <div class="login-header">
                <h3>LOGIN</h3>
                <p>Please enter your credentials to login.</p>
            </div>
        </div>



<form class="login-form" action="Login.jsp" method="get">
    <input type="text" placeholder="email"  name="email" /><br>
    <input type="password" placeholder="password" name="password" value="" minlength=8 maxlength="12"/><br>
    <button name="loginButton">Login</button>
    <p class="message">Not registered?
        <a href="SignUp.jsp">Create an account</a></p>
</form>


<%
    if (request.getParameter("loginButton") != null) {
        String url= "jdbc:mysql://localhost:3306/hotel";
        String username= "gourdo13";
        String password= "kotronas13";

        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        try{
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(url, username, password);

            String userEmail=request.getParameter("email");
            String userPassword=request.getParameter("password");

            String sql="Select * from Client where email=? and password=?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, userEmail);
            preparedStatement.setString(2, userPassword);
            resultSet = preparedStatement.executeQuery();

            if(resultSet.next()){
                String clientFirstName = resultSet.getString("firstname");
                String clientLastName = resultSet.getString("lastname");
                session.setAttribute("userEmail",userEmail);//χρειαζεται σε αλλες jsp σελιδες
    %>
            <p class="message">Welcome to Hotel Gourdo!.</p>
            <%
            } else {
            %>
            <p class="message">Invalid credentials. Please try again.</p>
            <%
                }

                    } catch (ClassNotFoundException | SQLException e) {
                        e.printStackTrace();
                    } finally {

                    try { resultSet.close(); } catch (Exception e) { }
                    try { preparedStatement.close(); } catch (Exception e) { }
                    try { connection.close(); } catch (Exception e) { }
                    }
                }
            %>

    </div>
</div>
<footer class="footer-section">
<div class="container">
    <div class="row">
        <div class="cta-text">
            <h4>Find us</h4>
            <span>Kotronas,Mani</span>
        </div>
        <img src="pin.jpg" alt="Map Pin" style="width: 30px; height: auto;">
    </div>
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
    <div class="container">
        <div class="row">
            <div class="copyright-text">
                <p>&copy; 2023 Hotel Gourdo |  All Rights Reserved | Powered by D.Gourdo</p>
            </div>
        </div>
    </div>
</div>
</footer>

<script>
        function markVisitedLoginPage(){
            localStorage.setItem('visitedLoginPage','true');
        }
</script>


<script>
     markVisitedLoginPage();
</script>



</body></html>