{filter, reject, minimum-by, maximum-by} = require 'prelude-ls'

angular.module \reetail .factory \visitorService , (uiGmapGoogleMapApi, poiService)->
  myService = {visitors: [
  {id: 0, name: 'Jacquie', where: 1, age: 65}
  {id: 1, name: 'Michel', where: 0, age: 65}]}
  each !->
    #Deux dates le même jour, pour simuler une visite de quelques heures
    d = new Date(chance.timestamp!)
    if chance.bool!
      d1 = chance.date {day:d.getDay!, month: d.getMonth!, year: d.getYear!}
    else
      d.setDate(new Date(Date.now!).getDate!)
      d.setMonth(new Date(Date.now!).getMonth!)
      d.setYear(new Date(Date.now!).getFullYear!)
    dates = [d, d1].sort!
    myService.visitors.push(id: it, name: chance.first! , age: chance.age!, where: chance.integer({min: 0, max: 400}), entered: dates[0], left: dates[1])
  , [2 to 1000]
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