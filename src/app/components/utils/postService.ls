angular.module \reetail .factory \postalService ,($http, Facebook) ->
  myService = {}
  myService.postToFacebook = (message, page_id, token, callback) ->
    Facebook.api "/#{page_id}/feed", "POST", {message: message, access_token: token}, callback

  myService.postToMobile = (message, callback) ->
    $http.post('http://smsgateway.me/api/v3/messages/send', {email: "sms@reetail.net", password: "thebesthackateam", device:8114, number: ["+33607934705"], message: message}).success(callback)


  myService