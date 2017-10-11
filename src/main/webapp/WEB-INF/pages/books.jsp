
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page session="false" %>

<html>
<head>
    <title>Books List</title>
    <link rel="stylesheet" href="https://www.w3schools.com/lib/w3.css">
    <style type="text/css">
        a:link{
            text-decoration: none;
        }
        a:hover {
            color: red;
        }
        .current {
            background-color: #a22800;
            text-align: center;
            color: aliceblue;
        }
        a.current {
            color: aliceblue;
        }
        .mainBlock {
            margin: 5px;
            width: 97%;
        }


        .table_books {
            border-collapse: collapse;
            border-left: 3px solid #F79361;
            border-right: 3px solid #F79361;
            border-bottom: 3px solid #F79361;
            font-family: "Lucida Grande", sans-serif;
            margin: 10px;
            float: left;
        }
        .table_books caption {
            background: #F79361;
            border-top-left-radius: 10px;
            border-top-right-radius: 10px;
            padding: 10px;
            box-shadow: 0 2px  4px 0 rgba(0,0,0,.3);
            color: white;
            font-family: "Roboto Slab",serif;
            font-style: normal;
            font-size: 26px;
            text-align: center;
            margin: 0;
        }
        .table_books td, .table_books th {
            padding: 10px;
        }
        .table_books th {
            text-align: left;
            font-size: 18px;
        }
        .table_books tr:nth-child(2n) {
            background: #E5E5E5;
        }
        .table_books td:last-of-type {
            text-align: center;
        }
        a.button {
            display: inline-block;
            padding: 5px 10px;
            background: #F79361;
            box-shadow: 2px 2px 0 0 #a22800;
            position: relative;
        }
        a.button:hover {
            box-shadow: none;
            top: 2px;
            left: 2px;
            color: black;
        }



    </style>
</head>

<body>

<div class="w3-container">

    <c:if test="${booksCount == 0}">
        <br />
        <p>No books found</p>
        <br />
    </c:if>
        <br />
    <c:if test="${!empty listBooks}">
        <form action="<c:url value="/books/search"/>" method="post">
            <!-- <label for="title">Title:</label> -->
            <input type="text" name="searchString" value="${search.searchString}" placeholder=" enter the title"/>
            <input type="submit" name="search" id="1" value="Search" />
            <c:if test="${!empty search.searchString}">
                <a href="<c:url value="/books/1"/>"><input type="button" name="clear" id="2" value="Clear filter" /></a>
            </c:if>
        </form>
    </c:if>
</div>

<div class="mainBlock">
    <c:if test="${!empty listBooks}">
        <table class="table_books" style="width:72%">
            <caption>Books</caption>
            <tr>
                <th>id</th>
                <th>title</th>
                <th>description</th>
                <th>author</th>
                <th>isbn</th>
                <th>printYear</th>
                <th>readAlready</th>
                <th colspan="2"></th>
            </tr>
            <c:forEach items="${listBooks}" var="books">
                <tr>
                    <td>${books.id}</td>
                    <td><a href="<c:url value="/bookdata/${books.id}"/>">${books.title}</a></td>
                    <td>${books.description}</td>
                    <td>${books.author}</td>
                    <td>${books.isbn}</td>
                    <td>${books.printYear}</td>
                    <td>${books.readAlready}</td>
                    <td><a class="button" href="<c:url value="/update/${books.id}"/>">Update</a></td>
                    <td><a class="button" href="<c:url value="/delete/${books.id}"/>">Delete</a></td>
                </tr>
            </c:forEach>
        </table>
    </c:if>




    <c:if test="${empty search.searchString}">

        <c:url var="addAction" value="/books/add"/>
        <form:form action="${addAction}" commandName="book">
            <table class="table_books" style="width:25%">

                <caption>
                    <c:if test="${!empty book.title}">
                        Update book:
                    </c:if>

                    <c:if test="${empty book.title}">
                        Create book:
                    </c:if>
                </caption>

                <c:if test="${!empty book.title}">
                    <tr>
                        <td>
                            <form:label path="id">
                                <spring:message text="Id" />
                            </form:label>
                        </td>
                        <td>
                            <form:input path="id" readonly="true" cssStyle="background-color: lightgrey; color: gray" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <form:label path="author">
                                <spring:message text="Author" />
                            </form:label>
                        </td>
                        <td>
                            <form:input path="author" readonly="true" cssStyle="background-color: lightgrey; color: gray" />
                        </td>
                    </tr>

                </c:if>
                <tr>
                    <td>
                        <form:label path="title">
                            <spring:message text="Title" />
                        </form:label>
                    </td>
                    <td>
                        <form:input path="title"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <form:label path="description">
                            <spring:message text="Description" />
                        </form:label>
                    </td>
                    <td>
                        <form:input path="description" />
                    </td>
                </tr>
                <c:if test="${empty book.title}">
                <tr>
                    <td>
                        <form:label path="author">
                            <spring:message text="Author" />
                        </form:label>
                    </td>
                    <td>
                        <form:input path="author" />
                    </td>
                </tr>
                <tr>
                    </c:if>
                    <td>
                        <form:label path="isbn">
                            <spring:message text="Isbn" />
                        </form:label>
                    </td>
                    <td>
                        <form:input path="isbn"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <form:label path="printYear">
                            <spring:message text="PrintYear" />
                        </form:label>
                    </td>
                    <td>
                        <form:input path="printYear"/>
                    </td>
                </tr>

                <tr>
                    <td colspan="2">
                        <c:if test="${!empty book.title}">
                            <input type="submit" value="<spring:message text="Update book" />"
                        </c:if>
                        <c:if test="${empty book.title}">
                            <input type="submit" value="<spring:message text="Create book" />"
                        </c:if>
                    </td>
                </tr>
            </table>
        </form:form>
    </c:if>

    </div>


    <br />
    <div class="w3-container">
        <hr />
        <table>
            <tr>
                <td>
                    <c:if test="${booksCount > 0}">
                        <table>
                            <tr>
                                <td>Page:</td>
                                <c:forEach begin="${1}" end="${(booksCount/10) + (booksCount%10==0?0:1)}" var="i">
                                    <td <c:if test="${page == i}"> class="current" </c:if>>
                                        <a href="<c:url value="/books/${i}" />" <c:if test="${page == i}"> class="current" </c:if>> ${i} </a>
                                    </td>
                                </c:forEach>
                            </tr>
                        </table>
                    </c:if>
                </td>
                <td><a class="button" href="<c:url value="/"/>">Start page</a></td>
            </tr>
        </table>
        <br />
    </div>
</div>

</body>
</html>
