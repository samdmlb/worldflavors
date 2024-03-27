import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="cookbook-grid"
export default class extends Controller {
  static targets = ["recipeGrid", "recipeContainer", "recipePhoto", "recipeName"]

  displaySingle() {
    this.recipeGridTarget.classList.remove("display-grid")

    this.recipeContainerTargets.forEach(container => {
        container.classList.remove("recipe-container-grid");
        container.classList.add("recipe-container");
    });

    this.recipePhotoTargets.forEach(photo => {
        photo.classList.remove("recipe-img-grid");
        photo.classList.add("recipe-img");
    });

    this.recipeNameTargets.forEach(name => {
        name.classList.remove("recipe-name-grid");
        name.classList.add("recipe-name");
    });
}

displayGrid() {
    this.recipeGridTarget.classList.add("display-grid")

    this.recipeContainerTargets.forEach(container => {
        container.classList.remove("recipe-container");
        container.classList.add("recipe-container-grid");
    });

    this.recipePhotoTargets.forEach(photo => {
        photo.classList.remove("recipe-img");
        photo.classList.add("recipe-img-grid");
    });

    this.recipeNameTargets.forEach(name => {
        name.classList.remove("recipe-name");
        name.classList.add("recipe-name-grid");
    });
}
}
