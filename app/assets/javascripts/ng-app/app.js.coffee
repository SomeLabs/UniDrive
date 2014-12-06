angular.module('UniDrive', ['ngRoute', 'templates']).config(($routeProvider, $locationProvider) =>
  $routeProvider.when('/', {
    templateUrl: 'home.html'
    controller: 'HomeController'
  }).when('/login', {
    templateUrl: 'login.html'
    controller: 'LoginController'
  }).when('/signup', {
    templateUrl: 'signup.html'
    controller: 'SignupController'
  })

  $locationProvider.html5Mode(true)
)
