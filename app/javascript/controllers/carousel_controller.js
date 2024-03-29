// controller du caroussel de la Home

import { Controller } from "@hotwired/stimulus"


// Connects to data-controller="carousel-controller.js"
export default class extends Controller {
  static targets = ["slide"];

 connect() {
    this.index = 0;
    this.showSlide();
  }

  next() {
    this.index = (this.index + 1) % this.slideTargets.length;
    this.showSlide();
  }

  previous() {
    this.index = (this.index - 1 + this.slideTargets.length) % this.slideTargets.length;
    this.showSlide();
  }

  showSlide() {
    this.slideTargets.forEach((slide, i) => {
      slide.classList.toggle("active", i === this.index);
    });
  }
}
