<%@ page import="java.sql.*" %> <%@ include file="dbcon.jsp"%>

<!DOCTYPE html>
<html>
  <head>
    <title>Add Employee - MediCare</title>

    <script src="https://cdn.tailwindcss.com"></script>

    <style>
      body {
        font-family: "Segoe UI", sans-serif;
        background: #f3f4f6;
      }

      /* Form Card */
      .form-card {
        width: 850px;
        margin: 40px auto;
        margin-left:300px;
        background: white;
        padding: 30px;
        border-radius: 12px;
        box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
      }

      /* Table */
      .form-table {
        width: 100%;
      }

      .form-table td {
        padding: 10px;
      }

      /* Labels */
      .label {
        font-weight: bold;
        width: 40%;
        color: #333;
      }

      /* Inputs */
      input,
      select {
        width: 100%;
        padding: 10px;
        border-radius: 6px;
        border: 1px solid #ccc;
      }

      input:focus,
      select:focus {
        border-color: #3b82f6;
        box-shadow: 0 0 5px rgba(59, 130, 246, 0.3);
      }

      /* Buttons */
      .btn-row {
        text-align: center;
        padding-top: 15px;
      }

      .submit-btn {
        background: #3b82f6;
        color: white;
        padding: 10px 20px;
        border: none;
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
    </style>
  </head>

  <body>
    <jsp:include page="navbar.jsp" />
    <jsp:include page="adminmenu.jsp" />

    <form action="create_employee1.jsp" method="post" class="form-card" onsubmit="return validateEmployeeForm()">
      <div style="display:flex; justify-content:space-between; align-items:center; margin-bottom:15px;">

    <h2 class="text-xl font-bold">
        <i class="fas fa-user-plus" style="color:#193a81;"></i> Add New Employee
    </h2>

    <a href="view_employee.jsp" 
       style="background:#0d825b;
    font-weight: bold; color:white; padding:8px 15px; border-radius:6px; text-decoration:none;">
        <i class="fas fa-users"></i> View Employees
    </a>

</div>

      <table class="form-table">
        <tr>
          <td class="label">Name</td>
          <td><input type="text" name="name" required /></td>
        </tr>

        <tr>
          <td class="label">Father Name</td>
          <td><input type="text" name="fname" required /></td>
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
          <td class="label">Phone</td>
          <td><input type="text" name="phone" required /></td>
        </tr>

        <tr>
          <td class="label">Email</td>
          <td><input type="email" name="mail" required /></td>
        </tr>

        <tr>
          <td class="label">Current Address</td>
          <td><input type="text" name="cadd" required /></td>
        </tr>

        <tr>
          <td class="label">Permanent Address</td>
          <td><input type="text" name="padd" required /></td>
        </tr>

        <tr>
          <td class="label">Qualification</td>
          <td><input type="text" name="qual" required /></td>
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
          <td><input type="text" name="secans" required /></td>
        </tr>

        <tr>
          <td class="label">Password</td>
          <td><input type="password" name="pwd" required /></td>
        </tr>

        <tr>
          <td class="label">Confirm Password</td>
          <td><input type="password" name="cpwd" required /></td>
        </tr>

        <tr>
          <td colspan="2" class="btn-row">
            <button type="submit" class="submit-btn">
              <i class="fas fa-save"></i> Submit
            </button>
            <button type="reset" class="reset-btn">Reset</button>
          </td>
        </tr>
      </table>
    </form>

    <jsp:include page="footer.jsp" />

    <script>
function validateEmployeeForm() {

    let name = document.getElementsByName("name")[0].value.trim();
    let fname = document.getElementsByName("fname")[0].value.trim();
    let phone = document.getElementsByName("phone")[0].value.trim();
    let email = document.getElementsByName("mail")[0].value.trim();
    let securityQ = document.getElementsByName("security_question")[0].value;
    let secAns = document.getElementsByName("secans")[0].value.trim();
    let pwd = document.getElementsByName("pwd")[0].value;
    let cpwd = document.getElementsByName("cpwd")[0].value;

    // NAME VALIDATION
    if(name.length < 3){
        alert("Name must be at least 3 characters");
        return false;
    }

    // FATHER NAME
    if(fname.length < 3){
        alert("Father name must be at least 3 characters");
        return false;
    }

    // PHONE VALIDATION (10 digits)
    let phonePattern = /^[0-9]{10}$/;
    if(!phonePattern.test(phone)){
        alert("Enter valid 10-digit phone number");
        return false;
    }

    // EMAIL VALIDATION
    let emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    if(!emailPattern.test(email)){
        alert("Enter valid email address");
        return false;
    }

    // SECURITY QUESTION
    if(securityQ === ""){
        alert("Please select a security question");
        return false;
    }

    // SECURITY ANSWER
    if(secAns.length < 2){
        alert("Security answer is too short");
        return false;
    }

    // PASSWORD LENGTH
    if(pwd.length < 6){
        alert("Password must be at least 6 characters");
        return false;
    }

    // PASSWORD STRENGTH
    let strongPass = /^(?=.*[A-Za-z])(?=.*\d).{6,}$/;
    if(!strongPass.test(pwd)){
        alert("Password must contain letters and numbers");
        return false;
    }

    // PASSWORD MATCH
    if(pwd !== cpwd){
        alert("Passwords do not match");
        return false;
    }

    return true;
}
</script>
  </body>
</html>
