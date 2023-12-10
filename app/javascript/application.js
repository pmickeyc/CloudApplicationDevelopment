import "@hotwired/turbo-rails";
import "./controllers";
import * as bootstrap from "bootstrap";

function initializePage() {
  console.log("Initializing page...");

  // Event delegation for the remove-item functionality
  document.addEventListener("click", function (event) {
    if (event.target.classList.contains("remove-item")) {
      event.preventDefault();
      let row = event.target.closest(".nested-fields");
      if (row) {
        console.log("Remove item clicked.");
        row.remove();
      }
    }
  });

  var addButton = document.getElementById("add-order-line");
  if (addButton) {
    console.log("Add button found. Setting up event listener.");
    addButton.addEventListener("click", function (event) {
      console.log("Add button clicked.");
      event.preventDefault();

      var tableBody = document.querySelector(".table-responsive tbody");
      var newRow = document
        .getElementById("order-line-template")
        .cloneNode(true);
      var newIndex = tableBody.querySelectorAll(
        "tr:not(#order-line-template)"
      ).length;

      newRow.style.display = "";
      newRow.id = ""; // Clear the ID since it's no longer a template

      // Update the name attributes for the form inputs
      newRow.querySelectorAll("select, input").forEach(function (input) {
        input.name = input.name.replace("__INDEX__", newIndex);
      });

      tableBody.appendChild(newRow);
    });
  } else {
    console.log("Add button not found.");
  }

  var sendButton = document.getElementById("send-order-details-button");
  if (sendButton) {
    console.log("Send button found. Setting up event listener.");
    sendButton.addEventListener("click", function () {
      console.log("Send button clicked.");
      var email = prompt("Please enter the recipient's email address:", "");
      if (email != null && email != "") {
        var actionPath = sendButton.getAttribute("data-action-path");
        var authToken = sendButton.getAttribute("data-auth-token");
        sendOrderDetails(email, actionPath, authToken);
      }
    });
  } else {
    console.log("Send button not found.");
  }
}

document.addEventListener("DOMContentLoaded", function () {
  console.log("DOMContentLoaded event triggered.");
  initializePage();
});
document.addEventListener("turbo:load", function () {
  console.log("turbo:load event triggered.");
  initializePage();
});

// import "@hotwired/turbo-rails";
// import "./controllers";
// import * as bootstrap from "bootstrap";

// document.addEventListener("click", function (event) {
//   if (event.target.classList.contains("remove-item")) {
//     event.preventDefault();
//     let row = event.target.closest(".nested-fields");
//     if (row) {
//       row.remove();
//     }
//   }
// });

// document.addEventListener("DOMContentLoaded", function () {
//   var addButton = document.getElementById("add-order-line");
//   if (addButton) {
//     addButton.addEventListener("click", function (event) {
//       event.preventDefault();

//       var tableBody = document.querySelector(".table-responsive tbody");
//       var newRow = document
//         .getElementById("order-line-template")
//         .cloneNode(true);
//       var newIndex = tableBody.querySelectorAll("tr.nested-fields").length;

//       newRow.style.display = "";
//       newRow.id = ""; // Clear the ID since it's no longer a template

//       newRow.querySelectorAll("select, input").forEach(function (input) {
//         input.name = input.name.replace(/\[\d+\]/, "[" + newIndex + "]");
//       });

//       tableBody.appendChild(newRow);
//     });
//   }

//   var sendButton = document.getElementById("send-order-details-button");
//   if (sendButton) {
//     sendButton.addEventListener("click", function () {
//       var email = prompt("Please enter the recipient's email address:", "");
//       if (email != null && email != "") {
//         var actionPath = sendButton.getAttribute("data-action-path");
//         var authToken = sendButton.getAttribute("data-auth-token");
//         sendOrderDetails(email, actionPath, authToken);
//       }
//     });
//   }
// });

function promptForEmailAndSend(orderId) {
  var email = prompt("Please enter the recipient's email address:", "");
  if (email != null && email != "") {
    fetchOrderDetailsAndSend(orderId, email);
  }
}

function fetchOrderDetailsAndSend(orderId, email) {
  fetch(`/orders/${orderId}/order_details_html`)
    .then((response) => response.json())
    .then((data) => {
      if (data && data.html) {
        sendOrderDetails(email, data.html);
      }
    });
}

function sendOrderDetails(email, actionPath, authToken) {
  var form = document.createElement("form");
  form.method = "post";
  form.action = actionPath;

  var emailField = document.createElement("input");
  emailField.type = "hidden";
  emailField.name = "recipient_email";
  emailField.value = email;
  form.appendChild(emailField);

  var authTokenField = document.createElement("input");
  authTokenField.type = "hidden";
  authTokenField.name = "authenticity_token";
  authTokenField.value = authToken;
  form.appendChild(authTokenField);

  document.body.appendChild(form);
  form.submit();
}
