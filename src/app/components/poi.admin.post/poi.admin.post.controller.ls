{each} = require 'prelude-ls'
angular.module "reetail"
  .controller "PoiAdminPostCtrl", (poiService,$routeParams, postalService) !->
   poiService.get $routeParams.id .then ~>
    @poi = it

    @map = { center: { latitude: 49.121523, longitude: 6.179249 }, zoom: 15 }
    @heatLayerCreation = poiService.heatLayerCreation
    @minAge = @minAgeSelected = poiService.getMinimumAge!
    @maxAge = @maxAgeSelected = poiService.getMaximumAge!
    @changeAge = (min,max) !->
      poiService.getVisitors {age: {min: min, max: max}}
    @close = !~>
      console.info 'close'
      @selectedPoi = null
    @postMessage = (titre, corps, reseaux) !~>
      console.info reseaux
      if reseaux && reseaux.facebook && @poi.fb_page_id
        postalService.postToFacebook(corps, @poi.fb_page_id, @poi.fb_token, ->console.info it)
      if reseaux && reseaux.texto
        console.info('text')
        postalService.postToMobile(corps,->console.info it)
