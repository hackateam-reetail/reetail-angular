angular.module 'reetail', <[ ngAnimate ngCookies ngTouch ngSanitize ngResource ngRoute ngMaterial ]>
.config ($routeProvider) !->
  $routeProvider
  .when "/" do
    templateUrl: "app/main/main.html"
    controller: "MainCtrl"
  .otherwise do
    redirectTo: "/"

