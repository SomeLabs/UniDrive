angular.module('UniDrive').service 'auth', ($http) ->
  @current_user = null
  @login = (user) ->
    $http.post '/api/v1/login',
      email: user.email
      password: user.password
      authenticity: user.authenticity_token

  @logout = (user) ->
    $http.delete '/api/v1/logout'

  @isLoggedIn = =>
    true if @current_user?
  @