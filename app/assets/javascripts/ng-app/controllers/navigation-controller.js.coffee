angular.module('UniDrive')
  .controller 'NavigationController', ($scope, $location, auth) ->

    $scope.isActive = (path) ->
      $location.path() == path

    $scope.isLoggedIn = auth.isLoggedIn

    $scope.logout = ->
      auth.logout().then(-> auth.current_user = null)