import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
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
}
