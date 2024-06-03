<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Product</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
    <div class="container">
        <h1 class="my-4">Edit Product</h1>
        <form action="<c:url value='ProduitController?action=update'/>" method="post" >
            <input type="hidden" name="id" value="<c:out value='${produit.id}' />">
            <div class="form-group">
                <label for="name">Name</label>
                <input type="text" class="form-control" id="name" name="Nom" value="<c:out value='${produit.nom}' />">
            </div>
           
           
            <div class="form-group">
                <label for="Prix">Price</label>
                <input type="number" class="form-control" id="price" name="Prix"  value="<c:out value='${produit.prix}' />">
            </div>
           
           <div class="form-group">
                <label for="Quantité">Quantité</label>
                <input type="number" class="form-control" id="Quantité" name="Quantité"  value="<c:out value='${produit.quantité}' />">
            </div>
            <button type="submit" class="btn btn-primary">Save</button>
            <a href="<c:url value='ProduitController?action=list'/>" class="btn btn-secondary">Cancel</a>
        </form>
    </div>
</body>
</html>