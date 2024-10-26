<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html>
<head>
    <title>Cours</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <style>
        body {
            background-color: #f8f9fa;
        }
        .card-title {
            text-align: center;
            color: #495057;
        }
        .btn-custom {
            background-color: #007bff;
            color: white;
        }
        .table {
            background-color: white;
            border-radius: 0.5rem;
        }
        .table th, .table td {
            vertical-align: middle;
        }
        .table th {
            background-color: #007bff;
            color: white;
        }
        .action-buttons {
            display: flex;
            gap: 0.5rem;
        }
    </style>
</head>
<body>
<div class="container mt-5">
    <div class="row">
        <!-- Section pour ajouter un cours -->
        <div class="col-sm-12 mb-4">
            <div class="card shadow">
                <div class="card-body">
                    <h5 class="card-title">Ajout d'un cours</h5>
                    <form action="cours" method="post">
                        <div class="mb-3">
                            <label for="matiereInput" class="form-label">Matière</label>
                            <input type="text" name="matiere" class="form-control" id="matiereInput" required>
                        </div>
                        <div class="mb-3">
                            <label for="inputProfesseur" class="form-label">Professeur</label>
                            <input type="text" name="professeur" class="form-control" id="inputProfesseur" required>
                        </div>
                        <div class="mb-3">
                            <label for="inputClasse" class="form-label">Classe</label>
                            <input type="text" name="classe" class="form-control" id="inputClasse" required>
                        </div>
                        <button type="submit" class="btn btn-custom">Ajouter</button>
                    </form>
                </div>
            </div>
        </div>
        <!-- Section pour la liste des cours -->
        <div class="col-sm-12">
            <div class="card shadow">
                <div class="card-body">
                    <h5 class="card-title">Liste des cours</h5>
                    <table class="table table-striped table-hover">
                        <thead>
                        <tr>
                            <th>Matière</th>
                            <th>Professeur</th>
                            <th>Classe</th>
                            <th>Actions</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${coursList}" var="cours">
                            <tr>
                                <td>${cours.matiere}</td>
                                <td>${cours.professeur}</td>
                                <td>${cours.classe}</td>
                                <td class="action-buttons">
                                    <a href="cours/edit?id=${cours.id}" class="btn btn-warning btn-sm" title="Modifier">
                                        <i class="fas fa-edit"></i>
                                    </a>
                                    <form action="cours/delete" method="post" style="display:inline;">
                                        <input type="hidden" name="id" value="${cours.id}">
                                        <button type="submit" class="btn btn-danger btn-sm" title="Supprimer" onclick="return confirm('Voulez-vous vraiment supprimer ce cours ?');">
                                            <i class="fas fa-trash"></i>
                                        </button>
                                    </form>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>

