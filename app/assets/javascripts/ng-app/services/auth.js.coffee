angular.module('UniDrive').service 'auth', ($http, $window) ->
  @current_user = null
  @login = (user) ->
    $http.post('/api/v1/login',
      email: user.email
      password: user.password
      authenticity: user.authenticity_token
    )

  @logout = (user) ->
    $http.delete('/api/v1/logout').then( -> $window.location.replace('/'))

  @isLoggedIn = =>
    true if @current_user?

  @
