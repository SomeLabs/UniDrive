#= require jquery
#= require jquery_ujs
#= require turbolinks
#= require angular
#= require angular-bootstrap
#= require angular-animate
#= require angular-aria
#= require angular-cookies
#= require angular-messages
#= require angular-resource
#= require angular-route
#= require angular-sanitize
#= require angular-touch
#= require angular-route
#= require angular-google-chart
#= require angular-rails-templates
#= require_tree ../templates
#= require_tree .


window.UD = {}
$(document).on 'page:load', ->
  $('[ng-app]').each ->
    module = $(this).attr('ng-app')
    angular.bootstrap(this, [module])



$(document).ready(()->
  setTimeout ()->
    $('body').bind('dropbox_oauth2_auth_passed', ()->
      if angular.element('#angular-view-container').scope()
        angular.element('#angular-view-container').scope().dropBoxAuthPassed();
    )
    $('body').bind('dropbox_oauth2_auth_failed', ()->
      if angular.element('#angular-view-container').scope()
        angular.element('#angular-view-container').scope().dropBoxAuthFailed();
    )
)