angular.module 'reetail', <[ ngAnimate ngCookies ngTouch ngSanitize ngResource ngRoute ngMaterial uiGmapgoogle-maps ]>
.config ($routeProvider) !->
  $routeProvider
  .when "/" do
    templateUrl: "app/main/main.html"
    controller: "MainCtrl"
  .when '/poi' do
    templateUrl: "app/components/poi/poi.html"
    controllerAs: "poiCtrl"
    controller: "PoiCtrl"
  .otherwise do
    redirectTo: "/"
.config (uiGmapGoogleMapApiProvider) !->
  uiGmapGoogleMapApiProvider.configure do
      v: '3.17',
      libraries: 'weather,geometry,visualization'