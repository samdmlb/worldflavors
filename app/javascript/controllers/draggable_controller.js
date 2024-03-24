import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="draggable"
export default class extends Controller {

  connect() {
    this.initialPosition()
    this.draggable()
  }

  initialPosition() {
    var mapContainer = document.getElementById("map-container");
    var initialScrollX = 400
    var initialScrollY = 900
    mapContainer.scrollTo(initialScrollX, initialScrollY);
  }

  draggable() {
    var mapContainer = document.getElementById("map-container");
    var isDragging = false;
    var startX, startY, translateX, translateY;

    // Event listener for mouse/touch down on map container
    mapContainer.addEventListener("mousedown", startDrag);
    mapContainer.addEventListener("touchstart", startDrag);

    // Event listener for mouse/touch move
    document.addEventListener("mousemove", drag);
    document.addEventListener("touchmove", drag);

    // Event listener for mouse/touch up
    document.addEventListener("mouseup", endDrag);
    document.addEventListener("touchend", endDrag);

    // Function to start dragging
    function startDrag(event) {
        if (event.target.closest('.modal') || event.target.closest('.button-country')) {
            return;
        }

        event.preventDefault();
        isDragging = true;
        startX = event.clientX || event.touches[0].clientX;
        startY = event.clientY || event.touches[0].clientY;
        translateX = mapContainer.scrollLeft;
        translateY = mapContainer.scrollTop;
    }

    // Function to handle dragging
    function drag(event) {
        if (!isDragging) return;
        var newX = (event.clientX || event.touches[0].clientX) - startX;
        var newY = (event.clientY || event.touches[0].clientY) - startY;
        mapContainer.scrollLeft = translateX - newX;
        mapContainer.scrollTop = translateY - newY;
    }

    // Function to end dragging
    function endDrag() {
        if (isDragging) {
            isDragging = false;
            return;
        }
    }
  }
}
