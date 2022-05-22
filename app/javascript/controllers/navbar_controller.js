import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["watchlist"]

  connect() {

  }

  changeBackground() {
    if (window.scrollY >= 450) {
      this.element.classList.add("bg-strongblue")
    }
    else {
      this.element.classList.remove("bg-strongblue")
    }
  }

  changeNavbarComponents() {
    if (window.screen.width <= 576) {
      this.watchlistTarget.innerText = ""
    }
    else {
      this.watchlistTarget.innerText = "WATCHLIST"
    }
  }
}
