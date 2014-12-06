angular.module('UniDrive')
.controller('LoginController', ($scope, $http) =>
  $scope.login = ()=>
    params = {
      email: $scope.email,
      password: $scope.password
      authenticity_token: $("meta[name=\"csrf-token\"]").attr("content")
    }
    login_success = ->
      console.log 'Login successfull!!'
    login_error = ->
      console.log 'login error'

    $http.post('/api/v1/login', params).then(login_success, login_error)


)