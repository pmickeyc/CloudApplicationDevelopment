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

  let tableBody = document.querySelector('.table-responsive tbody');
  let newRow = document.getElementById('order-line-template').cloneNode(true);
  let index = tableBody.querySelectorAll('.nested-fields').length - 1; // Calculate new index

  newRow.style.display = '';
  newRow.querySelectorAll('select, input').forEach(input => {
    input.name = input.name.replace('[]', '[' + index + ']');
  });

  tableBody.appendChild(newRow);
});
