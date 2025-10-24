// Articles Page JavaScript

function filterByTopic(element) {
  // Remove active class from all tabs
  const tabs = document.querySelectorAll(".topic-tab")
  tabs.forEach((tab) => tab.classList.remove("active"))

  // Add active class to clicked tab
  element.classList.add("active")

  // Get the topic name
  const topic = element.textContent.trim()
  console.log("[v0] Filtering articles by topic:", topic)

  // Here you would typically filter the articles based on the selected topic
  // For now, this is a placeholder for the filtering logic
}

// Initialize active tab on page load
document.addEventListener("DOMContentLoaded", () => {
  const firstTab = document.querySelector(".topic-tab")
  if (firstTab) {
    firstTab.classList.add("active")
  }
})
