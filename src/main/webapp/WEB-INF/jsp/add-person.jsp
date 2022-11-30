<%--
  Created by IntelliJ IDEA.
  User: Kura Pika
  Date: 11/19/2022
  Time: 3:26 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<head>
    <title>ajouter votre cv</title>


</head>
<body>
<div class="container py-5">
<div class="row">
    <div class="col-lg-6 mx-auto">
        <div class="card ">
            <div class="card-header">
                <div class="bg-white shadow-sm pt-4 pl-2 pr-2 pb-2">

<form>
    <!-- 2 column grid layout with text inputs for the first and last names -->
    <div class="row mb-4">
        <div class="col">
            <div class="form-outline">
                <input type="text" id="form6Example1" class="form-control" />
                <label class="form-label" for="form6Example1">First name</label>
            </div>
        </div>
        <div class="col">
            <div class="form-outline">
                <input type="text" id="form6Example2" class="form-control" />
                <label class="form-label" for="form6Example2">Last name</label>
            </div>
        </div>
    </div>

    <!-- Text input -->
    <div class="form-outline mb-4">
        <input type="text" id="form6Example3" class="form-control" />
        <label class="form-label" for="form6Example3">Web</label>
    </div>

    <!-- Text input -->

    <!-- Email input -->
    <div class="form-outline mb-4">
        <input type="email" id="form6Example5" class="form-control" />
        <label class="form-label" for="form6Example5">Email</label>
    </div>

    <!-- Number input -->
    <div class="form-outline mb-4">
        <input type="password" id="form6Example6" class="form-control" />
        <label class="form-label" for="form6Example6">password</label>
    </div>

    <!-- Message input -->
    <!-- Text input -->
    <div class="form-outline mb-4">
        <input type="date" id="form6Example33" class="form-control" />
        <label class="form-label" for="form6Example3">Web</label>
    </div>



    <!-- Submit button -->
    <button type="submit" class="btn btn-primary btn-block mb-4">save</button>
</form>
</div>
            </div>
        </div>
    </div>
</div>
</div>
</body>
</html>
