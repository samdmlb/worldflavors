import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="xp-bar"
export default class extends Controller {
  static targets = ["xpAnimation", "xpWon1", "xpWon2", "xpBefore", "displayLvl", "plusXp"]

  connect() {
    this.setValues();

    setTimeout(() => {
      this.plusXpAnimation();
    }, 3500);

    setTimeout(() => {
      this.xpBarAnimation();
    }, 4000);
  }

  xpBarAnimation() {
    const userXp = this.element.dataset.userXp;
    const recipeXp = this.element.dataset.recipeXp;
    const userXpModulo = userXp % 500;
    const userLvl = Math.floor((userXp / 500) + 1);

    if (userXpModulo < recipeXp) {
      const numXpStart = (userXp - recipeXp) % 500;

      this.displayLvlTarget.textContent = "LVL " + (userLvl - 1);
      this.xpWon1Target.style.width = Math.floor((500 - numXpStart) * 0.2) + "%";

      this.xpNumberAnimation(numXpStart, 500);

      setTimeout(() => {
        this.xpWon1Target.classList.add("d-none");
        this.xpWon2Target.style.width = Math.floor(userXpModulo * 0.2) + "%";
        this.xpBeforeTarget.style.width = "0%";
        this.displayLvlTarget.textContent = "LVL " + userLvl;

        this.displayLvlTarget.classList.toggle("grow");
        setTimeout(() => {
          this.displayLvlTarget.classList.toggle("grow");
        }, 500);


        this.xpNumberAnimation(0, userXpModulo);

      }, 2000);

    } else {
      const numXpStart = userXpModulo - recipeXp;
      const numXpEnd =  userXpModulo;

      this.xpWon1Target.style.width = Math.floor(recipeXp * 0.2) + "%";
      this.displayLvlTarget.textContent = "LVL " + userLvl;

      this.xpNumberAnimation(numXpStart, numXpEnd);
    }
  }

  xpNumberAnimation(numXpStart, numXpEnd) {
    const startNumber = numXpStart;
    const endNumber = numXpEnd;
    const duration = 1800;

    const startTime = performance.now();

    const updateNumber = (currentTime) => {
      const elapsedTime = currentTime - startTime;
      const progress = Math.min(1, elapsedTime / duration);
      const currentValue = Math.floor(startNumber + (endNumber - startNumber) * progress);

      this.xpAnimationTarget.textContent = currentValue;

      if (progress < 1) {
        requestAnimationFrame(updateNumber);
      }
    };

    requestAnimationFrame(updateNumber);
  }

  setValues() {
    const userXp = this.element.dataset.userXp;
    const recipeXp = this.element.dataset.recipeXp;
    const userXpModulo = userXp % 500;
    const userLvl = Math.floor((userXp / 500) + 1);

    if (userXpModulo < recipeXp) {
      this.xpBeforeTarget.style.width = Math.floor(((userXp - recipeXp) % 500) * 0.2) + "%";
      this.xpAnimationTarget.textContent = (userXp - recipeXp) % 500;
      this.displayLvlTarget.textContent = "LVL " + (userLvl - 1);
    } else {
      this.xpBeforeTarget.style.width = Math.floor((userXpModulo - recipeXp) * 0.2) + "%";
      this.xpAnimationTarget.textContent = userXpModulo - recipeXp;
      this.displayLvlTarget.textContent = "LVL " + userLvl;
    }
  }

  plusXpAnimation() {
    const recipeXp = this.element.dataset.recipeXp;

    this.plusXpTarget.textContent = "+" + recipeXp + "XP";

    this.plusXpTarget.classList.toggle("grow");
    if (this.plusXpTarget.classList.contains("grow")) {
      setTimeout(() => {
        this.plusXpTarget.classList.toggle("normal");
      }, 500);
    } else {
      this.plusXpTarget.classList.toggle("normal");
    }
  }
}
