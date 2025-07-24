import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["playerItem", "checkbox"]

  connect() {
    this.updateSelectedClasses()
  }

  toggle(event) {
    const item = event.currentTarget
    const checkbox = item.querySelector('input[type="checkbox"]')
    checkbox.checked = !checkbox.checked
    this.updateSelectedClasses()
  }

  updateSelectedClasses() {
    this.playerItemTargets.forEach(item => {
      const checkbox = item.querySelector('input[type="checkbox"]')
      if (checkbox.checked) {
        item.classList.add("bg-blue-200", "dark:bg-blue-600", "hover:bg-blue-300", "dark:hover:bg-blue-700")
        item.classList.remove("bg-white", "dark:bg-gray-900", "hover:bg-gray-200", "dark:hover:bg-gray-700")
      } else {
        item.classList.remove("bg-blue-200", "dark:bg-blue-600", "hover:bg-blue-300", "dark:hover:bg-blue-700")
        item.classList.add("bg-white", "dark:bg-gray-900", "hover:bg-gray-200", "dark:hover:bg-gray-700")
      }
    })
  }
}
