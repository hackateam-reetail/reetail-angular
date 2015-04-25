{each} = require 'prelude-ls'
angular.module "reetail"
  .controller "PoiAdminPostCtrl", (poiService, visitorService) !->
    @pois = poiService.getPois!
    @map = { center: { latitude: 49.121523, longitude: 6.179249 }, zoom: 15 }
    @heatLayerCreation = visitorService.heatLayerCreation
    @minAge = @minAgeSelected = visitorService.getMinimumAge!
    @maxAge = @maxAgeSelected = visitorService.getMaximumAge!
    @changeAge = (min,max) !->
      visitorService.getVisitors {age: {min: min, max: max}}
    @close = !~>
      console.info 'close'
      @selectedPoi = null