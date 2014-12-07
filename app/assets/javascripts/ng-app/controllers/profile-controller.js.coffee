angular.module('UniDrive')
.controller('ProfileController', ($scope, $window, $http, auth) =>
  $scope.openDropboxDialog = ()->
    $window.open('/auth/dropbox_oauth2', 'Social Authentication', "height=430,width=580,resizable=no,menubar=no,scrollbars=no, top=150,left=350,location=no,resizable=no,status=no")
    return true

  $scope.openLiveDialog = () ->
    $window.open('/auth/windowslive', 'Social Authentication', "height=430,width=580,resizable=no,menubar=no,scrollbars=no, top=150,left=350,location=no,resizable=no,status=no")
    return true

  $scope.openDriveDialog = () ->
    $window.open('/auth/google_oauth2', 'Social Authentication', "height=430,width=580,resizable=no,menubar=no,scrollbars=no, top=150,left=350,location=no,resizable=no,status=no")
    return true

  $scope.chartObject = {};

  $http.get('/api/v1/user').then( (response) =>
    auth.current_user = response.data
    chartData = {
      cols: [
        {id: "service", label: "Provider", type: "string"},
        {id: "used", label: "Space Used", type: "number"}
      ],
      rows: [
        {c: [
          {v: 'Google'},
          {v: 80}
        ]},
        {c: [
          {v: 'SkyDrive'},
          {v: 30}
        ]}
      ]
    }
    $scope.chartObject.data = chartData
    $scope.chartObject.type = 'PieChart'
    $scope.chartObject.options = {
        'title': 'Your current Usage'
    }
  )
  $scope.dropBoxAuthPassed = () ->
    # Do something
)