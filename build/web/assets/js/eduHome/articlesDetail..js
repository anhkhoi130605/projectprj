// Article Detail Page Functions

function toggleLike(button) {
  const likeCount = button.querySelector(".like-count")
  const currentCount = Number.parseInt(likeCount.textContent)

  if (button.classList.contains("liked")) {
    button.classList.remove("liked")
    likeCount.textContent = currentCount - 1
  } else {
    button.classList.add("liked")
    likeCount.textContent = currentCount + 1
  }
}

function toggleComments() {
  const commentsSection = document.querySelector(".comments-section")
  if (commentsSection) {
    commentsSection.style.display = commentsSection.style.display === "none" ? "block" : "none"
  }
}

function filterRelatedArticles(button) {
  // Remove active class from all tabs
  const tabs = document.querySelectorAll(".topic-filter-tab")
  tabs.forEach((tab) => tab.classList.remove("active"))

  // Add active class to clicked tab
  button.classList.add("active")

  // Filter logic would go here
  console.log("[v0] Filtering articles by topic:", button.textContent)
}

// Initialize page
document.addEventListener("DOMContentLoaded", () => {
  console.log("[v0] Article detail page loaded")
})
