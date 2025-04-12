<%@ page import="java.util.ArrayList" %>
<%@ page import="models.productImageModel" %>
<html>
<head>
    <title>Store</title>
</head>
<body>
<%
    ArrayList<productImageModel> imageList = (ArrayList<productImageModel>) request.getAttribute("imageList");

    if (imageList != null && !imageList.isEmpty()) {
%>
    <h2>Car Image Gallery</h2>
    <div style="display: flex; flex-wrap: wrap;">
        <% 
            for (productImageModel pi : imageList) {
                String imagePath = pi.getCar_images_path(); // Get the image path
        %>
        <div style="margin: 10px;">
            <!-- Render the image if the path is valid -->
            <img src="<%= imagePath %>" width="200" height="150" alt="Car Image"/>
            <p>Car ID: <%= pi.getCar_id() %></p>
        </div>
        <% 
            }
        %>
    </div>
<%
    } else {
%>
    <p>Error: No imagfes found.</p>
<%
    }
%>
</body>
</html>
