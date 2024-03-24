import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["modal", "filter", "preptime", "difficulty", "query", "modalBody", "modalHeader"];

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

  // async submitForm(event) {
  //   event.preventDefault();
  //   await this.fetchSearchResults();
  //   this.openModal();
  // }

  // async fetchSearchResults() {
  //   const preptimeValue = this.element.querySelector('input[name="preptime"]:checked').value;
  //   const difficultyValue = this.element.querySelector('input[name="difficulty"]:checked').value;
  //   const queryValue = this.queryTarget.value;

  //   try {
  //     const response = await fetch(`/recipes?preptime=${preptimeValue}&difficulty=${difficultyValue}&query=${queryValue}`, {
  //       method: "GET",
  //       headers: {
  //         "Content-Type": "application/json",
  //         "X-CSRF-Token": document.querySelector('meta[name="csrf-token"]').getAttribute('content'),
  //         "Accept": "application/json"
  //       }
  //     });

  //     if (!response.ok) {
  //       throw new Error('Network response was not ok');
  //     }

  //     const data = await response.json();
  //     console.log(data);
  //   } catch (error) {
  //     console.error('Error:', error);
  //   }
  // }
}


// UTILISER AJAX POUR OPTIMISER
// fetch = recherche asynchrone pour n epas recharger toute la page
// mettre un data-action sur le submit du formulaire
// dnas l'action coté stimulus (ds la méthode liée à cette action)
//      recupérer la valeur de l'input
//      fetch la route de l'index recipes (url recipes? ==> passer la query (interpoler la valeur de l'input) )
// côté index / controller rails .rb
//      renvoyer une partiale qui contient les résultats de la recherche en JSON
// côté Stimulus, dans le .zen du fetch
//      insérer la partiale dans le DOM
// VOIR AJAX IN RAILS
// --> permet de charger la modale sans charger la carte une deuxième fois
//  optimiser pour la finale
