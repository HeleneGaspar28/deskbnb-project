import { Controller } from "@hotwired/stimulus"
// import mapboxgl from "mapbox-gl"
import MapboxGeocoder from "@mapbox/mapbox-gl-geocoder"

export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array
  }

    connect() {
    console.log("Map connected 🎯");

    mapboxgl.accessToken = this.apiKeyValue;

    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/mapbox/streets-v12"
    });

    this.map.addControl(
      new MapboxGeocoder({ accessToken: mapboxgl.accessToken, mapboxgl: mapboxgl })
    );

    // now the map is initialized — safe to use it
    if (this.hasMarkersValue) {
      console.log("Markers:", this.markersValue);
      this.#addMarkersToMap();
      this.#fitMapToMarkers();
    } else {
      console.warn("No markers found in data-map-markers-value");
    }
  }


  #addMarkersToMap() {
    console.log("Markers received:", this.markersValue)

    this.markersValue.forEach((marker) => {
      // const customMarker = document.createElement("div")
      // customMarker.style.height = "30px"
      // customMarker.style.width = "30px"
      // customMarker.style.backgroundColor = "blue"
      // // customMarker.style.backgroundImage = `url('${marker.image_url}')`
      // customMarker.style.backgroundSize = "contain"
      // customMarker.style.backgroundRepeat = "no-repeat"

      const popup = new mapboxgl.Popup().setHTML(marker.info_window)

      // to use a custom marker, uncomment the following line
      // new mapboxgl.Marker(customMarker)
      new mapboxgl.Marker()
        .setLngLat([marker.lng, marker.lat])
        .setPopup(popup)
        .addTo(this.map)
    })
  }

  #fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds()
    this.markersValue.forEach(marker => bounds.extend([marker.lng, marker.lat]))
    this.map.fitBounds(bounds, { padding: 50, maxZoom: 15, duration: 2000 })
  }
}
