/* ===================== CAROUSEL ===================== */
let currentSlideIndex = 0
let autoSlideInterval = null

function changeSlide(n) {
  showSlide((currentSlideIndex += n));
}

function currentSlide(n) {
  showSlide((currentSlideIndex = n));
}

function showSlide(n) {
  const slides = document.querySelectorAll(".carousel-slide")
  const dots = document.querySelectorAll(".dot");
  if (!slides.length) return;

  if (n >= slides.length) currentSlideIndex = 0
  if (n < 0) currentSlideIndex = slides.length - 1;

  slides.forEach((s) => s.classList.remove("active"));
  dots.forEach((d) => d.classList.remove("active"));

  slides[currentSlideIndex].classList.add("active")
  if (dots[currentSlideIndex]) dots[currentSlideIndex].classList.add("active");
}

function initCarousel() {
  showSlide(0);
  if (autoSlideInterval) clearInterval(autoSlideInterval);
  autoSlideInterval = setInterval(() => changeSlide(1), 5000);
}

/* ===================== THEME TOGGLE ===================== */
function initTheme() {
  const savedTheme = localStorage.getItem("theme") || "dark";
  document.body.classList.toggle("light-mode", savedTheme === "light");
}

function toggleTheme() {
  const isLightMode = document.body.classList.toggle("light-mode")
  const theme = isLightMode ? "light" : "dark";
  localStorage.setItem("theme", theme);
}

/* ===================== SEARCH + SCROLL ===================== */
function initSearchAndScroll() {
  const searchBtn = document.querySelector(".search-btn");
  const searchInput = document.querySelector(".search-bar input");

  if (searchBtn && searchInput) {
    searchBtn.addEventListener("click", () => {
      const query = searchInput.value.trim();
      if (query) console.log("Searching for:", query);
    });
  }

  // Smooth scroll for anchor links
  document.querySelectorAll('a[href^="#"]').forEach((anchor) => {
    anchor.addEventListener("click", function (e) {
      const href = this.getAttribute("href");
      if (href && href !== "#") {
        e.preventDefault();
        const target = document.querySelector(href)
        if (target) target.scrollIntoView({ behavior: "smooth" });
      }
    });
  });
}

/* ===================== INIT ===================== */
document.addEventListener("DOMContentLoaded", () => {
  initTheme();
  initCarousel();
  initSearchAndScroll();

  // Optional: highlight active nav item
  const navItems = document.querySelectorAll(".nav-item");
  const currentPage = window.location.pathname.split("/").pop() || "EduHome.jsp";
  navItems.forEach((item) => {
    item.classList.remove("active");
    const onClick = item.getAttribute("onclick") || "";
    if (onClick.includes(currentPage)) item.classList.add("active");
  });
});
function navigateTo(page) {
  window.location.href = page;
}

window.onclick = (event) => {
  const modal = document.getElementById("authModal");
  if (event.target === modal) closeAuthModal();
};

document.addEventListener("keydown", (e) => {
  const modal = document.getElementById("authModal");
  if (modal.style.display === "block") {
    if (e.key === "Escape") closeAuthModal();
    if (e.key === "Enter") {
      const active = document.activeElement;
      const isTyping = active && (active.tagName === "INPUT" || active.tagName === "TEXTAREA");
      if (isTyping) handleFormSubmit();
    }
  }
});

document.addEventListener("DOMContentLoaded", () => {
  const navItems = document.querySelectorAll(".nav-item");
  const currentPage = window.location.pathname.split("/").pop() || "EduHome.jsp";
  navItems.forEach((item) => {
    item.classList.remove("active");
    const onClick = item.getAttribute("onclick") || "";
    if (onClick.includes(currentPage)) item.classList.add("active");
  });
});

document.querySelector(".search-btn")?.addEventListener("click", () => {
  const searchInput = document.querySelector(".search-bar input");
  const query = searchInput.value.trim();
  if (query) console.log("Searching for:", query);
});

document.querySelectorAll('a[href^="#"]').forEach((anchor) => {
  anchor.addEventListener("click", function (e) {
    const href = this.getAttribute("href")
    if (href !== "#") {
      e.preventDefault()
      const target = document.querySelector(href)
      if (target) target.scrollIntoView({ behavior: "smooth" });
    }
  });
});


function showGroup(el) {
  if (!el) return
  el.style.display = "block"
}

function hideGroup(el) {
  if (!el) return
  el.style.display = "none"
}