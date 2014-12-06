angular
  .module('UniDrive')
  .directive 'navbar', ->
    {
      restrict: 'E'
      templateUrl: 'navigation.html'
      controller: 'NavigationController'
    }