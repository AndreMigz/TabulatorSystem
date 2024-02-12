import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["talentField", "jeansWearField", "sportsWearField", "prelimQaField"];
  static values = { selectedValue: String };

  connect() {
    // Don't trigger toggleFields on connect
  }

  toggleFields() {
    const dropdown = document.getElementById("scoreDropdown");
    const selectedValue = dropdown.value;

    const fields = {
      "0": this.talentFieldTargets,
      "1": this.jeansWearFieldTargets,
      "2": this.sportsWearFieldTargets,
      "3": this.prelimQaFieldTargets,
    };

    Object.entries(fields).forEach(([index, fieldTargets]) => {
      fieldTargets.forEach((field) => {
        if (index === selectedValue) {
          field.classList.remove("d-none");
        } else {
          field.classList.add("d-none");
        }
      });
    });
  }

  handleChange(event) {
    this.selectedValueValue = event.target.value;
    this.toggleFields();
  }
}
