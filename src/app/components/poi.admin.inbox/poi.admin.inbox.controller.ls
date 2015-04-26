{each} = require 'prelude-ls'
angular.module "reetail"
  .controller "PoiAdminInboxCtrl", (poiService, $routeParams) !->
   poiService.get $routeParams.id .then ~>
    @poi = it
