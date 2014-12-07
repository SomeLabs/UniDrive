angular.module('UniDrive')
  .controller 'NavigationController', ($scope, $location, $window, auth) ->

    $scope.isActive = (path) ->
      $location.path().indexOf(path) is 0

    $scope.isLoggedIn = auth.isLoggedIn

    $scope.logout = ->
      auth.logout()

    $scope.user = ->
      auth.current_user

    $scope.prev = ->
      $window.history.back()

    $scope.next = ->
      $window.history.forward()

    $scope.status = {
      isopen: false
    }

    $scope.toggleDropdown = ($event) ->
      $event.preventDefault()
      $event.stopPropagation()
      $scope.status.isopen = !$scope.status.isopen
