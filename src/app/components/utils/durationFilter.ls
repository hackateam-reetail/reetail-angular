{mean} =require 'prelude-ls'

angular.module \reetail .filter 'duration' ->
  (data) ->
    data |> filter (.left) |> map -> (it.left - it.entered)

