<%@page errorPage="error.jsp" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/home-style.css">
  <!-- Font Awesome 5 -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
  

<script src='https://kit.fontawesome.com/a076d05399.js'></script>

</head>
    <!--Header-->
    <br>
    <div class="topnav sticky">
    
    <%
    String email= session.getAttribute("email").toString();
    %>
    

  <h2 style="font-size: 30px; color: #e67e22; font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; text-align:center">
    <i class="fas fa-shopping-bag" style="color: #27ae60;"></i> ShopEase: Your Smart Shopping Hub
  </h2>
  
           <h2><a href=""><i class='fas fa-user-alt'></i> &nbsp;<%out.println(email); %> </a></h2>
            <a href="home.jsp">Home<i class="fas fa-university"></i></a>
            <a href="myCart.jsp">My Cart<i class='fas fa-cart-arrow-down'></i></a>
            <a href="myOrders.jsp">My Orders  <i class='fab fa-elementor'></i></a>
            <a href="changeDetails.jsp">Change Details <i class="fas fa-edit"></i></a>
            <a href="messageUs.jsp">Message Us <i class='fas fa-comment-alt'></i></a>
            <a href="about.jsp">About <i class="fa fa-address-book"></i></a>
            <a href="logout.jsp">Logout <i class='fas fa-share-square'></i></a>
            <div class="search-container">
             <form action="searchHome.jsp" method="post">
             <input type="text" placeholder="Search" name="search">
             <button type="submit"> <i class="fa fa-search"></i></button>
             </form>
               
             
            </div>
          </div>
           <br>
           <!--table-->
