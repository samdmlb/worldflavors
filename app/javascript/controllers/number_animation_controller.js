import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="number-animation"
export default class extends Controller {
  static targets = ["recipeNameContent", "recipeNameText", "recipeNameDiv", "overlay", "congrats"]

  connect() {
    this.overlayAnimation();
    setTimeout(() => {
      this.nameAnimation();
      this.confetti()
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

  confetti() {
    const badgeEmojis = {
      "Badge 1h": ['1️⃣', '🕛'],
      "Badge 5h": ['5️⃣', '🕛'],
      "Badge 10h": ['1️⃣', '0️⃣', '🕛'],
      "Badge 15h": ['1️⃣', '5️⃣', '🕛'],
      "Badge 20h": ['2️⃣', '0️⃣', '🕛'],
      "Badge 25h": ['2️⃣', '5️⃣', '🕛'],

      "Level 5": ['5️⃣', '⭐', '🎉'],
      "Level 10": ['1️⃣', '0️⃣', '⭐', '🎉'],
      "Level 15": ['1️⃣', '5️⃣', '⭐', '🎉'],
      "Level 20": ['2️⃣', '0️⃣', '⭐', '🎉'],
      "Level 25": ['2️⃣', '5️⃣', '⭐', '🎉'],

      "Vegetarian cook": ['🫑', '🍆', '🧅', '🍅'],
      "Badge Pork": ['🐷', '🐖', '🥓'],
      "Badge Beef": ['🐮', '🥩', '🍖'],
      "Badge Chicken": ['🐔', '🐓', '🍗'],
      "Badge Vegan": ['🥒', '🧄', '🥕', '🥬'],
      "Badge Dessert": ['🍰', '🍨', '🧁', '🍩'],
      "Badge Duck": ['🦆', '🍗'],
      "Badge Fish": ['🐟', '🍣'],

      "French cook": ['🇫🇷'],
      "Italian cook": ['🇮🇹'],
      "Belgian cook": ['🇧🇪'],
      "German cook": ['🇩🇪'],
      "Greek cook": ['🇬🇷'],
      "Irish cook": ['🇮🇪'],
      "Portuguese cook": ['🇵🇹'],
      "Spanish cook": ['🇪🇸'],
      "British cook": ['🇬🇧'],
      "Swiss cook": ['🇨🇭'],
      "Polish cook": ['🇵🇱'],
      "Norwegian cook": ['🇳🇴'],
      "Swedish cook": ['🇸🇪'],
      "Dutch cook": ['🇳🇱'],
      "Danish cook": ['🇩🇰'],
      "Icelandic cook": ['🇮🇸'],
      "Bulgarian cook": ['🇧🇬'],

      "Easy": ['😁'],
      "Medium": ['😐'],
      "Hard": ['🫠'],
    }

    const badgesArray = this.element.dataset.badges.split(", ")

    const emojisArray = badgesArray.map(badge => badgeEmojis[badge])


    const jsConfetti = new JSConfetti();

    jsConfetti.addConfetti({
      emojis: emojisArray.flat()
    });
  }
}
