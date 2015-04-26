{filter, reject, minimum-by, maximum-by} = require 'prelude-ls'

angular.module \reetail .factory \visitorService , (uiGmapGoogleMapApi, poiService)->
  myService = {firebaseUrl :  'https://sweltering-inferno-2712.firebaseio.com/metz/poi'}

  myService.getVisitors = (selector) ->
    visitors = myService.visitors
    if selector
      visitors = visitors |> reject (.left && !selector.all) |> filter (.age > selector.age.min || !selector.age.min) |> filter (.age < selector.age.max || !selector.age.max)
    points = new myService.maps.MVCArray
    each !->
      p = poiService.get(it.where)
      if p
        points.push new myService.maps.LatLng p.lat,p.lon
    , visitors
    myService.layer.setData points

    visitors

  myService.getVisitorsIn = (poiId, selector) ->
    myService.visitors
    |> filter (.where == Number(poiId))
    |> reject (.left && (!selector || !selector.all))

  myService.getMinimumAge = ->
    minimum-by (.age), myService.visitors .age

  myService.getMaximumAge = ->
    maximum-by (.age), myService.visitors .age

  myService.heatLayerCreation = (layer) !->
    myService.layer = layer
    uiGmapGoogleMapApi.then (maps) !->
      myService.maps = maps
      points = new maps.MVCArray
      each !->
        p = poiService.get(it.where)
        points.push new maps.LatLng Number(p.lat), Number(p.lon) if p && p.lat && p.lon
      , myService.visitors
      layer.setData points

  myService