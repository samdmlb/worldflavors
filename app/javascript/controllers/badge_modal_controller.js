import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="badge-modal"
export default class extends Controller {

  openModal(event) {
    const button = event.currentTarget;
    const buttonNumber = button.getAttribute('data-button-number');
    const modal = new bootstrap.Modal(document.getElementById('badge-modal'));

    this.slotNumber = buttonNumber;

    modal.show();
  }

  selectBadge(event) {
    const badgeIcon = event.currentTarget;
    let badgeId = badgeIcon.getAttribute('data-badge-id');
    let slotNumber = this.slotNumber;

    fetch(`/update_user_badge/${badgeId}`, {
      method: "PATCH",
      headers: {
        "Content-Type": "application/json",
        "X-CSRF-Token": document.querySelector('meta[name="csrf-token"]').getAttribute('content')
      },
      body: JSON.stringify({ slotNumber: slotNumber })
    }).then(response => {
        window.location.reload();
    });
  }
}
