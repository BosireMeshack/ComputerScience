document.getElementById("search-btn").addEventListener("click", function(event) {
    event.preventDefault();
  
    const location = document.getElementById("location").value.trim().toLowerCase();
    const resultsContainer = document.getElementById("search-results");
    const template = document.getElementById("listing-template");
    const backendBase = "http://localhost:5002"; 
    const getMediaUrl = (path) => `${backendBase}${path}`;
    const frontendBase = window.location.origin + "/project/frontend/";

  
    // Hide homepage listings
    const homepageListings = document.querySelectorAll(".homepage-listing");
    homepageListings.forEach(el => el.style.display = "none");
  
    fetch(`${backendBase}/listings`)
      .then(res => res.json())
      .then(data => {
        const filtered = location
          ? data.filter(l => l.location.toLowerCase().includes(location))
          : data;
  
        resultsContainer.innerHTML = "";
  
        if (filtered.length === 0) {
          resultsContainer.innerHTML = "<p>No listings found.</p>";
          return;
        }
  
        filtered.forEach(listing => {
          const card = template.content.cloneNode(true);
  
          const link = card.querySelector("a");
          const img = card.querySelector("img");
          const priceBadge = card.querySelector(".price-badge");
          const title = card.querySelector(".title");
          const locationElem = card.querySelector(".location");
          const stars = card.querySelector(".stars");
          const features = card.querySelector(".features");
  
          if (link && img && priceBadge && title && locationElem && stars && features) {
            link.href = `${frontendBase}assets/pages/explore.html?id=${listing.id}`;
            img.src = getMediaUrl(listing.image); 
            img.alt = listing.title || "Listing image";
  
            priceBadge.textContent = `Ksh. ${listing.price_per_night} / night`;
            title.textContent = listing.title;
            locationElem.innerHTML = `<i class="bi bi-geo-alt-fill"></i> ${listing.location}`;
            stars.textContent = `${listing.reviews} reviews`;
            features.innerHTML = `
              <i class="fa fa-bed me-1" style="font-size:18px"></i> ${listing.bedrooms} Bedrooms
              <i class="fa fa-bath ms-3 me-1" style="font-size:18px"></i> ${listing.bathrooms} Bathrooms
              <i class="bi bi-car-front ms-3"></i> ${listing.parking ? "Yes" : "No"}
            `;
  
            resultsContainer.appendChild(card);
          } else {
            console.error("Error: One or more elements not found in the template.");
          }
        });
      })
      .catch(err => {
        console.error("Error fetching listings:", err);
        resultsContainer.innerHTML = "<p>Error loading listings.</p>";
      });
  });
  