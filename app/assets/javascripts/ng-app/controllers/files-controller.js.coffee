angular.module('UniDrive')
  .controller('FilesController', ($scope, $http, $location, $routeParams) ->
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
      $scope

    $scope.getProviderClass = (provider) ->
      providers = {
        'dropbox_oauth2': 'fa-dropbox'
      }
      providers[provider]

    $scope.showMoreInfo = (file) ->
      console.log file

    $scope.open = (file) ->
      if file.is_dir
        $location.path("/files/#{file.id}")
      else
        # ask for downloading/opening file
        console.log('download file')

    $scope.files = $http.get(@path()).then(@files_success, @files_error)
  )