angular.module \reetail .factory \poiService, ->
  myService = {poiList: [{id: 0, name: 'Trinitaires', lat: 49.121523, lon: 6.179249}, {id: 1, name: 'les arrangés du bocal', lat: 49.119596, lon: 6.177782}]}
  each !->
    myService.poiList.push(id: it, lat: chance.latitude({min: 49.11, max: 49.13}) , lon: chance.longitude({min: 6.16, max: 6.18}) , name: chance.sentence({words: 2})  )
  , [2 to 20]
  myService.getPois = ->
    myService.poiList
  myService.addPoi = ->
    it.id = myService.poiList.length
    myService.poiList.push(it)
  myService.get = ->
    myService.poiList[it]
  myService