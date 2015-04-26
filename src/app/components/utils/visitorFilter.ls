{values, reject} =require 'prelude-ls'

angular.module \reetail .filter 'visitors' ->
  (data, getAll) ->
    data |> values |> reject (.left && !getAll)

angular.module \reetail .filter 'length' ->
  (data) -> if data || !data.length then data.length  else 'Aucun'