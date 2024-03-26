import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="bookmarks"
export default class extends Controller {
  static targets = ["bookmarkButton"];

  connect() {
    console.log("connexion du controller Stimulus bookmarks");
    }


  isBookmark(event) {
    event.preventDefault();

    console.log("hello from isBookmark")
    console.log("Élément DOM actuel :", this.bookmarkButtonTarget);

    // Récupérer l'ID de la peinture depuis l'élément
    const recipeId = this.bookmarkButtonTarget.getAttribute("data-recipe-id");
    console.log("ID de la peinture :", recipeId);

    // VERIFIER SI LA recipeID EST FAVORITED_BY LE CURRENT USER
    // Récupérer l'id de l'utilisateur actuel
    const userId = document.getElementById('bookmarks').dataset.userId;
    console.log("ID de l'utilisateur actuellement connecté :", userId)

    // Effectuer une requête Ajax pour récupérer les favoris de l'utilisateur actuel
    fetch('/my_bookmarks', {
      method: 'GET',
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]').content
      }})
      .then(response => response.json())
      .then(data => {
        console.log("Bookmarks de l'utilisateur actuel :", data);
        // Extraire les recipe_id de chaque élément dans data
        const bookmarksRecipeIds = data.map(bookmark => bookmark.recipe_id);
        console.log("ID des recettes bookmarked de l'utilisateur actuel :", bookmarksRecipeIds);

        // Extraire la constante favoriteId où recipeId est égal à recipe_id
        // const favoriteId = data.find(favorite => favorite.recipe_id === parseInt(recipeId)).id;
        // console.log("NOUVEAU - favoriteID de la peinture sur laquelle l'utilisateur a cliqué :", favoriteId);

        // // Vérifier si le recipeId est dans l'array favoritesrecipeIds
        // if (favoritesrecipeIds.includes(parseInt(recipeId))) {
        //   console.log("isFavorite : true");
        // } else {
        //   console.log("isFavorite : false");
        // }

        // Vérifier si le recipeId est dans l'array favoritesrecipeIds
        const isBookmark = bookmarksRecipeIds.includes(parseInt(recipeId));
        console.log("La recette est bookmark :", isBookmark);

             // Utiliser la valeur de retour pour effectuer d'autres actions si nécessaire
        if (isBookmark) {
          console.log("isBookmark : true");
          // Extraire la constante favoriteId où recipeId est égal à recipe_id
          const bookmarkId = data.find(bookmark => bookmark.recipe_id === parseInt(recipeId)).id;
          console.log("NOUVEAU - bookmarkID de la recette sur laquelle l'utilisateur a cliqué :", bookmarkId);
           // Supprimer le favori (appeler la méthode destroy)
          this.bookmarkButtonTarget.classList.remove('bookmark-active');
          this.bookmarkButtonTarget.classList.add('bookmark-inactive');
          this.destroyBookmark(recipeId, bookmarkId);
        } else {
          // Effectuer des actions pour une peinture qui n'est pas un favori
          console.log("isBookmark : false");
          // Créer le favori
          this.bookmarkButtonTarget.classList.add('bookmark-active');
          this.bookmarkButtonTarget.classList.remove('bookmark-inactive');
          this.createBookmark(recipeId, userId);
        }
      });
  }

  createBookmark(recipeId, userId) {
    // const recipeId = this.favoriteButtonTarget.getAttribute("data-recipe-id");
    // const userId = document.getElementById('favorites').dataset.userId;

    // Vérifier la valeur de recipeId
    console.log("Vérifier l'ID de la peinture:", recipeId);

    fetch(`/recipes/${recipeId}/bookmarks`, {
      method: 'POST',
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]').content
      },
      body: JSON.stringify({
        bookmark: {
          recipe_id: recipeId,
          user_id: userId
        }
      })
    })
    .then(response => response.json())
    .then(data => {
      console.log("Favori créé pour l'utilisateur actuel :", data);
      console.log("ID du favori créé:", data.id);
      console.log("ID de la peinture:", recipeId);
      console.log('Favori créé avec succès');
    })
  }


  destroyBookmark(recipeId, bookmarkId) {
        // Vérifier la valeur de recipeId
        console.log("Vérifier l'ID de la peinture:", recipeId);
        // Vérifier la valeur de favoriteId
        console.log("Vérifier l'ID du favori qu'on va supprimer:", bookmarkId);

        fetch(`/recipes/${recipeId}/bookmarks/${bookmarkId}`, {
          method: 'DELETE',
          headers: {
            'Content-Type': 'application/json',
            'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]').content
          }
        })
        .then(response => response.json())
        .then(data => {
          console.log("Favori supprimé pour l'utilisateur actuel :", data);
          console.log("ID du favori supprimé:", bookmarkId);
          console.log("ID de la peinture:", recipeId);
          console.log('Favori supprimé avec succès');
        })
      }


  }
