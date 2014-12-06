angular.module('UniDrive')
  .factory('AuthInterceptor', ($q, $injector)->
    @request =  (config) ->
      config.headers["X-CSRF-Token"] = $("meta[name=\"csrf-token\"]").attr("content")
      config
    @responseError = (response)->
      unless response.status in [401, 403, 407, 406, 423]
        $locationProvider = $injector.get('$locationProvider')
        $locationProvider.path('/login')
      $q.reject(response)
    @
  )