
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="false" %>

<html>
<head>
    <title>Book Data</title>
    <link rel="stylesheet" href="https://www.w3schools.com/lib/w3.css">
    <style type="text/css">

        .table_books {
            border-collapse: collapse;
            border-left: 3px solid #F79361;
            border-right: 3px solid #F79361;
            border-bottom: 3px solid #F79361;
            font-family: "Lucida Grande", sans-serif;
            margin: 10px;
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
            text-decoration: none;
            color: black;
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


<table class="table_books">
    <caption>Book Details</caption>
    <tr>
        <th>id</th>
        <th>title</th>
        <th>description</th>
        <th>author</th>
        <th>isbn</th>
        <th>printYear</th>
        <th>readAlready</th>

    </tr>
    <tr>
        <td>${book.id}</td>
        <td>${book.title}</td>
        <td>${book.description}</td>
        <td>${book.author}</td>
        <td>${book.isbn}</td>
        <td>${book.printYear}</td>
        <td>${book.readAlready}</td>

    </tr>
</table>
<div class="w3-container">

    <c:if test="${empty search.searchString}">

        <c:if test="${!empty book.title}">
            <h2>Read book:</h2>
        </c:if>

        <c:if test="${empty book.title}">
            <h2>Create book:</h2>
        </c:if>

        <c:url var="addAction" value="/books/add"/>
        <form:form action="${addAction}" commandName="book">
            <table class="w3-border" style="padding: 5px">
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
                        <form:input path="title" readonly="true" cssStyle="background-color: lightgrey; color: gray"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <form:label path="description">
                            <spring:message text="Description" />
                        </form:label>
                    </td>
                    <td>
                        <form:input path="description" readonly="true" cssStyle="background-color: lightgrey; color: gray"/>
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
                        <form:input path="author" readonly="true" cssStyle="background-color: lightgrey; color: gray" />
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
                        <form:input path="isbn" readonly="true" cssStyle="background-color: lightgrey; color: gray"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <form:label path="printYear">
                            <spring:message text="PrintYear" />
                        </form:label>
                    </td>
                    <td>
                        <form:input path="printYear" readonly="true" cssStyle="background-color: lightgrey; color: gray"/>
                    </td>
                </tr>
                <c:if test="${book.readAlready == false}">
                <tr>
                    <td>
                        <form:label path="readAlready">
                            <spring:message text="ReadAlready" />
                        </form:label>
                    </td>
                    <td>
                        <form:checkbox path="readAlready"/>
                    </td>
                </tr>
                </c:if>
                <tr>
                    <td colspan="2">
                        <c:if test="${!empty book.title}">
                        <c:if test="${book.readAlready == false}">
                            <input type="submit" value="<spring:message text="Read book" />"
                        </c:if>
                        </c:if>
                        <c:if test="${empty book.title}">
                            <input type="submit" value="<spring:message text="Create book" />"
                        </c:if>
                    </td>
                </tr>
            </table>
        </form:form>
    </c:if>

    <hr />
    <a class="button" href="<c:url value="/"/>">Start page</a>
    <br />

</div>



</body>
</html>


