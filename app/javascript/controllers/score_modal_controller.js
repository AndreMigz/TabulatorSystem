import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="score-modal"
export default class extends Controller {
  static targets = ["talentField", "jeansWearField", "sportsWearField", "prelimQaField"];
  static values = { selectedValue: String };
  
  connect() {
    // Don't trigger toggleFields on connect
  }
  toggleFields() {
    var dropdown = document.getElementById("scoreDropdown");
    const selectedValue = dropdown.value;

    const fields = [
      this.talentFieldTarget,
      this.jeansWearFieldTarget,
      this.sportsWearFieldTarget,
      this.prelimQaFieldTarget,
    ];
    
    fields.forEach((field, index) => {
      if (field) {
        if (index.toString() === selectedValue) {
          field.classList.remove("d-none");
        } else {
          field.classList.add("d-none");
        }
      }
    });
  }
  handleChange(event) {
    this.selectedValueValue = event.target.value;
    this.toggleFields();
  }
}
