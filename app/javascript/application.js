import "@hotwired/turbo-rails";
import "./controllers";
import * as bootstrap from "bootstrap";

document.addEventListener("click", function (event) {
  if (event.target.classList.contains("remove-item")) {
    event.preventDefault();
    let row = event.target.closest(".nested-fields");
    if (row) {
      row.remove();
    }
  }
});

document.addEventListener("DOMContentLoaded", function () {
  document
    .getElementById("add-order-line")
    .addEventListener("click", function (event) {
      event.preventDefault();

      let tableBody = document.querySelector(".table-responsive tbody");
      let newRow = document
        .getElementById("order-line-template")
        .cloneNode(true);

      newRow.id = ""; // Remove the ID as it's no longer a template
      newRow.style.display = ""; // Make the row visible

      // Reset the input fields in the new row
      newRow.querySelectorAll("input").forEach((input) => {
        input.value = "";
        // Update names to ensure unique attributes for form submission
        input.name = input.name.replace(
          /\[\d+\]/,
          "[" + (tableBody.children.length - 1) + "]"
        );
      });

      tableBody.appendChild(newRow);
    });

  document.addEventListener("click", function (event) {
    if (event.target.classList.contains("remove-item")) {
      event.preventDefault();
      let row = event.target.closest(".nested-fields");
      if (row) {
        row.remove();
      }
    }
  });
});