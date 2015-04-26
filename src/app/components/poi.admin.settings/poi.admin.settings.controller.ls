{each} = require 'prelude-ls'
angular.module "reetail"
  .controller "PoiAdminSettingsCtrl", ($routeParams, Facebook, poiService) !->
    @poiLoading = true
    @poiId = $routeParams.id
    poiService.get $routeParams.id .then !~>
      @poiLoading = false
      @poi = it
      @fbLoading = true
      if @poi.fb_page_id then
        Facebook.api "/#{@poi.fb_page_id}",'GET', {access_token: @poi.fb_token}, (data) !~>
          @fbLoading = false
          @page = data

    @login = !~>
      Facebook.login !~>
        console.info 'login'
        Facebook.api '/me/accounts', (data) !~>
          @pages = data.data
          @fbLoading = false
      , {scope: 'manage_pages, publish_pages'}
    @savePageToken = (page)!~>
      @page = page
      @poi.fb_page_id = page.id
      @poi.fb_token = page.access_token
      poiService.save @poi