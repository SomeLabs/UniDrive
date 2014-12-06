angular.module('UniDrive')
.controller('ProfileController', ($scope, $window) =>
  $scope.openDropboxDialog = ()->
    $window.open('/auth/dropbox_oauth2', 'Social Authentication', "height=430,width=580,resizable=no,menubar=no,scrollbars=no, top=150,left=350,location=no,resizable=no,status=no")
    return true

  $scope.openLiveDialog = () ->
    $window.open('/auth/windowslive', 'Social Authentication', "height=430,width=580,resizable=no,menubar=no,scrollbars=no, top=150,left=350,location=no,resizable=no,status=no")
    return true

  $scope.openDriveDialog = () ->
    $window.open('/auth/google_oauth2', 'Social Authentication', "height=430,width=580,resizable=no,menubar=no,scrollbars=no, top=150,left=350,location=no,resizable=no,status=no")
    return true

  $scope.dropBoxAuthPassed = () ->
    # Do something
)