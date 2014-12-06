angular.module('UniDrive')
.controller('LoginController', ($scope, $location, auth) =>
  $scope.loginError = false
  $scope.login = ()=>
    $scope.user['authenticity_token'] = $("meta[name=\"csrf-token\"]").attr("content")

    if $scope.loginForm.$valid
      login_success = (response)->
        auth.current_user = response.data.model
        $location.path('/files')

      login_error = (response) ->
        $scope.loginError = response.data.message
      auth.login($scope.user).then(login_success, login_error)
)