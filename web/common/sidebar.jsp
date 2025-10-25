<%-- 
    Document   : sidebar
    Created on : Oct 25, 2025, 12:52:09 PM
    Author     : Hieu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<aside class="sidebar">
            <nav class="sidebar-nav">
                <a class="nav-item active" href="${pageContext.request.contextPath}/eduHome/eduHome.jsp">
                    <!-- Home icon -->
                    <svg class="nav-icon" viewBox="0 0 24 24" width="24" height="24" aria-hidden="true" fill="currentColor">
                        <path d="M12 3.172 2.343 12H4v8a1 1 0 0 0 1 1h5v-6h4v6h5a1 1 0 0 0 1-1v-8h1.657L12 3.172z"/>
                    </svg>
                    <span class="nav-text">Trang chủ</span>
                </a>

                <a class="nav-item" href="${pageContext.request.contextPath}/learner/learningPath.jsp">
                    <!-- Binoculars icon -->
                    <svg class="nav-icon" viewBox="0 0 24 24" width="24" height="24" aria-hidden="true" fill="currentColor">
                        <path d="M7 3a2 2 0 0 1 2 2v4H5V5a2 2 0 0 1 2-2zm10 0a2 2 0 0 1 2 2v4h-4V5a2 2 0 0 1 2-2zM3 9h6a3 3 0 0 1 3 3v7H8a3 3 0 0 1-3-3v-2H3V9zm12 0h6v6h-2v2a3 3 0 0 1-3 3h-4v-7a3 3 0 0 1 3-3z"/>
                    </svg>
                    <span class="nav-text">Lộ trình</span>
                </a>

                <a class="nav-item" href="${pageContext.request.contextPath}/learner/articles.jsp">
                    <!-- Newspaper icon -->
                    <svg class="nav-icon" viewBox="0 0 24 24" width="24" height="24" aria-hidden="true" fill="currentColor">
                        <path d="M4 5h12a2 2 0 0 1 2 2v12H6a2 2 0 0 1-2-2V5zm16 4h2v8a2 2 0 0 1-2 2h-2V9h2zM6 7v10h10V7H6zm2 2h6v2H8V9zm0 4h6v2H8v-2z"/>
                    </svg>
                    <span class="nav-text">Bài viết</span>
                </a>
            </nav>
        </aside>
