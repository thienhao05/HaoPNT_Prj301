<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html class="h-full bg-gray-100 dark:bg-gray-900">
    <head>
        <meta charset="UTF-8">
        <title>University Management</title>
        <script src="https://cdn.jsdelivr.net/npm/@tailwindcss/browser@4"></script>
    </head>

    <body class="min-h-full">

        <jsp:include page="welcome.jsp" />

        <c:if test="${empty user}">
            <c:redirect url="login.jsp"/>
        </c:if>

        <c:if test="${not empty user}">

            <div class="max-w-7xl mx-auto p-6">

                <!-- Header -->
                <div class="flex justify-between items-center mb-6">
                    <h1 class="text-2xl font-bold text-gray-800 dark:text-white">
                        🎓 University Management
                    </h1>

                    <a href="university-form.jsp"
                       class="bg-indigo-600 text-white px-4 py-2 rounded-lg hover:bg-indigo-500 transition">
                        + Add University
                    </a>
                </div>

                <!-- Search -->
                <form action="MainController" method="post" class="flex gap-3 mb-6">
                    <input type="hidden" name="action" value="search"/>

                    <input type="text" name="keywords" value="${keywords}"
                           placeholder="Search university..."
                           class="flex-1 rounded-lg border px-4 py-2 focus:outline-indigo-500"/>

                    <button type="submit"
                            class="bg-indigo-600 text-white px-6 rounded-lg hover:bg-indigo-500">
                        Search
                    </button>
                </form>

                <c:if test="${empty list}">
                    <div class="bg-white p-6 rounded-xl shadow text-center text-gray-500">
                        No data matching the search criteria found!
                    </div>
                </c:if>

                <c:if test="${not empty list}">
                    <div class="overflow-x-auto bg-white rounded-xl shadow">

                        <table class="min-w-full text-sm">
                            <tbody>

                                <c:forEach items="${list}" var="u">
                                    <tr>
                                        <td class="p-2">${u.name}</td>
                                    </tr>
                                </c:forEach>

                            </tbody>
                        </table>

                    </div>
                </c:if>

            </div>

        </c:if>

    </body>
</html>
