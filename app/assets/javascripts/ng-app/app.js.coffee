angular.module('UniDrive', ['ngRoute', 'templates']).config(($routeProvider, $locationProvider) =>
  $routeProvider.when('/', {
    templateUrl: 'home.html'
    controller: 'HomeController'
  })

#  $locationProvider.html5Mode(true)
)
