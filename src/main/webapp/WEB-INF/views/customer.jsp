<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="customerHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Customer Details</title>
<!-- Bootstrap CSS -->
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.8.1/font/bootstrap-icons.min.css">
<style>
    body {
        background-color: #f4f4f4;
    }
    .container {
        margin-top: 20px;
    }
    .card {
        margin: 20px 0;
        border: none;
        border-radius: 10px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }
    .card-header{
        background-color: #6A9C89;
        color: #fff;
        font-size: 1.5em;
       
        border-top-left-radius: 10px;
        border-top-right-radius: 10px;
    }
    .header-content{
    display:flex;

    justify-content: space-between;
    }
    .message{
     text-align: right;
    }
      .welcome{
      text-align: left;
    }
    .card-body {
        padding: 20px;
    }
    .icon {
        color: #6A9C89; 
        margin-right: 10px;
    }
    .profile-info {
        display: flex;
        align-items: right;
        margin-bottom: 15px;
    }
    .profile-info i {
        font-size: 1.5em;
    }
    .profile-info span {
        font-size: 1.2em;
    }
</style>
</head>
<body>
    <div class="container">
        <div class="card">
            <div class="card-header">
            
            <div class="header-content">
            <div class="welcome"class="welcome">Welcome</div>                
                 
             <div class="message" class="message">  ${user.firstName}${user.lastName}</div>
                  
            </div></div>
            <div class="card-body">
               <%--  <div class="profile-info">
                    <i class="bi bi-person icon"></i>
                    <span>Username: ${user.username}</span>
                </div> --%>
                <div class="profile-info">
                    <i class="bi bi-person-badge icon"></i>
                    <span>First Name: ${user.firstName}</span>
                </div>
                <div class="profile-info">
                    <i class="bi bi-person-badge-fill icon"></i>
                    <span>Last Name: ${user.lastName}</span>
                </div>
                <div class="profile-info">
                    <i class="bi bi-envelope icon"></i>
                    <span>Email: ${user.email}</span>
                </div>
                <div class="profile-info">
                    <i class="bi bi-telephone icon"></i>
                    <span>Phone: ${user.phone}</span>
                </div>
               <%--  <div class="profile-info">
                    <i class="bi bi-shield-lock icon"></i>
                    <span>Role: ${user.role}</span>
                </div> --%>
               <%--  <a href="${pageContext.request.contextPath}/users/editProfile" class="btn btn-primary mt-3">Edit Profile</a> --%>
            </div>
        </div>
    </div>
          <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
