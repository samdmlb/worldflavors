import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="dropdown-dashboard"
export default class extends Controller {
  static targets = ["menu"]
  connect() {
  }

  toggle() {
    this.menuTarget.classList.toggle("d-none");
  }
}
