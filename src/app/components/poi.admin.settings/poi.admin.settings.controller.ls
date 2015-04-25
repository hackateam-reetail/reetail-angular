{each} = require 'prelude-ls'
angular.module "reetail"
  .controller "PoiAdminSettingsCtrl", ($routeParams, Facebook, poiService, visitorService) !->
    @poi = poiService.get $routeParams.id
    @login = !->
      Facebook.login !->
        console.info it
      , {scope: 'manage_pages, publish_pages'}
    @getInfos = !->
      console.info 'getting infos'
      Facebook.api '/me/accounts', (data) !~>
        console.info data
        @pages = data.data
    @savePageToken = (page)!~>
      @pageToken = page.access_token
      @pageId = page.id
      Facebook.api "/#{@pageId}", (data) !~>
        @page = data
    @sendPost = (post, page) !~>
      Facebook.api "/#{@pageId}/feed", "POST", {message: post, access_token: @pageToken}, -> console.info it