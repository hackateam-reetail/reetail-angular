{each} =require 'prelude-ls'
angular.module \reetail .factory \poiService ,($firebaseArray, $q,uiGmapGoogleMapApi) ->
  myService = {firebaseUrl :  'https://sweltering-inferno-2712.firebaseio.com/metz/poi'}
  myService.poiList = $firebaseArray(new Firebase(myService.firebaseUrl))
  myService.getPois = ->
    deferred = $q.defer!
    myService.poiList.$loaded ->
      deferred.resolve it
    deferred.promise
  myService.get = (uid) ->
    deferred = $q.defer!
    myService.poiList.$loaded ->
      deferred.resolve it.$getRecord uid
    deferred.promise
  myService.save = (poi)->
    myService.poiList.$loaded ->
      myService.poiList.$save(poi)
  myService.heatLayerCreation = (layer) !->
    myService.layer = layer
    uiGmapGoogleMapApi.then (maps) !->
      myService.maps = maps
      points = new maps.MVCArray
      myService.poiList.$loaded !->
        console.info myService.poiList
        each (poi)!->
          each (usr) !->
            points.push new maps.LatLng(Number(poi.lat), Number(poi.lon)) if poi.lat && poi.lon
          , values poi.users
        , it
      console.info points
      layer.setData points
  myService.getMinimumAge = -> 0
  myService.getMaximumAge = -> 100

  myService