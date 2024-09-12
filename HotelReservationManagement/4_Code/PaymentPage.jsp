<%@ page import="java.sql.*"%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>


<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Payment Page</title>
    <style>
        body {
            background-color: #FAEBD7;
            font-family: sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            align-items: center;
            justify-content: center;
            min-height: 100vh;
        }

        .container {
            background-color: #2d3e3f;
            width: 500px;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            color: white;
        }

        .logo-text {
            font-family: 'Lucida Calligraphy', cursive;
            font-size: 28px;
            margin-bottom: 10px;
            color: white;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.3);
        }

        .logo-text2 {
            font-family: 'Lucida Calligraphy', cursive;
            font-size: 20px;
            margin-bottom: 20px;
            color: lightblue;
        }

        .radio-container {
            display: flex;
            justify-content: space-around;
            align-items: center;
            margin-bottom: 20px;
        }

        .radio-label {
            cursor: pointer;
        }

        .form-container {
            display: none;
            background-color: #4e5f60;
            padding: 20px;
            border-radius: 8px;
        }

        .radio:checked + .form-container {
            display: block;
        }

        .form-container h2 {
            font-size: 18px;
            margin-bottom: 10px;
            color: black;
        }

        .form-container label {
            display: block;
            margin-bottom: 10px;
            color: white;
        }

        .form-container input {
            display: block;
            margin-bottom: 10px;
            font-family: 'Times New Roman', cursive;
            font-size: 18px;
            color: black;
        }

        .submit {
            width: 100%;
            background-color: #328f8a;
            color: white;
            font-weight: bold;
            border: none;
            padding: 10px;
            cursor: pointer;
        }

        input[type="checkbox"] {
            transform: scale(1.5);
        }

        .depo{
            background-color: lightgrey;
            font-family: 'Times New Roman', cursive;
            color: black;
            width: 410px;
            height: auto;
            font-weight: bold;
            display: block;
            white-space: normal;
            word-wrap: break-word;
        }

        .depo2{
            background-color: lightgrey;
            font-family: 'Times New Roman', cursive;
            color: black;
            width: 200px;
            height: auto;
            font-weight: bold;
            display: block;
            white-space: normal;
            word-wrap: break-word;
        }

    </style>
</head>
<body>

<div class="container">
    <div class="logo-text">Hotel Gourdo</div>
    <div class="logo-text2">Payment Page</div>
    <form method="post" autocomplete="on">
        <div class="radio-container">
            <label class="radio-label">
                <input type="radio" class="radio paymentType" name="paymentType" value="credit" required>
                Credit Card
            </label>
            <label class="radio-label">
                <input type="radio" class="radio paymentType" name="paymentType" value="cash" required>
                Pay in Cash
            </label>
        </div>
        <div class="form-container" id="creditForm">
            <h2>Credit Card Payment</h2>
            <label for="creditNumber">Credit Card Number:</label>
            <input type="text" id="creditNumber" name="creditNumber" minlength="16" maxlength="16" pattern="[0-9]+" required>
            <label for="creditNumber">Name on Credit Card:</label>
            <input type="text" id="creditName" name="creditName" maxlength="30" required>
            <label for="expiryDate">Expiry Date:</label>
            <input type="month" id="expiryDate" name="expiryDate" required>
            <label for="cvv">CVV:</label>
            <input type="text" id="cvv" name="cvv" minlength="3" maxlength="3" pattern="[0-9]+" required>
            <input type="text" class="depo2" id="dep" name="dep" value="Deposit: 50&euro;" required disabled>

            <input type="submit" class="submit" name="paynow" value="Pay Now">
        </div>

        <%
            if (request.getParameter("paynow") != null) {
                String url= "jdbc:mysql://localhost:3306/hotel";
                String username= "gourdo13";
                String password= "kotronas13";

                Connection connection;
                Statement dbStmt = null;

                try{
                    try {
                        Class.forName("com.mysql.jdbc.Driver");
                    } catch (ClassNotFoundException e) {
                        throw new RuntimeException(e);
                    }
                    connection = DriverManager.getConnection(url, username, password);

                    String creditNumber=request.getParameter("creditNumber");
                    String creditName=request.getParameter("creditName");
                    String expiryDate=request.getParameter("expiryDate");
                    String cvv=request.getParameter("cvv");

                    String sql="insert into Card(number,name,month_year,CVV)"
                            +"values ('"+creditNumber+"','"+creditName+"','"+expiryDate+"','"+cvv+"')";


                    int count=dbStmt.executeUpdate(sql);
                    if(count==1) {
        %>
        <p class="message">Successful Payment!.</p>
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


        <div class="form-container" id="cashForm">
            <h2>Pay in Cash</h2>
            <label for="firstname">First Name:</label>
            <input type="text" id="firstname" name="firstName" maxlength="20" required>
            <label for="lastname">Last Name:</label>
            <input type="text" id="lastname" name="lastname" maxlength="20" required>
            <input type="text" class="depo" id="depo" name="depo" value="Advance deposit (50&euro;) to the following bank account:" required disabled>
            <input type="text" class="depo" id="depo2" name="depo2" value="E123 WERT OKOK 1313 4589 100P" required disabled>


            <p>*In case of non-payment of the advance payment within 5 working days, the reservation is cancelled.</p>
            <p>**Sending proof of advance payment by email.</p>
            <input type="submit" class="submit" name="temppay" value="Pay in cash at check-in time">
        </div>

        <%
            if (request.getParameter("temppay") != null) {
                String url= "jdbc:mysql://localhost:3306/hotel";
                String username= "gourdo13";
                String password= "kotronas13";

                Connection connection;
                Statement dbStmt = null;

                try{
                    try {
                        Class.forName("com.mysql.jdbc.Driver");
                    } catch (ClassNotFoundException e) {
                        throw new RuntimeException(e);
                    }
                    connection = DriverManager.getConnection(url, username, password);

                    String firstname=request.getParameter("firstname");
                    String lastname=request.getParameter("lastname");

                    String sql="insert into TemporaryPayment(firstname,lastname)"
                            +"values ('"+firstname+"','"+lastname+"')";

                    int count=dbStmt.executeUpdate(sql);
                    if(count==1) {
        %>
        <p class="message">Successful Temporary Payment!.</p>
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


    </form>
</div>

<script>
    const paymentTypeRadios = document.querySelectorAll('.paymentType');
    const creditForm = document.getElementById('creditForm');
    const cashForm = document.getElementById('cashForm');

    paymentTypeRadios.forEach(radio => {
        radio.addEventListener('change', () => {
            if (radio.value === 'credit') {
                creditForm.style.display = 'block';
                cashForm.style.display = 'none';
            } else if (radio.value === 'cash') {
                cashForm.style.display = 'block';
                creditForm.style.display = 'none';
            }
        });
    });
</script>

</body>
</html>