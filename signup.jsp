<!DOCTYPE html>
<html>
  <head>
    <title>Signup - MediCare</title>

    <script src="https://cdn.tailwindcss.com"></script>

    <style>
      body {
        font-family: "Segoe UI", sans-serif;
        background: #f3f4f6;
      }

      /* Card */
      .card {
        width: 500px;
        margin: 40px auto;
        background: white;
        padding: 30px;
        border-radius: 12px;
        box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
      }

      .signup-form {
        width: 600px;
        margin: 40px auto;
        background: white;
        padding: 25px;
        border-radius: 12px;
        box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
        font-family: "Segoe UI", sans-serif;
      }

      .form-table {
        width: 100%;
        border-collapse: collapse;
      }

      .form-table td {
        padding: 10px;
      }

      .label {
        font-weight: bold;
        width: 40%;
        color: #333;
      }

      input {
        width: 90%;
        padding: 30px;
        border-radius: 6px;
        border: 1px solid #ccc;
        outline: none;
      }
      select {
        width: 90%;
        padding: 30px;
        border-radius: 6px;
        border: 1px solid #ccc;
        outline: none;
      }

      input:focus,
      select:focus {
        border-color: #3b82f6;
        box-shadow: 0 0 5px rgba(59, 130, 246, 0.3);
      }

      .btn-row {
        text-align: center;
        padding-top: 15px;
      }

      .submit-btn {
        background: #3b82f6;
        color: white;
        padding: 10px 20px;
        border: none;
        margin-right: 10px;
        border-radius: 8px;
        cursor: pointer;
      }

      .reset-btn {
        background: #ef4444;
        color: white;
        padding: 10px 20px;
        border: none;
        border-radius: 8px;
        cursor: pointer;
      }

      .submit-btn:hover {
        background: #2563eb;
      }

      .reset-btn:hover {
        background: #dc2626;
      }

      /* Message */
      #msg {
        font-size: 13px;
        margin-top: -5px;
      }
    </style>
  </head>

  <body>
    <jsp:include page="navbar.jsp" />

    <form action="signup1.jsp" method="get" class="signup-form" onsubmit="return validateForm()">
      <h2 class="text-xl font-bold mb-4 text-center">Customer Signup</h2>

      <table class="form-table">
        <tr>
          <td class="label">Username</td>
          <td>
            <input
              type="text"
              name="logname"
              id="username"
              placeholder="Enter Mail ID" 
              required
              onblur="checkUser()"
            />
            <div id="msg"></div>
          </td>
        </tr>

        <tr>
          <td class="label">Role</td>
          <td>
            <input type="text" name="role" value="customer" readonly />
          </td>
        </tr>

        <tr>
          <td class="label">Name</td>
          <td><input type="text" name="name" required /></td>
        </tr>

        <tr>
          <td class="label">Phone</td>
          <td><input type="text" name="phone" required /></td>
        </tr>

        <tr>
          <td class="label">Date of Birth</td>
          <td><input type="date" name="dob" required /></td>
        </tr>

        <tr>
          <td class="label">Gender</td>
          <td>
            <select name="gender">
              <option>Male</option>
              <option>Female</option>
              <option>Other</option>
            </select>
          </td>
        </tr>

        <tr>
          <td class="label">Marital Status</td>
          <td>
            <select name="mstatus">
              <option>Single</option>
              <option>Married</option>
            </select>
          </td>
        </tr>

        <tr>
          <td class="label">Security Question</td>
          <td>
            <select name="security_question">
              <option value="">-- Select Security Question --</option>

              <option value="Who is my favourite actor ?">
                Who is my favourite actor?
              </option>

              <option value="Where is my birth place ?">
                Where is my birth place?
              </option>

              <option value="What is my pet name ?">
                What is my pet name?
              </option>

              <option value="What is my best friend ?">
                What is my best friend?
              </option>

              <option value="Who is your ideal person ?">
                Who is your ideal person?
              </option>

              <option value="What is my fist school name ?">
                What is my first school name?
              </option>
            </select>
          </td>
        </tr>

        <tr>
          <td class="label">Security Answer</td>
          <td><input type="text" name="security_answer" required /></td>
        </tr>

        <tr>
          <td class="label">Password</td>
          <td><input type="password" name="password" required /></td>
        </tr>

        <tr>
          <td class="label">Confirm Password</td>
          <td><input type="password" name="cpassword" required /></td>
        </tr>

        <tr>
          <td colspan="2" class="btn-row">
            <button type="submit" id="submit" class="submit-btn">Submit</button>
            <button type="reset" class="reset-btn">Reset</button>
          </td>
        </tr>
      </table>
    </form>

    <jsp:include page="ofooter.jsp" />

    <!-- Username availability check -->
    <script>
      function checkUser() {
        let username = document.getElementById("username").value;

        if (username.length === 0) return;

        let xhr = new XMLHttpRequest();
        xhr.open("GET", "CheckUser?username=" + username, true);

        xhr.onload = function () {
          if (xhr.responseText.trim() === "exists") {
            document.getElementById("msg").innerHTML =
              "<span style='color:red'>Username not available </span>";
            document.getElementById("submit").disabled=true;
          } else {
            document.getElementById("msg").innerHTML =
              "<span style='color:green'>Username available</span>";
            document.getElementById("submit").disabled=false;
          }
        };

        xhr.send();
      }
    </script>
    <script>
function validateForm() {

    let username = document.getElementById("username").value.trim();
    let phone = document.getElementsByName("phone")[0].value.trim();
    let password = document.getElementsByName("password")[0].value;
    let cpassword = document.getElementsByName("cpassword")[0].value;
    let securityQ = document.getElementsByName("security_question")[0].value;

    // USERNAME VALIDATION
    if(username.length < 4){
        alert("Username must be at least 4 characters long");
        return false;
    }

    // PHONE VALIDATION (10 digits)
    let phonePattern = /^[0-9]{10}$/;
    if(!phonePattern.test(phone)){
        alert("Enter valid 10-digit phone number");
        return false;
    }

    // SECURITY QUESTION
    if(securityQ === ""){
        alert("Please select a security question");
        return false;
    }

    // PASSWORD LENGTH
    if(password.length < 6){
        alert("Password must be at least 6 characters");
        return false;
    }

    // PASSWORD STRENGTH (optional but good)
    let strongPass = /^(?=.*[A-Za-z])(?=.*\d).{6,}$/;
    if(!strongPass.test(password)){
        alert("Password must contain letters and numbers");
        return false;
    }

    // PASSWORD MATCH
    if(password !== cpassword){
        alert("Passwords do not match");
        return false;
    }

    return true;
}
</script>
  </body>
</html>
