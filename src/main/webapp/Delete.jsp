<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Delete Employee</title>
    <link rel="stylesheet" href="Delete.css">
</head>
<body>
    <h2>Delete Employee</h2>
    <form action="Delete" method="POST">
        <label for="employeeId">Enter Employee ID to Delete:</label>
        <input type="text" id="employeeId" name="id" required>
        <button type="submit" class="confirm-btn">Delete</button>
        <a href="View.jsp" class="cancel-btn">Cancel</a>
    </form>
</body>
</html>
