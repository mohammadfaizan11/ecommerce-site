<%-- 
    Document   : newone
    Created on : 23 Mar, 2024, 12:51:08 PM
    Author     : VICTUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Invoice Calculator</title>
</head>
<body>
  <h1>Invoice Calculator</h1>
  <table>
    <thead>
      <tr>
        <th>Item</th>
        <th>Quantity</th>
        <th>Rate</th>
        <th>Amount</th>
      </tr>
    </thead>
    <tbody id="invoiceItems">
      <!-- Invoice items will be populated here dynamically -->
    </tbody>
  </table>
  <p>Total: <span id="totalAmount"></span></p>

  <script>
    // Function to calculate invoice amount and total
    function calculateInvoice() {
      const items = document.querySelectorAll('.invoice-item');
      let totalAmount = 0;

      items.forEach(item => {
        const qty = parseFloat(item.querySelector('.qty').value);
        const rate = parseFloat(item.querySelector('.rate').value);
        const amount = qty * rate;
        item.querySelector('.amount').textContent = amount.toFixed(2);
        totalAmount += amount;
      });

      document.getElementById('totalAmount').textContent = totalAmount.toFixed(2);
    }

    // Fetch data from the server and populate invoice items
    fetch('/invoice-items')
      .then(response => response.json())
      .then(data => {
        const items = data.items;
        const invoiceItemsContainer = document.getElementById('invoiceItems');

        items.forEach(item => {
          const row = document.createElement('tr');
          row.classList.add('invoice-item');
          row.innerHTML = `
            <td>${item.name}</td>
            <td><input type="number" class="qty" value="${item.qty}" onchange="calculateInvoice()"></td>
            <td><input type="number" class="rate" value="${item.rate}" onchange="calculateInvoice()"></td>
            <td class="amount">${(item.qty * item.rate).toFixed(2)}</td>
          `;
          invoiceItemsContainer.appendChild(row);
        });

        // Calculate invoice for the first time
        calculateInvoice();
      })
      .catch(error => console.error('Error fetching data:', error));
  </script>
</body>
</html>
    </body>
</html>
