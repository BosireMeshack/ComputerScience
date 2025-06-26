document.addEventListener("DOMContentLoaded", function () {
    const bookingForm = document.getElementById("bookingForm");
    if (!bookingForm) return;
  
    const listingId = new URLSearchParams(window.location.search).get("id");
    const bookingApi = "http://localhost:8003/bookings";
  
    bookingForm.addEventListener("submit", function (e) {
      e.preventDefault();
  
      const bookingData = {
        listing_id: listingId,
        start_date: document.getElementById("checkIn").value,
        end_date: document.getElementById("checkOut").value,
        guest_info: {
          first_name: document.getElementById("firstName").value,
          last_name: document.getElementById("lastName").value,
          email: document.getElementById("email").value,
          phone: document.getElementById("phoneNumber").value,
          home_country: document.getElementById("homeCountry").value,
          adults: parseInt(document.getElementById("guests").value, 10),
          children: parseInt(document.getElementById("children")?.value || "0", 10)
        }
      };
  
      fetch(bookingApi, {
        method: "POST",
        headers: {
          "Content-Type": "application/json"
        },
        body: JSON.stringify(bookingData)
      })
        .then(response => {
          if (!response.ok) {
            return response.json().then(err => {
              throw new Error(err.error || "Booking failed");
            });
          }
          return response.json();
        })
        .then(data => {
          alert("Booking successful!");
          console.log("Booking response:", data);
          
          alert(`Booking ID: ${data.id}\nTotal Price: Ksh ${data.total_price}`);
          bookingForm.reset(); 
        })
        .catch(err => {
          console.error("Booking error:", err);
          alert("Booking failed: " + err.message);
        });
    });
  });
  