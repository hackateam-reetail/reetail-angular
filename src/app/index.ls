angular.module 'reetail', <[ ngAnimate ngCookies ngTouch ngSanitize ngResource ngRoute ngMaterial uiGmapgoogle-maps angularMoment facebook firebase ]>
.config ($routeProvider) !->
  $routeProvider
  .when "/" do
    templateUrl: "app/main/main.html"
    controller: "MainCtrl"
  .when '/poi' do
    templateUrl: "app/components/poi/poi.html"
    controllerAs: "poiCtrl"
    controller: "PoiCtrl"
  .when '/poiAdmin/:id' do
    templateUrl: "app/components/poi.admin/poi.admin.html"
    controllerAs: "poiAdminCtrl"
    controller: "PoiAdminCtrl"
  .when '/poiAdmin/:id/post' do
    templateUrl: "app/components/poi.admin.post/poi.admin.post.html"
    controllerAs: "poiAdminPostCtrl"
    controller: "PoiAdminPostCtrl"
  .when '/poiAdmin/:id/settings' do
    templateUrl: "app/components/poi.admin.settings/poi.admin.settings.html"
    controllerAs: "poiAdminSettingstCtrl"
    controller: "PoiAdminSettingsCtrl"
  .otherwise do
    redirectTo: "/"
.config (uiGmapGoogleMapApiProvider) !->
  uiGmapGoogleMapApiProvider.configure do
      v: '3.17',
      libraries: 'weather,geometry,visualization'
.config (FacebookProvider) ->
  FacebookProvider.init do
    appId: '938092079575672',
    status: true,
    cookie: true,
    xfbml: true,
    version: 'v2.3'
.run (amMoment)->
  amMoment.changeLocale \fr