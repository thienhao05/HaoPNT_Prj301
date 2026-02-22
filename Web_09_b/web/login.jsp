<%-- 
    Document   : login
    Created on : Jan 19, 2026, 9:39:45 AM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html class="h-full bg-white dark:bg-gray-900">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="https://cdn.jsdelivr.net/npm/@tailwindcss/browser@4"></script>
    </head>
    <body class="h-full">

        <div class="flex min-h-full flex-col justify-center px-6 py-12 lg:px-8">
            <div class="sm:mx-auto sm:w-full sm:max-w-sm">
                <img src="https://tailwindcss.com/plus-assets/img/logos/mark.svg?color=indigo&shade=600" alt="Your Company" class="mx-auto h-10 w-auto dark:hidden" />
                <img src="https://tailwindcss.com/plus-assets/img/logos/mark.svg?color=indigo&shade=500" alt="Your Company" class="mx-auto h-10 w-auto not-dark:hidden" />
                <h2 class="mt-10 text-center text-2xl/9 font-bold tracking-tight text-gray-900 dark:text-white">Sign in to your account</h2>
            </div>

            <div class="mt-10 sm:mx-auto sm:w-full sm:max-w-sm">
                <form action="MainController" method="post" class="space-y-6">
                    <input type="hidden" name="action" value="login"/>
                    <div>
                        <label for="username" class="block text-sm/6 font-medium text-gray-900 dark:text-gray-100">Username</label>
                        <div class="mt-2">
                            <input id="username" type="text" name="txtUsername"
                                   value="${param.txtUsername}" required autocomplete="username" class="block w-full rounded-md bg-white px-3 py-1.5 text-base text-gray-900 outline-1 -outline-offset-1 outline-gray-300 placeholder:text-gray-400 focus:outline-2 focus:-outline-offset-2 focus:outline-indigo-600 sm:text-sm/6 dark:bg-white/5 dark:text-white dark:outline-white/10 dark:placeholder:text-gray-500 dark:focus:outline-indigo-500" />
                        </div>
                    </div>

                    <div>
                        <div class="flex items-center justify-between">
                            <label for="password" class="block text-sm/6 font-medium text-gray-900 dark:text-gray-100">Password</label>
                            <div class="text-sm">
                                <a href="#" class="font-semibold text-indigo-600 hover:text-indigo-500 dark:text-indigo-400 dark:hover:text-indigo-300">Forgot password?</a>
                            </div>
                        </div>
                        <div class="mt-2">
                            <input id="password" type="password" name="txtPassword" required autocomplete="current-password" class="block w-full rounded-md bg-white px-3 py-1.5 text-base text-gray-900 outline-1 -outline-offset-1 outline-gray-300 placeholder:text-gray-400 focus:outline-2 focus:-outline-offset-2 focus:outline-indigo-600 sm:text-sm/6 dark:bg-white/5 dark:text-white dark:outline-white/10 dark:placeholder:text-gray-500 dark:focus:outline-indigo-500" />
                        </div>
                    </div>

                    <div>
                        <button type="submit" value="Login" class="flex w-full justify-center rounded-md bg-indigo-600 px-3 py-1.5 text-sm/6 font-semibold text-white shadow-xs hover:bg-indigo-500 focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600 dark:bg-indigo-500 dark:shadow-none dark:hover:bg-indigo-400 dark:focus-visible:outline-indigo-500">Sign in</button>
                    </div>
                </form>
                <c:if test="${not empty message}">
                    <p class="text-red-500 text-sm mt-2 text-center">
                        ${message}
                    </p>
                </c:if>
            </div>
        </div>
    </body>
</html>
