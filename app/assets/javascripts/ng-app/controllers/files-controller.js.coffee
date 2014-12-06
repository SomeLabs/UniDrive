angular.module('UniDrive')
  .controller('FilesController', ($scope, $http, $routeParams) ->
    @id = $routeParams.id
    $scope.files = []
    @path = =>
      if @id?
        "/api/v1/files/#{@id}"
      else
        "/api/v1/files"

    @files_success = (response) ->
      $scope.files = response.data

    @files_error = (response) ->
      debugger
      $scope

    $scope.files = $http.get(@path()).then(@files_success, @files_error)
  )