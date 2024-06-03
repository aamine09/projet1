<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ page import="java.util.*" %>
<%@ page import="models.Produit" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Gestion des Produits</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
    <div class="container">
        <h1 class="my-4">Gestion des Produits</h1>
        <hr>
        
        <div class="row justify-content-end">
            <div class="col-auto">
                <a href="ProduitController?action=new" class="btn btn-primary">Ajouter un nouveau Produit</a>
            </div>
        </div>
        <div class="row my-4">
   
        
            <div class="col-12">
                <table class="table table-striped table-hover">
                    <thead class="thead-dark">
                        <tr>
                            <th>ID</th>
                            <th>Nom</th>
                            <th>Prix</th>
                            <th>Quantité</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="produit" items="${listProduits}">
                           
                            <tr>
                               
                                <td>${produit.id}</td>
                                <td>${produit.nom}</td>
                                <td>${produit.prix} dhs</td>
                                <td>${produit.quantité} </td>
                                <td>
                                <a class="btn btn-danger" href="ProduitController?action=delete&id=${produit.id}" > supprimer</a>
                                <a class="btn btn-primary" href="ProduitController?action=edit&id=${produit.id}" > modifier</a>
                                </td>
                                
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</body>
</html>