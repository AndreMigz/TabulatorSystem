import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="flash-message"
export default class extends Controller {
  connect() {
    $('.flash-message').delay(3000).fadeOut();
  }
}
