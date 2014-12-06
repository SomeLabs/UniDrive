angular
  .module('UniDrive', [
    'ngRoute',
    'ngAnimate',
    'ngAria',
    'ngCookies',
    'ngMessages',
    'ngResource',
    'ngSanitize',
    'ngTouch',
    'templates'
  ])
  .config( ($httpProvider) ->
    $httpProvider.defaults.headers.common["X-CSRF-Token"] = $("meta[name=\"csrf-token\"]").attr("content")
  )
  .config(($routeProvider, $locationProvider) =>
    $routeProvider
      .when('/', {
        templateUrl: 'home.html'
        controller: 'HomeController'
      })
      .when('/login', {
        templateUrl: 'login.html'
        controller: 'LoginController'
      })
      .when('/signup', {
        templateUrl: 'signup.html'
        controller: 'SignupController'
      })

    $locationProvider.html5Mode(true)
  )
