angular.module \reetail .directive \navbar , ->
  {
  restrict: 'E'
  scope : {poiId: '=' },
  templateUrl: 'app/components/navbar/navbar.html'
  }