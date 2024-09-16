<!DOCTYPE html>
<html>
<head>
  <title>Delete Employee</title>
  <link rel="stylesheet" href="Delete.css">
  <script>
    function confirmDelete(event) {
      event.preventDefault(); // Prevent the form from submitting immediately
      const confirmed = confirm("Are you sure you want to delete this employee?");
      if (confirmed) {
        document.getElementById("delete-form").submit(); // Submit the form if confirmed
      }
    }
  </script>
</head>
<body>
  <div class="delete-wrapper">
    <div class="delete-header">
      <h1>Delete Employee</h1>
    </div>
    <form action="Delete" method="post">
      <div class="input-container">
        <label for="employeeId">Enter Employee ID:</label>
        <input type="text" id="employeeId" name="employeeId" required>
      </div>
      <button type="submit" class="btn" onclick="confirmDelete(event)">Delete</button>
    </form>
    <a href="View.jsp" class="btn">Back</a>
  </div>
</body>
</html>

