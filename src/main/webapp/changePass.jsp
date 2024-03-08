<%-- 
    Document   : changePass
    Created on : Feb 29, 2024, 10:49:41 AM
    Author     : Tran Duy Dat - CE172036
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>


        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <style>
            /* Reset some default styles */
            body, html {
                margin: 0;
                padding: 0;
                font-family: Arial, sans-serif;
            }

            form {
                max-width: 400px;
                margin: 20px auto;
                padding: 20px;
                border: 1px solid #ccc;
                border-radius: 5px;
                background-color: #f9f9f9;
            }

            div {
                margin-bottom: 15px;
            }

            label {
                display: block;
                font-weight: bold;
                margin-bottom: 5px;
            }

            input[type="password"] {
                width: 100%;
                padding: 10px;
                border-radius: 3px;
                border: 1px solid #ccc;
                box-sizing: border-box; /* Ensure padding and border are included in width */
            }

            button {
                display: block;
                width: 100%;
                padding: 10px;
                border: none;
                border-radius: 3px;
                background-color: #007bff;
                color: #fff;
                cursor: pointer;
            }

            button:hover {
                background-color: #0056b3;
            }

            .error {
                color: red;
                font-size: 14px;
                margin-top: 5px;
            }
            .h2{
                text-align: center;
            }
        </style>
    </head>
    <body>
        <h2  class="h2">Change Password</h2>


        <form action="/ChangePassController" method="post" onsubmit="return validate()">
            <!--            <div>
                            <label for="new_password">Old Password:</label>
                            <input type="password" id="old_password" name="old_password" value="" required>
                        </div>-->
            <div>
                <label for="new_password">New Password:</label>
                <input type="password" id="new_password" name="new_password" required>
            </div>
            <div>
                <label for="confirm_password">Confirm New Password:</label>
                <input type="password" id="confirm_password" name="confirm_password" required>
            </div>
            <button type="submit" name="btn_submit" value="submit">Change Password</button>
            <%
                String samePass = (String) request.getSession().getAttribute("samepass");
                if (samePass != null) {
            %>
            <small>           <%= samePass%>    </small>
            <%
                    request.getSession().removeAttribute("samepass");
                }
            %>
        </form>
        <script>
            function validate() {
                //   var oldPassword = document.getElementById("old_password").value;
                var newPassword = document.getElementById("new_password").value;
                var confirmPassword = document.getElementById("confirm_password").value;
//                if (oldPassword === newPassword) {
//                    // Mật khẩu cũ giống với mật khẩu mới
//                    alert("Mật khẩu mới không được giống với mật khẩu cũ. Vui lòng chọn mật khẩu khác.");
//                    return false;
//                } 
                else if (newPassword === confirmPassword) {
                    // Hai mật khẩu khớp nhau
                    alert("Update thành công");
                    return true;
                } else {
                    // Hai mật khẩu không khớp nhau
                    alert("Mật khẩu mới và xác nhận mật khẩu mới không khớp. Vui lòng kiểm tra lại.");
                    return false;
                }
            }

        </script>
    </body>
</html>


