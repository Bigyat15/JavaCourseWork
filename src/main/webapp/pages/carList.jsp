<%@ page import="java.util.ArrayList" %>
<%@ page import="models.carModel" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>All Cars</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <script src="https://cdn.tailwindcss.com"></script> <!-- Include Tailwind CSS -->
</head>
<body class="bg-gray-100">
    <div class="container mt-5">
        <h2 class="text-center mb-4 text-3xl font-semibold">Available Cars</h2>
        <div class="row">
            <%
                ArrayList<carModel> carList = (ArrayList<carModel>) request.getAttribute("carList");
                if (carList != null && !carList.isEmpty()) {
                    for (carModel car : carList) {
                        // Dynamically build the color class for the circle based on color_name
                        String colorClass = "bg-" + car.getColor_name().toLowerCase().replace(" ", "-") + "-500"; 
            %>
                <div class="col-sm-12 col-md-6 col-lg-4 mb-4">
                    <div class="card shadow-lg bg-white rounded-lg">
                        <div class="card-body">
                            <h5 class="card-title text-xl font-bold"><%= car.getCar_name() %></h5>
                            <p class="card-text"><strong>Brand:</strong> <%= car.getCar_brand() %></p>
                            <p class="card-text"><strong>Model:</strong> <%= car.getCar_model() %></p>
                            <p class="card-text"><strong>Year:</strong> <%= car.getCar_year() %></p>
                            <p class="card-text"><strong>Description:</strong> <%= car.getCar_description() %></p>
                            <p class="card-text"><strong>Quantity:</strong> <%= car.getCar_quantity() %></p>
                            
                            <!-- Displaying color with a small circle and dynamic background color -->
                            <p class="card-text flex items-center space-x-2">
                                <strong>Color:</strong>
                                <span class="flex-shrink-0 w-6 h-6 rounded-full <%= colorClass %>"></span> <!-- Color circle -->
                                 <!-- Displaying color name -->
                            </p>

                            <p class="card-text"><strong>Price:</strong> $<%= car.getCar_price() %></p>
                        </div>
                    </div>
                </div>
            <%
                    }
                } else {
            %>
                <p>No cars found in the database.</p>
            <%
                }
            %>
        </div>
    </div>
</body>
</html>
