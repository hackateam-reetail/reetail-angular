angular.module \reetail .factory \postalService ,($http, $resource, Facebook, $base64) ->
  myService = {}
  cb = new Codebird
  cb.setConsumerKey "NcaZFnC8FVj7L4rTBWMbxrTZL", "RO9JcddapP7Aq5sRfzwEqXBStZyHyqYPg5hrWyCeVZ3B7r4C5J"

  cb.__call "oauth2_token" {}, ->
    myService.bearer_token = it.access_token

  params = q: 'METZ'

  myService.searchTweets = (q, callback)->
    cb.__call "search_tweets", params, callback, true

  myService.postToFacebook = (message, page_id, token, callback) ->
    Facebook.api "/#{page_id}/feed", "POST", {message: message, access_token: token}, callback

  myService.postToMobile = (message, callback) ->
    $http.post('http://reetail.net/api/posts', {titre: message}).success(callback)

  myService.postToWordPress = (id, titre, message, callback) ->
    $http.post("http://192.168.1.126:3000/reetail/#{id}/wp-json/posts", {title: titre, content_raw: message, status: "publish"}, {headers: {'Authorization': 'Basic ' + $base64.encode('adminrtl:hackateamfnsj57')}}).success callback




  myService