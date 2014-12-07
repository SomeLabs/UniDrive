  angular
  .module('UniDrive', [
    'ui.bootstrap',
    'googlechart',
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
    $httpProvider.interceptors.push('AuthInterceptor')
  )
  .run( ($location, auth, current_user ) ->
    public_paths = ['/', '/login', '/about', '/signup']
    if current_user?
      auth.current_user = current_user
      if $location.path() in public_paths
        $location.path('/files')
    else if $location.path() not in public_paths
      $location.path('/login')

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
      .when('/profile', {
        templateUrl: 'profile.html'
        controller: 'ProfileController'
      })
      .when('/about', {
        templateUrl: 'about.html'
      })
      .when('/files', {
        templateUrl: 'files.html'
        controller: 'FilesController'
      })
      .when('/files/:id', {
        templateUrl: 'files.html'
        controller: 'FilesController'
      })

    $locationProvider.html5Mode(true)
  )
  # .value('googleChartApiConfig', {
  #   version: '1'
  #   }
  # )
