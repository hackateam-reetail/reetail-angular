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
        @fb_sending = true
        @fb_sent = false
        postalService.postToFacebook "#{titre} \n #{corps}", @poi.fb_page_id, @poi.fb_token, ~>
          @fb_sending = false
          @fb_sent = true
      if reseaux && reseaux.texto
        @texto_sending = true
        postalService.postToMobile titre,->
          @texto_sent = true
          @texto_sending = false
      if reseaux && reseaux.wordpress
        @wp_sending = true
        postalService.postToWordPress @poi.$id, titre, corps, ~>
          @wp_sent = true
          @wp_sending = false