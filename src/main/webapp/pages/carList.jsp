<%@ page import="java.util.ArrayList" %>
<%@ page import="models.carModel" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>All Cars</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-5">
        <h2 class="text-center mb-4">Available Cars</h2>
        <div class="row">
            <%
                ArrayList<carModel> carList = (ArrayList<carModel>) request.getAttribute("carList");
                if (carList != null && !carList.isEmpty()) {
                    for (carModel car : carList) {
            %>
                <div class="col-md-4 mb-4">
                    <div class="card shadow-sm">
                        <div class="card-body">
                            <h5 class="card-title"><%= car.getCar_name() %></h5>
                            <p class="card-text"><strong>Brand:</strong> <%= car.getCar_brand() %></p>
                            <p class="card-text"><strong>Model:</strong> <%= car.getCar_model() %></p>
                            <p class="card-text"><strong>Year:</strong> <%= car.getCar_year() %></p>
                            <p class="card-text"><strong>Description:</strong> <%= car.getCar_description() %></p>
                            <p class="card-text"><strong>Quantity:</strong> <%= car.getCar_quantity() %></p>
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
