'use strict'

angular.module 'labouchereApp', [
  'ngCookies',
  'ngResource',
  'ngSanitize',
  'ngRoute'
]
.config ($routeProvider, $locationProvider) ->
  $routeProvider
  .otherwise
    redirectTo: '/'

  $locationProvider.html5Mode true
