import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "cardContainer" ]

  connect() {
    console.log("CardAnimationController connected!");
  }

  spin() {
    this.cardContainerTarget.classList.add("[transform:rotateY(180deg)]");
    setTimeout(() => {
      this.cardContainerTarget.classList.remove("[transform:rotateY(180deg)]");
    }, 800)
  }
}