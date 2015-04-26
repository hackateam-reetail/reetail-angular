{each, find} = require 'prelude-ls'
angular.module "reetail"
  .controller "PoiCtrl", (poiService, $location) !->
    poiService.getPois!.then ~>
      @pois = it
      i = 0
      @poisMarkers = map -> {id: i++, latitude: it.lat, longitude: it.lon}, @pois
      if $location.search!.poi
        @selectedPoi = find (.$id === $location.search!.poi), @pois
    @markerClicked = (clickedPoi)->
        @selectedPoi = clickedPoi
        @location(clickedPoi)
    @location = (poi)->
      $location.search('poi', poi.$id)
    @map = { center: { latitude: 49.121523, longitude: 6.179249 }, zoom: 15 }
    @heatLayerCreation = poiService.heatLayerCreation
    @minAge = @minAgeSelected = poiService.getMinimumAge!
    @maxAge = @maxAgeSelected = poiService.getMaximumAge!
    @changeAge = (min,max) !->
      poiService.getVisitors {age: {min: min, max: max}}
    @close = !~>
      console.info 'close'
      @selectedPoi = null