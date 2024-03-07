import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="search-modal"
export default class extends Controller {
  static targets = ["modal"]

  connect() {
    this.openModal();
  }

  openModal() {
    const bootstrapModal = new bootstrap.Modal(this.modalTarget);
    bootstrapModal.show();
  }
}
