angular.module \reetail .directive \poiDetail , ->
  {
  restrict: 'E'
  scope: {poi : \= , closeMe : '&' }
  controllerAs: \poiDetail
  templateUrl: 'app/components/poi/poi.directive.html'
  controller : (poiService) ->
    @visitors = poiService.getVisitorsIn
  }
