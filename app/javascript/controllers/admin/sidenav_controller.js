import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="admin--sidenav"
export default class extends Controller {
  connect() {
    if (window.innerWidth <= 768) {
      this.toggle();
    }
  }

  toggle()  {
    const sidebar = document.querySelector(".sidebar");
    const mainContent = document.querySelector(".main-content");
    const sidenav = document.querySelector(".sidenav");

    sidebar.classList.toggle("collapsed");
    sidenav.classList.toggle("d-none");
    mainContent.classList.toggle("w-100");
  }
}
