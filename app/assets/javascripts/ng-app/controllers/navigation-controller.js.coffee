angular.module('UniDrive')
  .controller 'NavigationController', ($scope, $location, auth) ->

    $scope.isActive = (path) ->
      $location.path() == path

    $scope.isLoggedIn = auth.isLoggedIn

    $scope.logout = ->
      auth.logout()

    $scope.user = ->
      auth.current_user

    $scope.status = {
      isopen: false
    }

    $scope.toggleDropdown = ($event) ->
      $event.preventDefault()
      $event.stopPropagation()
      $scope.status.isopen = !$scope.status.isopen
