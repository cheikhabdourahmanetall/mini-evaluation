<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html>
<head>
    <title>Modifier Cours</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <style>
        body {
            background-color: #f8f9fa; /* Couleur de fond légère */
        }
        .card-title {
            text-align: center;
            color: #495057; /* Couleur du texte */
        }
        .btn-primary {
            background-color: #007bff; /* Couleur personnalisée pour le bouton */
            border: none; /* Supprimer la bordure */
        }
        .btn-primary:hover {
            background-color: #0056b3; /* Couleur au survol */
        }
    </style>
</head>
<body>
<div class="container mt-5">
    <h2 class="text-center">Modifier le Cours</h2>
    <form action="${pageContext.request.contextPath}/cours/update" method="post">
        <c:if test="${not empty cours}">
            <div class="row mt-4">
                <div class="col-12">
                    <div class="card shadow">
                        <div class="card-body">
                            <h5 class="card-title">Modifier le Cours</h5>
                            <input type="hidden" name="id" value="${cours.id}">
                            <div class="mb-3">
                                <label for="matiereInputEdit" class="form-label">Matière</label>
                                <input type="text" name="matiere" class="form-control" value="${cours.matiere}" id="matiereInputEdit" required>
                            </div>
                            <div class="mb-3">
                                <label for="inputProfesseurEdit" class="form-label">Professeur</label>
                                <input type="text" name="professeur" class="form-control" value="${cours.professeur}" id="inputProfesseurEdit" required>
                            </div>
                            <div class="mb-3">
                                <label for="inputClasseEdit" class="form-label">Classe</label>
                                <input type="text" name="classe" class="form-control" value="${cours.classe}" id="inputClasseEdit" required>
                            </div>
                            <button type="submit" class="btn btn-primary">Modifier</button>
                            <a href="${pageContext.request.contextPath}/cours" class="btn btn-secondary">Annuler</a> <!-- Lien pour revenir à la liste des cours -->
                        </div>
                    </div>
                </div>
            </div>
        </c:if>
    </form>
</div>
</body>
</html>
