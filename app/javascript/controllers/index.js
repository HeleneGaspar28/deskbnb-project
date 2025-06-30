// Import and register all your controllers from the importmap via controllers/**/*_controller
import { Application } from "@hotwired/stimulus"
import MapController from "./map_controller"
import AddressAutocompleteController from "./address_autocomplete_controller"

const application = Application.start()
application.register("map", MapController)
application.register("address-autocomplete", AddressAutocompleteController)
