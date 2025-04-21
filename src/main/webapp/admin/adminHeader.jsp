<%@page errorPage="error.jsp" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../css/home-style.css">
<!-- Use this in your <head> section -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">


<script src='https://kit.fontawesome.com/a076d05399.js'></script> <!-- remove this -->


</head>
    <!--Header-->
    <br>
    <div class="topnav sticky">
    <%String email= session.getAttribute("email").toString(); %>
   
            <center><h2>Online shopping</h2></center>
            
            <a href="addNewProduct.jsp">Add New Product <i class="fa-solid fa-square-plus"></i></a>
			<a href="allProductEditProduct.jsp">All Products & Edit Products <i class="fa-solid fa-pen-to-square"></i></a>
			<a href="messagesReceived.jsp">Messages Received <i class="fa-solid fa-message"></i></a>
			<a href="ordersReceived.jsp">Orders Received <i class="fa-solid fa-box-archive"></i></a>
			<a href="cancelOrders.jsp">Cancel Orders <i class="fas fa-window-close"></i></a>
			<a href="deliveredOrders.jsp">Delivered Orders <i class="fas fa-dolly"></i></a>
			<a href="../logout.jsp">Logout <i class='fas fa-share-square'></i></a>

          </div>
           <br>
           <!--table-->
