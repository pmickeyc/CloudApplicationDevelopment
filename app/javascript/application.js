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


document.getElementById('add-order-line').addEventListener('click', function(event) {
  event.preventDefault();

  var tableBody = document.querySelector('.table-responsive tbody');
  var newRow = document.getElementById('order-line-template').cloneNode(true);
  var newIndex = tableBody.querySelectorAll('tr.nested-fields').length;

  newRow.style.display = '';
  newRow.id = ''; // Clear the ID since it's no longer a template

  // Update the name attributes with the new index
  newRow.querySelectorAll('select, input').forEach(function(input) {
    input.name = input.name.replace(/\[\d+\]/, '[' + newIndex + ']');
  });

  tableBody.appendChild(newRow);
});
