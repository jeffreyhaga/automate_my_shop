import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="search-form"
export default class extends Controller {
  static targets = ["form", "input", "output"];

  search() {
    clearTimeout(this.timeout);
    this.timeout = setTimeout(() => {
      this.formTarget.requestSubmit();
    }, 200);
  }
}
