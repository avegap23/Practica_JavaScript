<%-- Document : home Created on : 19-feb-2024, 12:17:53 Author : Alvaro --%>

    <%@page contentType="text/html" pageEncoding="UTF-8" %>
        <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
            <!doctype html>
            <html lang="en">

            <head>
                <title>The MovieDB</title>
                <!-- Required meta tags -->
                <meta charset="utf-8" />
                <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />

                <!-- Bootstrap CSS v5.2.1 -->
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
                    integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
                    crossorigin="anonymous" />
                <link rel="stylesheet" href="css/mycss.css">
            </head>

            <body>
                <div class="container px-0 shadow">
                    <nav class="navbar navbar-expand-md navbar-dark bg-dark">
                        <div class="container">
                            <a class="navbar-brand" href="#"><img src="img/logotmdb.png" alt="" width="80"></a>
                            <button class="navbar-toggler d-lg-none" type="button" data-bs-toggle="collapse"
                                data-bs-target="#collapsibleNavId" aria-controls="collapsibleNavId"
                                aria-expanded="false" aria-label="Toggle navigation">
                                <span class="navbar-toggler-icon"></span>
                            </button>
                            <div class="collapse navbar-collapse" id="collapsibleNavId">
                                <ul class="navbar-nav me-auto mt-2 mt-lg-0">
                                    <li class="nav-item">
                                        <a class="nav-link" href="Controller?op=menu&quieren=person">Person</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="Controller?op=menu&quieren=movie">Movie</a>
                                    </li>
                                </ul>
                                <form class="d-flex my-2 my-lg-0" action="Controller?op=login" method="post">
                                    <input class="form-control me-sm-2" type="text" placeholder="DNI" name="dni" />
                                    <input class="form-control me-sm-2" type="text" placeholder="Nombre"
                                        name="nombre" />
                                    <button class="btn btn-outline-success my-2 my-sm-0" type="submit">
                                        Login/Register
                                    </button>
                                </form>
                            </div>
                        </div>
                    </nav>

                    <!-- Person -->
                    <div class="row justify-content-center px-3">
                        <c:forEach items="${people}" var="person">
                            <div class="col-md-6 col-lg-4 p-3">
                                <div class="card h-100">
                                    <img class="card-img-top" src="https://image.tmdb.org/t/p/w500${person.foto}"
                                        class="img-fluid" alt="">
                                    <div class="card-body">
                                        <p class="text-center">
                                            <span class="display-4">
                                                &#9733;&#9733;&#9733;
                                            </span>
                                        <p>
                                        <h4 class="card-title text-center">${person.nombre}</h4>
                                    </div>
                                    <div class="text-center">
                                        <span class="rating">
                                            <a href="Controller?op=rating&rating=1">&#9733;</a>
                                            <a href="Controller?op=rating&rating=2">&#9733;</a>
                                            <a href="Controller?op=rating&rating=3">&#9733;</a>
                                            <a href="Controller?op=rating&rating=4">&#9733;</a>
                                            <a href="Controller?op=rating&rating=5">&#9733;</a>
                                        </span>
                                    </div>
                                    <div class="card-footer text-center">
                                        <button class="btn btn-success" data-bs-toggle="modal"
                                            data-bs-target="#modalmovies"
                                            data-bs-person="${person.id}">FILMOGRAFÍA</button>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>

                    <!-- Movie -->
                    <div class="row justify-content-center px-3">
                        <c:forEach items="${movies}" var="movie">
                            <div class="col-lg-6 p-3">
                                <div class="card p-2 h-100">
                                    <div class="row">
                                        <div class="col">
                                            <img src="https://image.tmdb.org/t/p/w500${movie.poster}" class="img-fluid"
                                                alt="">
                                        </div>
                                        <div class="col p-2">
                                            <h4 class="card-title">${movie.titulo}</h4>
                                            <h5 class="card-text">${movie.fecha}</h5>
                                            <p>${movie.trama}</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>

                    <footer>
                        <h2 class="text-center bg-dark text-success py-3">The MovieDB - avegap</h2>
                    </footer>
                </div>

                <!-- Modal -->
                <div class="modal fade" id="modalmovies" tabindex="-1" role="dialog" aria-labelledby="modelTitleId"
                    aria-hidden="true">
                    <div class="modal-dialog modal-dialog-scrollable" role="document">
                        <div class="modal-content">
                            <h3 class="modal-title bg-dark text-success text-center">Movies</h3>
                            <div class="modal-header">
                                <h4 class="text-success"></h4>
                            </div>
                            <div class="modal-body" id="movies">
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-success" data-bs-dismiss="modal">Close</button>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Bootstrap JavaScript Libraries -->
                <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
                    integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
                    crossorigin="anonymous"></script>

                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js"
                    integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+"
                    crossorigin="anonymous"></script>
            </body>

            </html>