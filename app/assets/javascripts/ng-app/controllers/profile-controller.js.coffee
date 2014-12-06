angular.module('UniDrive')
.controller('ProfileController', ($scope, $window) =>
  $scope.openDropboxDialog = ()->
    $window.open('/auth/dropbox_oauth2', 'Social Authentication', "height=409,width=562")
    return true
)