import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "cardContainer" ]

  connect() {
    console.log("CardAnimationController connected!");
  }

  spin(event) {
    event.preventDefault(); // Prevent the default form submission

    this.cardContainerTarget.classList.add("[transform:rotateY(180deg)]");
    setTimeout(() => {
      this.cardContainerTarget.classList.remove("[transform:rotateY(180deg)]");
      // Manually submit the form after the animation
      event.target.form.requestSubmit();
    }, 800); // 800ms delay for the animation
  }
}