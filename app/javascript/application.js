// Inside app/javascript/application.js  
import "@hotwired/turbo-rails"  
import "./controllers"  
import * as bootstrap from "bootstrap"  

document.addEventListener("DOMContentLoaded", () => {
  const addItemButton = document.getElementById('add-item');
  if (addItemButton) {
    addItemButton.addEventListener('click', (e) => {
      e.preventDefault();
      var tableBody = document.querySelector("#order-items-table tbody");
      var newRow = document.createElement('tr');
      newRow.innerHTML = `
        <tr class="nested-fields">
          <td><input type="text" name="order[order_items_attributes][][item_name]"></td>
          <td><input type="number" name="order[order_items_attributes][][quantity]" value="1"></td>
          <td><a href="#" class="remove-item btn btn-danger btn-sm">Remove</a></td>
        </tr>
      `;
      tableBody.appendChild(newRow);
    });

    document.querySelector("#order-items-table").addEventListener('click', (e) => {
      if (e.target.classList.contains('remove-item')) {
        e.preventDefault();
        e.target.closest('tr').remove();
      }
    });
  }
});


  