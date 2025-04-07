<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="models.carModel" %>
<html>
<head>
    <title>Car List</title>
</head>
<body>
    <h2>Car Inventory</h2>

    <%
        // Retrieve the car list from the request attribute
        List<carModel> cars = (List<carModel>) request.getAttribute("carList");

        // Check if the car list is empty or null
        if (cars == null || cars.isEmpty()) {
    %>
        <p>No cars available in the inventory.</p>
    <%
        } else {
    %>
    <table border="1">
        <tr>
            <th>Name</th>
            <th>Description</th>
            <th>Quantity</th>
            <th>Price</th>
            <th>Brand</th>
            <th>Year</th>
            <th>Model</th>
        </tr>

        <% 
            // Loop through the car list and display each car's details
            for (carModel car : cars) {
        %>
        <tr>
            <td><%= car.getCarName() %></td>
            <td><%= car.getCarDescription() %></td>
            <td><%= car.getCarQuantity() %></td>
            <td><%= String.format("%.2f", car.getCarPrice()) %></td> <!-- Formatting the price to 2 decimal places -->
            <td><%= car.getCarBrand() %></td>
            <td><%= car.getCarYear() %></td>
            <td><%= car.getCarModel() %></td>
        </tr>
        <% 
            }
        %>
    </table>
    <% 
        }
    %>

</body>
</html>
