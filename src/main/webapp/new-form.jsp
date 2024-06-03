<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Create New Product</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
    <div class="container">
        <h1 class="my-4">Create New Product</h1>
        <form action="<c:url value='ProduitController?action=insert'/>" method="post" >
            <div class="form-group">
                <label for="name">Nom</label>
                <input type="text" class="form-control" id="Nom" name="Nom" required>
            </div>
           
            <div class="form-group">
                <label for="Prix">Prix</label>
                <input type="number" class="form-control" id="Prix" name="Prix" step="0.01" required>
            </div>
            <div class="form-group">
                <label for="quantité">Quantité</label>
                <input type="number" class="form-control" id="Quantité" name="Quantité"  required>
            </div>
            
            <button type="submit" class="btn btn-primary">Save</button>
            <a href="<c:url value='ProduitController?action=list'/>" class="btn btn-secondary">Cancel</a>
        </form>
    </div>
</body>
</html>