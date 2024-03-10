import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="servings"
export default class extends Controller {
  static targets = ["servingsNumber", "ingredientQuantity"]

  connect() {
    this.updateQuantities()
  }

  minus() {
    if (!this.servingsNumberTarget.value || this.servingsNumberTarget.value < 1 || this.servingsNumberTarget.value > 30) {
      this.servingsNumberTarget.value = parseFloat(this.data.get("defaultServings"))
    } else if (this.servingsNumberTarget.value > 1) {
      this.servingsNumberTarget.value = parseFloat(this.servingsNumberTarget.value) - 1
    }

    this.updateQuantities()
  }

  plus() {
    if (!this.servingsNumberTarget.value || this.servingsNumberTarget.value < 1 || this.servingsNumberTarget.value > 30) {
      this.servingsNumberTarget.value = parseFloat(this.data.get("defaultServings"))
    } else if (this.servingsNumberTarget.value < 30) {
      this.servingsNumberTarget.value = parseFloat(this.servingsNumberTarget.value) + 1
    }

    this.updateQuantities()
  }

  updateQuantities() {
    let servings = parseFloat(this.servingsNumberTarget.value);

    this.ingredientQuantityTargets.forEach(element => {
      const defaultServings = parseFloat(this.data.get("defaultServings"));
      if (!servings || servings < 1 || servings > 30) { servings = defaultServings }
      const defaultQuantity = parseFloat(element.dataset.defaultQuantity);
      const currentQuantity = defaultQuantity * (servings / defaultServings);
      element.textContent = Math.round(currentQuantity * 2) / 2;
    });
  }
}
