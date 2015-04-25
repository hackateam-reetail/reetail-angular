angular.module \reetail .factory \poiService ,($firebaseArray) ->
  myService = {firebaseUrl :  'https://sweltering-inferno-2712.firebaseio.com/metz/poi'}
  myService.poiList = $firebaseArray(new Firebase(myService.firebaseUrl))
  myService.getPois = ->
    myService.poiList
  myService.addPoi = ->
    it.id = myService.poiList.length
    myService.poiList.push(it)
  myService.get = ->
    myService.poiList.$getRecord(Number(it).toString())
  myService