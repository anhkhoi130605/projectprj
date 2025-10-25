<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<header class="header">
  <div class="header-container">
    <!-- LOGO -->
    <div class="logo" onclick="window.location.href='${pageContext.request.contextPath}/index.jsp'">
      <img src="${pageContext.request.contextPath}/assets/images/authen/logo.jpg"
           alt="Logo" class="logo-img" decoding="async" />
      <span class="logo-text">E-Learning System</span>
    </div>

    <!-- SEARCH BAR -->
    <div class="search-bar">
      <input type="text" placeholder="Tìm kiếm khóa học, bài viết, video, ..." />
      <button class="search-btn" aria-label="Search">🔍</button>
    </div>

    <!-- ACTIONS -->
    <div class="header-actions">
      <button class="theme-toggle" id="themeToggle" onclick="toggleTheme()">🌗</button>

      <!-- 🔹 NẾU CHƯA ĐĂNG NHẬP -->
      <c:if test="${empty sessionScope.user}">
        <button class="btn-login"
                onclick="window.location.href='${pageContext.request.contextPath}/authen/loginAuthen.jsp'">
          Đăng nhập
        </button>
        <button class="btn-signup"
                onclick="window.location.href='${pageContext.request.contextPath}/authen/registerAuthen.jsp'">
          Đăng ký
        </button>
      </c:if>

      <!-- 🔹 NẾU ĐÃ ĐĂNG NHẬP -->
      <c:if test="${not empty sessionScope.user}">
        <div class="user-menu">
          <img src="${sessionScope.user.avatarUrl != null ? sessionScope.user.avatarUrl : (pageContext.request.contextPath + '/assets/images/default-avatar.png')}"
               alt="User Avatar"
               class="user-avatar"
               onclick="toggleUserMenu()" />

          <!-- Dropdown -->
          <div id="dropdownMenu" class="dropdown-menu">
            <div class="menu-header">
              <img src="${sessionScope.user.avatarUrl != null ? sessionScope.user.avatarUrl : (pageContext.request.contextPath + '/assets/images/default-avatar.png')}"
                   class="menu-avatar" alt="User"/>
              <div class="menu-info">
                <span class="user-name">${sessionScope.user.userName}</span>
                <span class="user-email">${sessionScope.user.email}</span>
              </div>
            </div>

            <div class="menu-divider"></div>

            <a href="${pageContext.request.contextPath}/profile.jsp">👤 Trang cá nhân</a>
            <a href="${pageContext.request.contextPath}/settings.jsp">⚙️ Cài đặt</a>

            <div class="menu-divider"></div>

            <a href="${pageContext.request.contextPath}/logout" class="logout">🚪 Đăng xuất</a>
          </div>
        </div>
      </c:if>
    </div>
  </div>
</header>

<!-- ========== SCRIPT ========== -->
<script>
function toggleUserMenu() {
  const menu = document.getElementById("dropdownMenu");
  menu.classList.toggle("show");
}

// Ẩn menu khi click ra ngoài
window.addEventListener("click", function (event) {
  const menu = document.getElementById("dropdownMenu");
  const avatar = document.querySelector(".user-avatar");
  if (menu && avatar && !menu.contains(event.target) && !avatar.contains(event.target)) {
    menu.classList.remove("show");
  }
});
</script>
