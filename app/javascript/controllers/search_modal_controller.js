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
