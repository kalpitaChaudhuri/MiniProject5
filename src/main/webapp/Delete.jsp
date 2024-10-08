<!DOCTYPE html>
<html>
<head>
  <title>Delete Employee</title>
  <link rel="stylesheet" href="Delete.css">
  <script>
    function confirmDelete(event) {
      event.preventDefault();
      const confirmed = confirm("Are you sure you want to delete this employee?");
      if (confirmed) {
        document.getElementById("delete-form").submit();
      }
    }
  </script>
</head>
<body>
  <div class="delete-wrapper">
    <div class="delete-header">
      <h1>Delete Employee</h1>
    </div>
    <form action="delete">
      <div class="input-container">
        <label for="employeeId">Enter Employee ID:</label>
        <input type="text" id="employeeId" name="employeeId" required>
      </div>
      <div class="button-container">
      <button type="submit" class="btn" onclick="confirmDelete(event)">Delete</button>
      <a href="View" class="btn">Back</a>
    </div>
    </form>
  </div>
</body>
</html>

