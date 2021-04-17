<%-- 
    Document   : home
    Created on : Jan 5, 2021, 7:03:08 PM
    Author     : USER
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
        <link href="<c:url value="/webjars/bootstrap/4.5.3/css/bootstrap.min.css"/>"
              type="text/css" rel="stylesheet"/>
        <link rel="stylesheet" href="http://t4t5.github.io/sweetalert/dist/sweetalert.css">
        <style>
            .modal {
                text-align: center;
                display: none;
                position: fixed;
                z-index: 1;
                padding-top: 100px;
                left: 0;
                top: 0;
                width: 100%;
                height: 100%;
            }
            .modalContent {
                position: fixed;
                top: 30%;
                left: 40%;
                font-size: 18px;
                font-weight: bold;
                background-color: #fefefe;
                margin: auto;
                padding: 5px;
                border: 1px solid #888;
                width: 40%;
                height: 25%;
            }
            .hd {
                background-color: coral;
                font-size: 20px;
                padding: 4px 0 0 6px;
                text-align: left;
                height: 25%;
            }
            .modalContent button {
                border: none;
                border-radius: 4px;
                font-size: 15px;
                font-weight: bold;
                padding: 6px;
                margin: 10px 20px 0 20px;
                width: 70px;
            }
            .del {
                background-color: rgb(255, 65, 65);
            }
            .del:hover {
                background-color: rgb(255, 7, 7);
            }
            .cancel:hover {
                background-color: rgb(167, 167, 167);
            }
        </style>
    </head>
    <body>
        <div class="container">
            <div class="row">
                <div class="col-md-12 col-lg-12" style="text-align: center">
                    <h2>List Book</h2>
                </div>
            </div>
            <c:if test="${mes != null && mes!= ''}">
                <div class="row">
                    <div class="col-md-12 col-lg-12">
                        <c:if test="${mesType != null && mesType == 'success'}">
                            <div class="alert alert-success" role="alert">
                                ${mes}
                            </div>
                        </c:if>
                        <c:if test="${mesType != null && mesType == 'error'}">
                            <div class="alert alert-danger" role="alert">
                                ${mes}
                            </div>
                        </c:if>
                    </div>
                </div>
            </c:if>
            <div class="row">
                <div class="col-md-6 col-lg-6" style="padding-bottom: 10px">
                    <button onclick="location.href = '<c:url value="/add-book"/>'" class="btn btn-info">Add book</button>
                </div>
                <div class="col-md-6 col-lg-6">
                    <form action="${pageContext.request.contextPath}/search" method="post" class="form-inline float-right">
                        <div class="form-group">
                            <input type="text" name="strSearch" class="form-control">
                            <input type="submit" value="Search" class="btn btn-default">
                        </div>
                    </form>
                </div>
            </div>
            <div class="modal">
                <div class="modalContent">
                    <h3 class="hd">Delete Service</h3>
                    <p>Are you sure you want to delete this service?</p>
                    <button class="del" onclick="location.href = '<c:url value="/delete-book/${b.id}"/>'">Yes</button>
                    <button class="cancel" onclick="hideModal()">No</button>
                </div>
            </div>            
            <div class="row">
                <div class="col-md-12 col-lg-12" >
                    <!-- table -->
                    <div class="table-responsive">
                        <table class="table table-bordered table-hover">
                            <tr>
                                <th>Name</th>
                                <th>Author</th>
                                <th>Category</th>
                                <th>JSBN</th>
                                <th>Price</th>
                                <th>Publish Date</th>
                                <th>Action</th>
                            </tr>
                            <c:if test="${books != null && fn:length(books)>0}">
                                <c:forEach var="b" items="${books}">
                                    <tr>
                                        <td>${b.name}</td>
                                        <td>${b.author}</td>
                                        <td>${b.categoryEntity.name}</td>
                                        <td>${b.bookDetailEntity.isbn}</td>
                                        <td>
                                            <fmt:formatNumber type="currency" value="${b.bookDetailEntity.price}" pattern="$"/>
                                        </td>
                                        <td>
                                            <fmt:formatDate value="${b.bookDetailEntity.publishDate}" pattern="dd/MM/YYYY"/>
                                        </td>
                                        <td>
                                            <button type="button" >Edit</button>
                                            <button  class="openModal">Delete</button>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </c:if>
                            <c:if test="${books == null || fn:length(books)<=0}">
                                <tr>
                                    <td style="color: red; text-align: center" colspan="7">Not found !!!</td>
                                </tr>
                            </c:if>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <script src="https://code.jquery.com/jquery-2.1.3.min.js"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <script>
                                                var modal = document.querySelector(".modal");
                                                var btn = document.querySelector(".openModal");
                                                var span = document.querySelector(".close");
                                                btn.addEventListener("click", () => {
                                                    modal.style.display = "block";
                                                });
                                                span.addEventListener("click", () => {
                                                    hideModal();
                                                });
                                                function hideModal() {
                                                    modal.style.display = "none";
                                                }
                                                window.onclick = function (event) {
                                                    if (event.target == modal) {
                                                        hideModal();
                                                    }
                                                };
        </script>
    </body>
</html>