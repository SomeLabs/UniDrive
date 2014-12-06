angular.module('UniDrive')
.controller('LoginController', ($scope, $httpProvider) =>
  $scope.login = ()=>
    params = {
      email: $scope.email,
      password: $scope.password
    }

    $http.post('api/v1/sessions', params).success(()->
      debugger
    )


)