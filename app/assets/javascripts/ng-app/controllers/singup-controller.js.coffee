angular.module('UniDrive')
.controller('SignupController', ($scope) =>
  $scope.signup = ()=>
    params = {
      name: $scope.name
      email: $scope.email
      password: $scope.password
      confirm_password: $scope.confirm
    }

    $http.post('api/v1/registrations', params).success((response)->
      debugger
    ).error((response)->

    )
)