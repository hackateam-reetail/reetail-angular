{mean} =require 'prelude-ls'

angular.module \reetail .filter 'duration' ->
  (data) ->
    data |> filter (.left) |> map -> (it.left - it.entered)

angular.module \reetail .filter \toTime ->
  (data) ->
    sec_num = parseInt data  || 0
    hours   = Math.floor sec_num/3600
    minutes = Math.floor((sec_num - (hours * 3600)) / 60);
    seconds = sec_num - (hours * 3600) - (minutes * 60);

    if (hours   < 10) then hours   = "0"+hours
    if (minutes < 10) then minutes = "0"+minutes
    if (seconds < 10) then seconds = "0"+seconds
    "#{hours}h#{minutes}mn"



