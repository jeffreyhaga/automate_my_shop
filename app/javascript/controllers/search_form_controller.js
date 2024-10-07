import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="search-form"
export default class extends Controller {
  search() {
    console.log("Search triggered");
  }
}
