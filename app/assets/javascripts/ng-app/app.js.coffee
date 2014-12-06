angular.module('UniDrive', ['ngRoute', 'templates']).config(($routeProvider, $locationProvider) =>
  $routeProvider.when('/', {
    templateUrl: 'home.html'
    controller: 'HomeController'
  }).when('/login', {
    templateUrl: 'login.html'
    controller: 'LoginController'
  })

#  $locationProvider.html5Mode(true)
)
