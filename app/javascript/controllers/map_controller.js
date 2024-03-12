// app/javascript/controllers/map_controller.js

import { Controller } from "@hotwired/stimulus"
import mapboxgl from 'mapbox-gl' // Don't forget this!

export default class extends Controller {
  static values = {
    apiKey: String
  }

  connect() {
    console.log("Hello from map_controller / connect")
    mapboxgl.accessToken = this.apiKeyValue;
    this.setMap(); // Appel initial lorsque le contrôleur est initialisé
    document.addEventListener("turbo:load", () => this.setMap()); // Gestion de l'événement turbo:load
  }

  setMap() {

    const sw = new mapboxgl.LngLat(-13.8363, 34.4163);
    const ne = new mapboxgl.LngLat(19.5555, 57.8713);
    const bounds = new mapboxgl.LngLatBounds(sw, ne);

    this.map = new mapboxgl.Map({
      container: this.element.id, // container ID
      style: 'mapbox://styles/yolande004/cltnhcwcy00di01qo1ck2c9jd', // style URL
      center: [9, 47], // starting position [lng, lat]
    });

    this.map.fitBounds(bounds, {
      padding: 20, // optional padding
    });
  }
}
