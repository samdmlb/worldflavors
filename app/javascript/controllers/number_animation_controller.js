import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="number-animation"
export default class extends Controller {
  static targets = ["recipeNameContent", "recipeNameText", "recipeNameDiv", "overlay"]

  connect() {
    this.overlayAnimation();

    setTimeout(() => {
      this.nameAnimation();
    }, 1500);
  }

  overlayAnimation() {
    const overlay = this.overlayTarget;

    overlay.offsetHeight;
    overlay.style.opacity = 0;
  }

  nameAnimation() {
    const spanWidth = parseFloat(this.recipeNameTextTarget.offsetWidth) + 10;

    this.recipeNameDivTarget.style.width = spanWidth + "px";
    this.recipeNameContentTarget.style.transition = "width 2s";
    this.recipeNameContentTarget.style.width = spanWidth + "px";
  }
}
