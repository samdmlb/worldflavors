import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="search-modal"
export default class extends Controller {
  static targets = ["modal", "filter"]

  connect() {
    if (window.location.search) { this.openModal(); }
  }

  openModal() {
    const bootstrapModal = new bootstrap.Modal(this.modalTarget);
    bootstrapModal.show();
  }

  toggle() {
    this.filterTarget.classList.toggle("d-none");
  }
}
