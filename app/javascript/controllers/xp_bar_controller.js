import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="xp-bar"
export default class extends Controller {
  static targets = ["xpWon"]

  connect() {
    setTimeout(() => {
      this.xpWonTarget.style.width = this.element.dataset.xpValue
    }, 100);
  }
}
