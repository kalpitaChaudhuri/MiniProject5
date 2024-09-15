<%@page import="java.util.List"%>
<%@ page import="my.Employees" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>
<style>
body {
	font-family: Montserrat, sans-serif;
	font-size: 16px;
	font-weight: 400;
	line-height: 1.5;
	background-image:
		url('https://www.shutterstock.com/image-photo/top-view-wood-office-desk-260nw-1686005722.jpg');
	background-size: cover;
	background-position: center;
	background-repeat: no-repeat;
	background-attachment: fixed;
	height: 100vh;
	width: 100vw;
	overflow: hidden;
	transition: background 0.5s ease-in-out;
}

table {
	background-color: #FFFAE5;
	border: 1px solid #FFC499;
	border-collapse: collapse;
	width: 60%;
	box-shadow: 0 10px 20px rgba(0, 0, 0, 0.3);
	overflow: hidden;
	margin-bottom: 20px;
	margin-left: auto;
    margin-right: auto;
}

th, td {
	padding: 15px;
	text-align: left;
	border: 1px solid #ddd;
}

th {
	background-color: #FF9933;
	color: #ffffff;
}

tr:nth-child(even) {
	background-color: #ffffff;
}

tr:hover {
   background-color: #FFD699;
}

tr:nth-child(odd) {
	background-color: #FFE5B4;
}

caption {
	font-size: 20px;
	margin: 10px;
	color: #FF6600;
	text-shadow: 
        1px 1px 0 #808080, 
        -1px -1px 0 #FF6600,  
        1px -1px 0 #FFC499, 
        -1px 1px 0 #FF6600;
}

.icon-button {
    background: none;
    border: none;
    cursor: pointer;
    padding: 0;
    margin: 0;
}

.icon-button i {
    font-size: 20px; /* Adjust size as needed */
    color: #FF9900; /* Color of the icon */
    vertical-align: middle;
}

.delete-btn {
	width: 200px; 
    height: 50px;
    background-color: #FF9900;
    color: #fff;
    border: none;
    font-family: 'Pacifico';
    font-weight: 700;
    font-size: 16px;
    border-radius: 10px;
    cursor: pointer;
    margin: 20px auto; 
    display: block;
    text-align: center; 
    line-height: 50px; 
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2); 
    transition: background-color 0.3s ease, box-shadow 0.3s ease;
    text-decoration: none;
}

.delete-btn:hover {
	background-color: #e68a00;
    box-shadow: 0 6px 12px rgba(0, 0, 0, 0.3);
}
</style>
</head>
<body>
<div>
	<table>
		<caption>
			<b>Employee Details</b>
		</caption>
		<tr>
			<th>Id</th>
			<th>Name</th>
			<th>Age</th>
			<th>Email</th>
			<th>Salary</th>
			<th>Department</th>
			<th></th>
		</tr>
		  <%
		  List<Employees> employeeList = (List<Employees>)request.getAttribute("employeeList");

		              if (employeeList != null) {
		                  for (Employees emp : employeeList) {
		  %>
        <tr>
            <td><%= emp.getId() %></td>
            <td><%= emp.getName() %></td>
            <td><%= emp.getAge() %></td>
            <td><%= emp.getEmail() %></td>
            <td><%= emp.getSalary() %></td>
            <td><%= emp.getDepartment() %></td>
            <td><button class="icon-button"><i class="fa-regular fa-pen-to-square"></i></button></td>
        </tr>
       <%
                }
            } else {
        %>
        <tr>
            <td colspan="6">No employee details available</td>
        </tr>
        <%
            }
        %>
	</table>
	<a href="" class="delete-btn">Delete Employee</a>
	</div>
</body>
</html>