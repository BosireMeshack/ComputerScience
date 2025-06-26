const urlParams = new URLSearchParams(window.location.search);
const listingId = urlParams.get("id");
const backendBase = "http://localhost:5002"; // Backend base URL
const getMediaUrl = (path) => `${backendBase}${path}`; // Helper
const frontendBase = window.location.origin + "/project/frontend/";


// Fetch individual listing
fetch(`${backendBase}/listings/${listingId}`)
  .then((res) => res.json())
  .then((listing) => {
    const gallerySection = document.getElementById("gallerySection");
    if (!listing || listing.error) {
      gallerySection.innerHTML = `<h3 class="text-danger">Listing not found.</h3>`;
      return;
    }

    const {
      title,
      location,
      bedrooms,
      bathrooms,
      parking,
      image,
      gallery = [],
      reviews,
      mapLink,
      video,
      features = [],
      price_per_night
    } = listing;

    const pricePerDay = price_per_night;

    renderListingVideo(video);
    renderBookingSection(features, pricePerDay);
    renderGallery(title, location, bedrooms, bathrooms, parking, image, gallery, reviews, mapLink);

    // Fetch and render similar listings
    fetch(`${backendBase}/listings`)
      .then(res => res.json())
      .then(allListings => {
        const similarListings = allListings.filter(l => l.id !== listingId);
        renderSimilarListings(similarListings);
      });

    setupBookingCostCalc(pricePerDay);
  })
  .catch((err) => {
    console.error("Error loading listing:", err);
    document.getElementById("gallerySection").innerHTML = `<p class="text-danger">Could not load listing.</p>`;
  });

function renderListingVideo(videoUrl) {
  const videoSection = document.getElementById("videoSection");
  if (!videoSection || !videoUrl) return;

  let videoHTML = videoUrl.includes("youtube.com")
    ? `<div class="ratio ratio-16x9"><iframe src="${videoUrl}" title="Listing Video" allowfullscreen class="rounded shadow-sm"></iframe></div>`
    : `<video controls class="w-100 rounded shadow-sm" style="height: 70vh; object-fit: cover;">
         <source src="${getMediaUrl(videoUrl)}" type="video/mp4">
         Your browser does not support the video tag.
       </video>`;

  videoSection.innerHTML = `<h4 class="mb-3">Tour This Apartment</h4>${videoHTML}`;
}

function renderBookingSection(features, pricePerDay) {
  const template = document.getElementById("bookingFormTemplate");
  const clone = template.content.cloneNode(true);
  const priceHeader = clone.querySelector("#priceHeader");
  const featureList = clone.querySelector("#featureList");

  priceHeader.textContent = `Ksh. ${pricePerDay} / night`;

  if (features.length > 0) {
    features.forEach(f => {
      const li = document.createElement("li");
      li.className = "list-group-item";
      li.textContent = `✔️ ${f}`;
      featureList.appendChild(li);
    });
  } else {
    const li = document.createElement("li");
    li.className = "list-group-item text-muted fst-italic";
    li.textContent = "No features listed for this apartment.";
    featureList.appendChild(li);
  }

  const bookingSection = document.getElementById("bookingSection");
  bookingSection.innerHTML = '';
  bookingSection.appendChild(clone);
}

function renderGallery(title, location, bedrooms, bathrooms, parking, image, gallery, reviews, mapLink) {
  const desktopLayout = `
    <div class="d-none d-md-block">
      <div class="row g-2">
        <div class="col-md-8">
          <img src="${getMediaUrl(image)}" class="img-fluid w-100 rounded" alt="${title}">
        </div>
        <div class="col-md-4">
          <div class="row g-2">
            ${gallery.map(img => `<div class="col-12"><img src="${getMediaUrl(img)}" class="img-fluid rounded" alt="Gallery"></div>`).join("")}
          </div>
        </div>
      </div>
      <div class="card-footer bg-white text-start">
        <h2 class="fw-bold mb-2">${title}</h2>
        <p class="text-muted mb-2">
          <i class="bi bi-geo-alt-fill"></i> ${location} ${mapLink ? `<a href="${mapLink}" target="_blank" class="btn btn-outline-primary">View on Map</a>` : ""}
          <span class="ms-2 text-warning"><i class="bi bi-star-fill"></i> ${reviews} Reviews</span>
        </p>
        <p class="mb-3">
          <i class="fa fa-bed me-2"></i> ${bedrooms} Bedroom
          <i class="fa fa-bath mx-2"></i> ${bathrooms} Bathroom
          <i class="bi bi-car-front ms-2"></i> ${parking ? "Parking" : "No Parking"}
        </p>
        <p> 
          Share <i class="bi bi-facebook mx-1"></i>
          <i class="bi bi-instagram mx-1"></i>
          <i class="bi bi-envelope mx-1"></i>
          <i class="bi bi-twitter mx-1"></i>
        </p>
      </div>
    </div>`;

  const mobileLayout = `
    <div class="d-block d-md-none">
      <div id="galleryCarousel" class="carousel slide mb-3" data-bs-ride="carousel">
        <div class="carousel-inner">
          <div class="carousel-item active">
            <img src="${getMediaUrl(image)}" class="d-block w-100 rounded" alt="Main">
          </div>
          ${gallery.map(img => `<div class="carousel-item"><img src="${getMediaUrl(img)}" class="d-block w-100 rounded" alt="Gallery"></div>`).join("")}
        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#galleryCarousel" data-bs-slide="prev"><span class="carousel-control-prev-icon"></span></button>
        <button class="carousel-control-next" type="button" data-bs-target="#galleryCarousel" data-bs-slide="next"><span class="carousel-control-next-icon"></span></button>
      </div>
      <div class="card-footer bg-white text-start">
        <h2 class="fw-bold mb-2">${title}</h2>
        <p class="text-muted mb-2">
          <i class="bi bi-geo-alt-fill"></i> ${location} ${mapLink ? `<a href="${mapLink}" target="_blank" class="btn btn-outline-primary">View on Map</a>` : ""}
          <span class="ms-2 text-warning"><i class="bi bi-star-fill"></i> ${reviews} Reviews</span>
        </p>
        <p class="mb-3">
          <i class="fa fa-bed me-2"></i> ${bedrooms} Bedroom
          <i class="fa fa-bath mx-2"></i> ${bathrooms} Bathroom
          <i class="bi bi-car-front ms-2"></i> ${parking ? "Parking" : "No Parking"}
        </p>
      </div>
    </div>`;

  document.getElementById("gallerySection").innerHTML = desktopLayout + mobileLayout;
}

function renderSimilarListings(listings) {
  const listingGrid = document.getElementById("listingGrid");
  listingGrid.innerHTML = "";
  listings.forEach(similar => {
    const col = document.createElement("div");
    col.className = "col-md-4";
    col.innerHTML = `
      <a href="?id=${similar.id}" class="text-decoration-none text-dark">
        <div class="card-body bg-light rounded-top position-relative">
          <img src="${getMediaUrl(similar.image)}" class="img-fluid mb-3" alt="${similar.title}">
          <span class="position-absolute top-50 end-0 m-3 bg-white border rounded-pill px-3 py-1">Ksh ${similar.price_per_night}</span>
        </div>
        <div class="card-footer bg-white text-start">
          <h5 class="fw-bold mb-1">${similar.title}</h5>
          <p class="text-muted mb-1">
            <i class="bi bi-geo-alt-fill"></i> ${similar.location}
            <span class="ms-2 text-warning"><i class="bi bi-star-fill"></i> ${similar.reviews} Reviews</span>
          </p>
          <p class="mb-2">
            <i class="fa fa-bed me-2"></i> ${similar.bedrooms} Bedroom
            <i class="fa fa-bath mx-2"></i> ${similar.bathrooms} Bathroom
            <i class="bi bi-car-front ms-2"></i> ${similar.parking ? "Parking" : "No Parking"}
          </p>
        </div>
      </a>`;
    listingGrid.appendChild(col);
  });
}

function setupBookingCostCalc(pricePerDay) {
  const checkIn = document.getElementById("checkIn");
  const checkOut = document.getElementById("checkOut");
  const costEstimate = document.getElementById("costEstimate");
  const costWrapper = document.getElementById("costWrapper");

  function calculateCost() {
    const inDate = new Date(checkIn.value);
    const outDate = new Date(checkOut.value);

    if (inDate && outDate && outDate > inDate) {
      const days = Math.ceil((outDate - inDate) / (1000 * 60 * 60 * 24));
      const total = days * pricePerDay;
      costEstimate.innerHTML = `<option selected>${days} night(s) – Ksh ${total.toLocaleString()}</option>`;
      costEstimate.disabled = false;
      costWrapper.classList.remove("d-none");
    } else {
      costEstimate.innerHTML = `<option selected>Invalid date range</option>`;
      costEstimate.disabled = true;
      costWrapper.classList.add("d-none");
    }
  }

  checkIn.addEventListener("change", calculateCost);
  checkOut.addEventListener("change", calculateCost);
}
