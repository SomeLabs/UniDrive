angular.module('UniDrive')
.controller('LoginController', ($scope) =>
  $scope.login = ()=>
    params = {
      email: $scope.email,
      password: $scope.password
    }

    $http.post('api/v1/sessions', params).success(()->
      debugger
    )


)