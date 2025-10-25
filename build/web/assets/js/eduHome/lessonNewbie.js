// Toggle chapter expand/collapse
function toggleChapter(headerElement) {
  const chapter = headerElement.closest(".chapter")
  const content = chapter.querySelector(".chapter-content")
  const icon = headerElement.querySelector(".chapter-icon")

  const isExpanded = content.style.display !== "none"

  if (isExpanded) {
    content.style.display = "none"
    icon.textContent = "+"
  } else {
    content.style.display = "block"
    icon.textContent = "−"
  }
}

// Expand all chapters
document.addEventListener("DOMContentLoaded", () => {
  const expandAllLink = document.querySelector(".expand-all")
  if (expandAllLink) {
    expandAllLink.addEventListener("click", (e) => {
      e.preventDefault()
      const chapters = document.querySelectorAll(".chapter")
      const allExpanded = Array.from(chapters).every(
        (ch) => ch.querySelector(".chapter-content").style.display !== "none",
      )

      chapters.forEach((chapter) => {
        const content = chapter.querySelector(".chapter-content")
        const icon = chapter.querySelector(".chapter-icon")

        if (allExpanded) {
          content.style.display = "none"
          icon.textContent = "+"
        } else {
          content.style.display = "block"
          icon.textContent = "−"
        }
      })

      expandAllLink.textContent = allExpanded ? "Mở rộng tất cả" : "Thu gọn tất cả"
    })
  }
})
