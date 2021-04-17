<%-- 
    Document   : book
    Created on : Jan 5, 2021, 8:02:32 PM
    Author     : USER
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="mvc" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Book</title>
        <link href="<c:url value="/webjars/bootstrap/4.5.3/css/bootstrap.min.css"/>"
              type="text/css" rel="stylesheet"/>
    </head>
    <body>
        <div class="container">
            <div class="row">
                <div class="col-md-12 col-lg-12" style="text-align: center">
                    <c:if test="${action == 'add'}">
                        <h2>Add Book</h2>
                    </c:if>
                    <c:if test="${action == 'edit'}">
                        <h2>Edit Book</h2>
                    </c:if>
                </div>
            </div>
            
            <mvc:form action="${pageContext.request.contextPath}/${action}" method="post" modelAttribute="book">
                <c:if test="${action == 'edit'}">
                    <input type="text" name="id" value="${book.id}" hidden="">
                    <input type="hidden" name="bookDetailEntity.id" value="${book.bookDetailEntity.id}">
                </c:if>
                    
                <div class="row">
                    <div class="col-md-6 col-lg-6">
                        <div class="form-group">
                            <label for="nameId">Name</label>
                            <input type="text" id="nameId" class="form-control" name="name" value="${book.name}" >
                            <mvc:errors path="name" />
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-6">
                        <div class="form-group">
                            <label for="authorId">Author</label>
                            <input type="text" id="authorId" class="form-control" name="author"  value="${book.author}">
                            <mvc:errors path="author" />
                        </div>
                    </div>
                </div>
                
                <div class="row">
                    <div class="col-md-6 col-lg-6">
                        <div class="form-group">
                            <label>Category</label>
                            <select name="categoryEntity.id" class="form-control">
                                <c:forEach var="c" items="${categories}">
                                    <c:if test="${book.categoryEntity.id == c.id}">
                                        <option value="${c.id}" selected="">${c.name}</option>
                                    </c:if>
                                    <c:if test="${book.categoryEntity.id != c.id}">
                                        <option value="${c.id}">${c.name}</option>
                                    </c:if>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-6">
                        <div class="form-group">
                            <label for="isbnId">ISBN</label>
                            <input type="text" id="isbnId" class="form-control" name="bookDetailEntity.isbn" value="${book.bookDetailEntity.isbn}"> 
                        </div>
                    </div>
                </div>
                
                <div class="row">
                    <div class="col-md-6 col-lg-6">
                        <div class="form-group">
                            <label for="nobId">Number of page</label>
                            <input type="text" id="nobId" class="form-control" name="bookDetailEntity.numberOfPage" value="${book.bookDetailEntity.numberOfPage}">
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-6">
                        <div class="form-group">
                            <label for="priceId">Price</label>
                            <input type="text" id="priceId" class="form-control" name="bookDetailEntity.price" value="${book.bookDetailEntity.price}">
                        </div>
                    </div>
                </div>
                
                <div class="row">
                    <div class="col-md-6 col-lg-6">
                        <div class="form-group">
                            <label for="publishDateId">Publish date</label>
                            <input type="date" id="publishDateId" class="form-control" name="bookDetailEntity.publishDate" value="${book.bookDetailEntity.publishDate}">
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-6">
                        <div class="form-group">
                            <label for="descriptionId">Description</label>
                            <textarea id="descriptionId" class="form-control" name="bookDetailEntity.description" >${book.bookDetailEntity.description}</textarea>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12 col-lg-12" style="text-align: center">
                        <button type="submit" class="btn btn-success">Submit</button>
                    </div>
                </div>
            </mvc:form>
        </div>
    </body>
</html>
