import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="cookbook"
export default class extends Controller {
  static targets = ["made", "bookmark", "renderMade", "renderBookmark"]

  madeSelect() {
    this.madeTarget.classList.remove("cookbook-btn")
    this.madeTarget.classList.add("cookbook-btn-active")

    this.bookmarkTarget.classList.remove("cookbook-btn-active")
    this.bookmarkTarget.classList.add("cookbook-btn")

    this.renderMadeTarget.classList.remove("d-none")
    this.renderBookmarkTarget.classList.add("d-none")
  }

  bookmarkSelect() {
    this.madeTarget.classList.add("cookbook-btn")
    this.madeTarget.classList.remove("cookbook-btn-active")

    this.bookmarkTarget.classList.add("cookbook-btn-active")
    this.bookmarkTarget.classList.remove("cookbook-btn")

    this.renderMadeTarget.classList.add("d-none")
    this.renderBookmarkTarget.classList.remove("d-none")
  }
}
