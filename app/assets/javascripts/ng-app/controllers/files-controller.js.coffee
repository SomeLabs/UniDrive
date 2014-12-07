angular.module('UniDrive')
  .controller('FilesController', ($scope, $http, $location, $routeParams, $modal, $window) ->
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
        'dropbox_oauth2': 'fa-dropbox',
        'google_oauth2': 'fa-google'
      }
      providers[provider]

    $scope.showMoreInfo = (file) ->
      $scope.selected = file

    $scope.open = (file) ->
      if file.is_dir
        $location.path("/files/#{file.id}")
      else
        # ask for downloading/opening file
        $http.get("/api/v1/files/#{file.id}/link").then( (response) ->
          $window.open(response.data.link, 'Opening File', "resizable=no,menubar=no,scrollbars=no, top=150,left=350,location=no,resizable=no,status=no")
        #   $modal.open({
        #     template: "<iframe src='#{response.data.link}' height='100%', width='100%'></iframe>",
        #     size: 'lg'
        #   })
        )

    $scope.files = $http.get(@path()).then(@files_success, @files_error)
  )