<%@ page import="java.sql.*"%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Book Now Page</title>
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
            background-color: #FAEBD7;
            margin: 20px;
            text-align:center
        }

        nav {
            background-image: linear-gradient(to bottom,MediumSlateBlue, #0ca0e7);
        }

        .container{
            background: #2d3e3f;
            width: 500px;
            height: 500px;
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
            height: 45px;
            margin-top: 10px;
            font-family: verdana;
            font-size: 12px;
        }

        .box2{
            width: 360px;
            height: 35px;
            margin-top: 10px;
            font-family: verdana;
            font-size: 14px;
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



        .submit{
            float: right;
            border: none;
            color: white;
            width: 150px;
            height: 35px;
            background: black;
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

        select{
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            background-color: #f5f5f5;
            font-size: 14px;
            color: #333;
            cursor: pointer;
        }

        select:hover,select:active{
            background-color: #e0e0e0;
            border-color: #aaa
        }

    </style>
</head>
<body>



<div class="container">
    <div class="logo-text">Hotel Gourdo</div>
    <div class="logo-text2">-Book Now Form-</div>
    <form method="post" autocomplete="on">
        <div class="box">
            <label  class="fl fontLabel"> Arrival: </label>
            <div class="fr">
                <input type="date" name="Arrival"  class="textBox" autofocus="on" required>
            </div>
            <div class="clr"></div>
        </div>
        <div class="box">
            <label  class="fl fontLabel"> Departure: </label>
            <div class="fr">
                <input type="date" name="Departure" class="textBox" autofocus="on" required>
            </div>
            <div class="clr"></div>
        </div>
        <div class="box">
            <label class="fl fontLabel"> No. of Rooms: </label>
            <div class="fr">
                <select name="Rooms" id="Rooms">
                    <option value="one">1</option>
                    <option value="two">2</option>
                    <option value="three">3</option>
                </select>
                <br><br>
            </div>
            <div class="clr"></div>
        </div>
        <div class="box">
            <label class="fl fontLabel"> No. of Guests: </label>
            <div class="fr">
                <select name="Guests" id="Guests">
                    <option value="two">2</option>
                    <option value="three">3</option>
                    <option value="four">4</option>
                </select>
                <br><br>
            </div>
            <div class="clr"></div>
        </div>
        <div class="box" style="background: #2d3e3f">
            <input type="Submit" name="seeAv" class="submit" value="See Availability">
        </div>
        <div class="box2" style="background: #2d3e3f">
            <input type="Submit" name="modRes"  class="submit" value="Modify Reservation" formaction="PaymentPage.jsp">
        </div>

        <%
            if (request.getParameter("seeAv") != null) {
                String url= "jdbc:mysql://localhost:3306/hotel";
                String username= "gourdo13";
                String password= "kotronas13";

                Connection connection = null;
                PreparedStatement preparedStatement = null;
                ResultSet resultSet = null;

                try{
                    Class.forName("com.mysql.jdbc.Driver");
                    connection = DriverManager.getConnection(url, username, password);

                    String capacity=request.getParameter("Guests");
                    String arrival=request.getParameter("Arrival");
                    String departure=request.getParameter("Departure");
                    String rooms=request.getParameter("Rooms");

                    String sql="select count(Rooms.r_id) from Rooms,Booking where Rooms=s.r_id=Booking.r_id and Rooms.capacity=? and Booking.arrival=? and Booking.departure=?";
                    preparedStatement = connection.prepareStatement(sql);
                    preparedStatement.setString(1, capacity);
                    preparedStatement.setString(2, arrival);
                    preparedStatement.setString(3, departure);
                    resultSet=preparedStatement.executeQuery();

                    int availableRooms=0; // Αρχικοποίηση της μεταβλητής που θα κρατήσει το αποτέλεσμα του query

                    if (resultSet.next()) {
                        availableRooms=resultSet.getInt(1); // Λήψη του αποτελέσματος από το ResultSet
                    }

                    int requestedRooms=Integer.parseInt(rooms); // Μετατροπή του String σε ακέραιο

                    if (requestedRooms>=availableRooms) {
        %>
        <script>
            alert("Press Modify Reservation button to complete the booking.");
        </script>
        <%
            }
        %>

        } else {
        %>
        <p class="message">Unfortunately,the room(s) that you prefer are full,for this specific time.</p>
        <%

                } catch (Exception e) {
                    e.printStackTrace();
                } finally {

                    try { resultSet.close(); } catch (Exception e) { }
                    try { preparedStatement.close(); } catch (Exception e) { }
                    try { connection.close(); } catch (Exception e) { }
                }
            }
        %>


        <%
            if (request.getParameter("modRes") != null) {
                String url = "jdbc:mysql://localhost:3306/hotel";
                String username = "gourdo13";
                String password = "kotronas13";

                Connection connection = null;
                PreparedStatement preparedStatement = null;

                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    connection = DriverManager.getConnection(url, username, password);

                    String capacity = request.getParameter("Guests");
                    String arrival = request.getParameter("Arrival");
                    String departure = request.getParameter("Departure");
                    String rooms = request.getParameter("Rooms");

                    String sql2 = "select c_id from Client where email=?";
                    preparedStatement = connection.prepareStatement(sql2);
                    preparedStatement.setString(1, (String) session.getAttribute("userEmail"));
                    ResultSet resultSet = preparedStatement.executeQuery();

                    int c_id = 0;
                    if (resultSet.next()) {
                        c_id = resultSet.getInt("c_id");
                    }

                    String sql3 = "select r_id from Rooms where availability='yes' and capacity=?";
                    preparedStatement = connection.prepareStatement(sql3);
                    preparedStatement.setString(1, capacity);
                    resultSet = preparedStatement.executeQuery();

                    // Loop through the available rooms and insert into Booking
                    while (resultSet.next()) {
                        int r_id = resultSet.getInt("r_id");
                        String insertSql = "insert into Booking(c_id, r_id, arrival, departure) values (?, ?, ?, ?)";
                        preparedStatement = connection.prepareStatement(insertSql);
                        preparedStatement.setInt(1, c_id);
                        preparedStatement.setInt(2, r_id);
                        preparedStatement.setString(3, arrival);
                        preparedStatement.setString(4, departure);
                        preparedStatement.executeUpdate();
                    }
        %>
        <p class="message">Successful Booking!</p>
        <%
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        %>
        <p class="message">An error has occurred.</p>
        <%
                } finally {
                    try {
                        if (preparedStatement != null) {
                            preparedStatement.close();
                        }
                        if (connection != null) {
                            connection.close();
                        }
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
            }
        %>




    </form>
</div>
</body>
</html>