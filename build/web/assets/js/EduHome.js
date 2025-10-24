/* ===================== CAROUSEL ===================== */
let currentSlideIndex = 0
let autoSlideInterval = null

function changeSlide(n) {
  showSlide((currentSlideIndex += n))
}

function currentSlide(n) {
  showSlide((currentSlideIndex = n))
}

function showSlide(n) {
  const slides = document.querySelectorAll(".carousel-slide")
  const dots = document.querySelectorAll(".dot")
  if (!slides.length) return

  if (n >= slides.length) currentSlideIndex = 0
  if (n < 0) currentSlideIndex = slides.length - 1

  slides.forEach((s) => s.classList.remove("active"))
  dots.forEach((d) => d.classList.remove("active"))

  slides[currentSlideIndex].classList.add("active")
  if (dots[currentSlideIndex]) dots[currentSlideIndex].classList.add("active")
}

function initCarousel() {
  showSlide(0)
  // Clear any existing interval to prevent duplicates
  if (autoSlideInterval) clearInterval(autoSlideInterval)
  // Auto-advance carousel every 5 seconds
  autoSlideInterval = setInterval(() => changeSlide(1), 5000)
}

/* ===================== THEME TOGGLE ===================== */
function initTheme() {
  const savedTheme = localStorage.getItem("theme") || "dark"
  document.body.classList.toggle("light-mode", savedTheme === "light")
}

function toggleTheme() {
  const isLightMode = document.body.classList.toggle("light-mode")
  const theme = isLightMode ? "light" : "dark"
  localStorage.setItem("theme", theme)
  console.log("[v0] Theme switched to:", theme)
}

document.addEventListener("DOMContentLoaded", () => {
  initTheme()
  initCarousel()
})

/* ===================== AUTH MODAL ===================== */
let authMode = "login"
let isPasswordVisible = false
let isConfirmPasswordVisible = false

function openAuthModal(mode) {
  const modal = document.getElementById("authModal")
  const modalTitle = document.getElementById("modalTitle")
  const modalSubtitle = document.getElementById("modalSubtitle")
  const toggleText = document.getElementById("toggleText")
  const forgotText = document.getElementById("forgotText")
  const emailToggleBtn = document.getElementById("emailToggleBtn")
  const googleBtnText = document.getElementById("googleBtnText")
  const rememberMeGroup = document.getElementById("rememberMeGroup")
  const confirmPasswordGroup = document.getElementById("confirmPasswordGroup")
  const authForm = document.getElementById("authForm")

  modal.style.display = "block"
  authMode = mode

  clearAuthForm()

  authForm.style.display = "flex"

  if (mode === "signup") {
    modalTitle.textContent = "Đăng ký tài khoản E-Learning System"
    modalSubtitle.textContent =
      "Mỗi người nên sử dụng riêng một tài khoản, tài khoản nhiều người sử dụng chung sẽ bị khóa."
    toggleText.innerHTML = 'Bạn đã có tài khoản? <a href="#" onclick="toggleAuthMode(event)">Đăng nhập</a>'
    forgotText.style.display = "none"
    emailToggleBtn.setAttribute("aria-expanded", "false")
    document.getElementById("emailBtnText").textContent = "Sử dụng email / số điện thoại"
    googleBtnText.textContent = "Đăng ký với Google"
    rememberMeGroup.style.display = "none"
    showGroup(confirmPasswordGroup)
  } else {
    modalTitle.textContent = "Đăng nhập vào E-Learning System"
    modalSubtitle.textContent =
      "Mỗi người nên sử dụng riêng một tài khoản, tài khoản nhiều người sử dụng chung sẽ bị khóa."
    toggleText.innerHTML = 'Bạn chưa có tài khoản? <a href="#" onclick="toggleAuthMode(event)">Đăng kí</a>'
    forgotText.style.display = "block"
    emailToggleBtn.setAttribute("aria-expanded", "false")
    document.getElementById("emailBtnText").textContent = "Sử dụng email / số điện thoại"
    googleBtnText.textContent = "Đăng nhập với Google"
    rememberMeGroup.style.display = "flex"
    hideGroup(confirmPasswordGroup)
  }

  resetPasswordTogglesToEmoji()
}

function closeAuthModal() {
  const modal = document.getElementById("authModal")
  const authForm = document.getElementById("authForm")
  if (modal) modal.style.display = "none"
  if (authForm) authForm.style.display = "none"
  clearAuthForm()
}

function toggleAuthForm() {
  const authForm = document.getElementById("authForm")
  const emailBtnText = document.getElementById("emailBtnText")

  authForm.style.display = authForm.style.display === "none" ? "flex" : "none"
  emailBtnText.textContent =
    authForm.style.display === "none" ? "Sử dụng email / số điện thoại" : "Sử dụng email / số điện thoại"

  resetPasswordTogglesToEmoji()
}

function toggleAuthMode(event) {
  event.preventDefault()
  if (authMode === "login") openAuthModal("signup")
  else openAuthModal("login")
}

/* ===================== PASSWORD TOGGLES (emoji) ===================== */
function resetPasswordTogglesToEmoji() {
  document.querySelectorAll(".password-toggle").forEach((btn, idx) => {
    btn.innerHTML =
      '<svg viewBox="0 0 24 24" width="20" height="20" fill="currentColor"><path d="M12 4.5C7 4.5 2.73 7.61 1 12c1.73 4.39 6 7.5 11 7.5s9.27-3.11 11-7.5c-1.73-4.39-6-7.5-11-7.5zM12 17c-2.76 0-5-2.24-5-5s2.24-5 5-5 5 2.24 5 5-2.24 5-5 5zm0-8c-1.66 0-3 1.34-3 3s1.34 3 3 3 3-1.34 3-3-1.34-3-3-3z"/></svg>'
    btn.setAttribute("aria-label", idx === 0 ? "Hiện/ẩn mật khẩu" : "Hiện/ẩn nhập lại mật khẩu")
  })
}

function togglePasswordVisibility() {
  const passwordInput = document.getElementById("passwordInput")
  const passwordToggle = document.querySelector(".password-toggle")
  if (!passwordInput || !passwordToggle) return

  isPasswordVisible = !isPasswordVisible
  passwordInput.type = isPasswordVisible ? "text" : "password"
  passwordToggle.innerHTML = isPasswordVisible
    ? '<svg viewBox="0 0 24 24" width="20" height="20" fill="currentColor"><path d="M12 7c2.76 0 5 2.24 5 5 0 .65-.13 1.26-.36 1.83l2.92 2.92c1.51-1.26 2.7-2.89 3.43-4.75-1.73-4.39-6-7.5-11-7.5-1.4 0-2.74.25-3.98.7l2.16 2.16C10.74 7.13 11.35 7 12 7zM2 4.27l2.28 2.28.46.46A11.804 11.804 0 001 12c1.73 4.39 6 7.5 11 7.5 1.55 0 3.03-.3 4.38-.84l.42.42L19.73 22 21 20.73 3.27 3 2 4.27zM7.53 9.8l1.55 1.55c-.05.21-.08.43-.08.65 0 1.66 1.34 3 3 3 .22 0 .44-.03.65-.08l1.55 1.55c-.67.33-1.41.53-2.2.53-2.76 0-5-2.24-5-5 0-.79.2-1.53.53-2.2zm5.31-7.78l3.15 3.15.02-.02c-.01-.01-.03-.03-.04-.04l-3.12-3.09zm3.36 3.41l2.88 2.88c.46-1.06.67-2.42.15-3.95-.52-1.52-1.89-2.42-3.03-2.42-.55 0-1.07.15-1.54.42l1.54 1.07z"/></svg>'
    : '<svg viewBox="0 0 24 24" width="20" height="20" fill="currentColor"><path d="M12 4.5C7 4.5 2.73 7.61 1 12c1.73 4.39 6 7.5 11 7.5s9.27-3.11 11-7.5c-1.73-4.39-6-7.5-11-7.5zM12 17c-2.76 0-5-2.24-5-5s2.24-5 5-5 5 2.24 5 5-2.24 5-5 5zm0-8c-1.66 0-3 1.34-3 3s1.34 3 3 3 3-1.34 3-3-1.34-3-3-3z"/></svg>'
}

function toggleConfirmPasswordVisibility() {
  const confirmPasswordInput = document.getElementById("confirmPasswordInput")
  const toggles = document.querySelectorAll(".password-toggle")
  const confirmPasswordToggle = toggles[1]
  if (!confirmPasswordInput || !confirmPasswordToggle) return

  isConfirmPasswordVisible = !isConfirmPasswordVisible
  confirmPasswordInput.type = isConfirmPasswordVisible ? "text" : "password"
  confirmPasswordToggle.innerHTML = isConfirmPasswordVisible
    ? '<svg viewBox="0 0 24 24" width="20" height="20" fill="currentColor"><path d="M12 7c2.76 0 5 2.24 5 5 0 .65-.13 1.26-.36 1.83l2.92 2.92c1.51-1.26 2.7-2.89 3.43-4.75-1.73-4.39-6-7.5-11-7.5-1.4 0-2.74.25-3.98.7l2.16 2.16C10.74 7.13 11.35 7 12 7zM2 4.27l2.28 2.28.46.46A11.804 11.804 0 001 12c1.73 4.39 6 7.5 11 7.5 1.55 0 3.03-.3 4.38-.84l.42.42L19.73 22 21 20.73 3.27 3 2 4.27zM7.53 9.8l1.55 1.55c-.05.21-.08.43-.08.65 0 1.66 1.34 3 3 3 .22 0 .44-.03.65-.08l1.55 1.55c-.67.33-1.41.53-2.2.53-2.76 0-5-2.24-5-5 0-.79.2-1.53.53-2.2zm5.31-7.78l3.15 3.15.02-.02c-.01-.01-.03-.03-.04-.04l-3.12-3.09zm3.36 3.41l2.88 2.88c.46-1.06.67-2.42.15-3.95-.52-1.52-1.89-2.42-3.03-2.42-.55 0-1.07.15-1.54.42l1.54 1.07z"/></svg>'
    : '<svg viewBox="0 0 24 24" width="20" height="20" fill="currentColor"><path d="M12 4.5C7 4.5 2.73 7.61 1 12c1.73 4.39 6 7.5 11 7.5s9.27-3.11 11-7.5c-1.73-4.39-6-7.5-11-7.5zM12 17c-2.76 0-5-2.24-5-5s2.24-5 5-5 5 2.24 5 5-2.24 5-5 5zm0-8c-1.66 0-3 1.34-3 3s1.34 3 3 3 3-1.34 3-3-1.34-3-3-3z"/></svg>'
}

/* ===================== VALIDATIONS ===================== */
function validateEmail() {
  const emailInput = document.getElementById("emailInput")
  const emailError = document.getElementById("emailError")
  const email = emailInput.value.trim()

  if (!email) {
    showError(emailError, "Email hoặc số điện thoại không được để trống")
    emailInput.classList.add("error")
    return false
  }
  const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$|^[0-9]{10,11}$/
  if (!emailRegex.test(email)) {
    showError(emailError, "Email hoặc số điện thoại không hợp lệ")
    emailInput.classList.add("error")
    return false
  }
  hideError(emailError)
  emailInput.classList.remove("error")
  return true
}
function validatePhone() {
  const emailInput = document.getElementById("emailInput")
  const emailError = document.getElementById("emailError")
  const email = emailInput.value.trim()

  if (!email) {
    showError(emailError, "Email hoặc số điện thoại không được để trống")
    emailInput.classList.add("error")
    return false
  }
  const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$|^[0-9]{10,11}$/
  if (!emailRegex.test(email)) {
    showError(emailError, "Email hoặc số điện thoại không hợp lệ")
    emailInput.classList.add("error")
    return false
  }
  hideError(emailError)
  emailInput.classList.remove("error")
  return true
}

function validatePassword() {
  const passwordInput = document.getElementById("passwordInput")
  const passwordError = document.getElementById("passwordError")
  const password = passwordInput.value

  if (!password) {
    showError(passwordError, "Mật khẩu không được để trống")
    passwordInput.classList.add("error")
    return false
  }
  if (authMode === "signup" && password.length < 6) {
    showError(passwordError, "Mật khẩu phải có ít nhất 6 ký tự")
    passwordInput.classList.add("error")
    return false
  }
  hideError(passwordError)
  passwordInput.classList.remove("error")
  return true
}

function validateConfirmPassword() {
  const passwordInput = document.getElementById("passwordInput")
  const confirmPasswordInput = document.getElementById("confirmPasswordInput")
  const confirmPasswordError = document.getElementById("confirmPasswordError")

  if (authMode !== "signup") return true

  if (!confirmPasswordInput.value) {
    showError(confirmPasswordError, "Vui lòng nhập lại mật khẩu")
    confirmPasswordInput.classList.add("error")
    return false
  }
  if (passwordInput.value !== confirmPasswordInput.value) {
    showError(confirmPasswordError, "Mật khẩu không khớp")
    confirmPasswordInput.classList.add("error")
    return false
  }
  hideError(confirmPasswordError)
  confirmPasswordInput.classList.remove("error")
  return true
}

function validateUsername() {
  const usernameInput = document.getElementById("usernameInput")
  const usernameError = document.getElementById("usernameError")
  const username = usernameInput.value.trim()

  if (!username) {
    showError(usernameError, "Tên tài khoản không được để trống")
    usernameInput.classList.add("error")
    return false
  }
  if (username.length < 3) {
    showError(usernameError, "Tên tài khoản phải có ít nhất 3 ký tự")
    usernameInput.classList.add("error")
    return false
  }
  hideError(usernameError)
  usernameInput.classList.remove("error")
  return true
}

function showError(element, message) {
  element.textContent = message
  element.classList.add("show")
}

function hideError(element) {
  element.textContent = ""
  element.classList.remove("show")
}

/* ===================== SUBMIT ===================== */
function handleFormSubmit() {
  const generalError = document.getElementById("generalError")
  hideError(generalError)

  let isUsernameValid = true
  if (authMode === "signup") isUsernameValid = validateUsername()

  const isEmailValid = validateEmail()
  const isPasswordValid = validatePassword()
  const isConfirmPasswordValid = authMode === "signup" ? validateConfirmPassword() : true

  if (!isUsernameValid || !isEmailValid || !isPasswordValid || !isConfirmPasswordValid) {
    return
  }

  const submitBtn = document.getElementById("submitBtn")
  const submitBtnText = document.getElementById("submitBtnText")
  const loadingSpinner = document.getElementById("loadingSpinner")

  submitBtn.disabled = true
  submitBtnText.style.display = "none"
  loadingSpinner.style.display = "inline-block"

  setTimeout(() => {
    const username = authMode === "signup" ? document.getElementById("usernameInput").value : ""
    const email = document.getElementById("emailInput").value
    const password = document.getElementById("passwordInput").value

    if (authMode === "login") {
      console.log("[v0] Login attempt:", { email, password })
      showError(generalError, "Đăng nhập thành công! Chuyển hướng...")
      setTimeout(() => {
        closeAuthModal()
        alert("Đăng nhập thành công!")
      }, 1000)
    } else {
      console.log("[v0] Signup attempt:", { username, email, password })
      showError(generalError, "Đăng ký thành công! Chuyển hướng...")
      setTimeout(() => {
        closeAuthModal()
        alert("Đăng ký thành công!")
      }, 1000)
    }

    submitBtn.disabled = false
    submitBtnText.style.display = "inline"
    loadingSpinner.style.display = "none"
  }, 1000)
}

function handleGoogleLogin() {
  console.log("[v0] Google login initiated")
  alert("Đang chuyển hướng đến Google để đăng nhập...")
}

function handleForgotPassword(event) {
  event.preventDefault()
  console.log("[v0] Forgot password initiated")
  alert("Vui lòng kiểm tra email để đặt lại mật khẩu")
}

function clearAuthForm() {
  const u = document.getElementById("usernameInput")
  const e = document.getElementById("emailInput")
  const p = document.getElementById("passwordInput")
  const cp = document.getElementById("confirmPasswordInput")
  const rm = document.getElementById("rememberMe")

  if (u) u.value = ""
  if (e) e.value = ""
  if (p) p.value = ""
  if (cp) cp.value = ""
  if (rm) rm.checked = false

  document.querySelectorAll(".error-message").forEach((el) => hideError(el))
  document.querySelectorAll(".form-input").forEach((el) => el.classList.remove("error"))

  isPasswordVisible = false
  isConfirmPasswordVisible = false
  if (p) p.type = "password"
  if (cp) cp.type = "password"
  resetPasswordTogglesToEmoji()
}

/* ===================== NAVIGATION & MISC ===================== */
function navigateTo(page) {
  window.location.href = page
}

window.onclick = (event) => {
  const modal = document.getElementById("authModal")
  if (event.target === modal) closeAuthModal()
}

document.addEventListener("keydown", (e) => {
  const modal = document.getElementById("authModal")
  if (modal.style.display === "block") {
    if (e.key === "Escape") closeAuthModal()
    if (e.key === "Enter") {
      const active = document.activeElement
      const isTyping = active && (active.tagName === "INPUT" || active.tagName === "TEXTAREA")
      if (isTyping) handleFormSubmit()
    }
  }
})

document.addEventListener("DOMContentLoaded", () => {
  const navItems = document.querySelectorAll(".nav-item")
  const currentPage = window.location.pathname.split("/").pop() || "EduHome.jsp"
  navItems.forEach((item) => {
    item.classList.remove("active")
    const onClick = item.getAttribute("onclick") || ""
    if (onClick.includes(currentPage)) item.classList.add("active")
  })
})

document.querySelector(".search-btn")?.addEventListener("click", () => {
  const searchInput = document.querySelector(".search-bar input")
  const query = searchInput.value.trim()
  if (query) console.log("Searching for:", query)
})

document.querySelectorAll('a[href^="#"]').forEach((anchor) => {
  anchor.addEventListener("click", function (e) {
    const href = this.getAttribute("href")
    if (href !== "#") {
      e.preventDefault()
      const target = document.querySelector(href)
      if (target) target.scrollIntoView({ behavior: "smooth" })
    }
  })
})

function showGroup(el) {
  if (!el) return
  el.style.display = "block"
}

function hideGroup(el) {
  if (!el) return
  el.style.display = "none"
}
