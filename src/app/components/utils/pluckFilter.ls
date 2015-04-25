{map} =require 'prelude-ls'

angular.module \reetail .filter 'pluck' ->
  (data, prop)->
    map ->
      it[prop]
    ,data