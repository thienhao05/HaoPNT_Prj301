<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : a
    Created on : Jan 19, 2026, 9:45:32 AM
    Author     : PC
--%>

<%@page import="model.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html class="h-full bg-white dark:bg-gray-900">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="https://cdn.jsdelivr.net/npm/@tailwindcss/browser@4"></script>
    </head>
    <body class="h-full bg-gray-100 dark:bg-gray-900">

        <c:if test="${not empty user}">
            <div class="min-h-screen flex">

                <!-- Sidebar -->
                <aside class="w-64 bg-indigo-600 text-white hidden md:flex flex-col">
                    <div class="p-6 text-xl font-bold">
                        UniSystem
                    </div>

                    <nav class="flex-1 px-4 space-y-2">
                        <a href="#" class="block rounded-lg px-4 py-2 bg-indigo-500">Dashboard</a>
                        <a href="search.jsp" class="block rounded-lg px-4 py-2 hover:bg-indigo-500">Search</a>
                    </nav>

                    <div class="p-4">
                        <a href="MainController?action=logout"
                           class="block text-center rounded-lg bg-red-500 py-2 hover:bg-red-400">
                            Logout
                        </a>
                    </div>
                </aside>

                <!-- Main content -->
                <main class="flex-1 p-8">

                    <!-- Header -->
                    <div class="flex justify-between items-center mb-8">
                        <h1 class="text-2xl font-bold text-gray-800 dark:text-white">
                            Dashboard
                        </h1>

                        <span class="text-gray-600 dark:text-gray-300">
                            ${user.fullName}
                        </span>
                    </div>

                    <!-- Welcome card -->
                    <div class="bg-white dark:bg-gray-800 rounded-xl shadow p-6 mb-6">
                        <h2 class="text-xl font-semibold text-gray-800 dark:text-white">
                            👋 Welcome back, ${user.fullName}
                        </h2>
                        <p class="text-gray-500 dark:text-gray-400 mt-2">
                            Manage your universities, search data, and more.
                        </p>
                    </div>

                    <!-- Action cards -->
                    <div class="grid grid-cols-1 md:grid-cols-2 gap-6">

                        <a href="search.jsp"
                           class="bg-indigo-500 text-white rounded-xl p-6 hover:bg-indigo-400 transition">
                            <h3 class="text-lg font-semibold mb-2">🔍 Search University</h3>
                            <p>Find and manage university data.</p>
                        </a>

                        <a href="MainController?action=logout"
                           class="bg-red-500 text-white rounded-xl p-6 hover:bg-red-400 transition">
                            <h3 class="text-lg font-semibold mb-2">🚪 Logout</h3>
                            <p>Exit your account securely.</p>
                        </a>

                    </div>

                </main>
            </div>
        </c:if>

        <c:if test="${empty user}">
            <c:redirect url="login.jsp"/>
        </c:if>
    </body>
</html>
