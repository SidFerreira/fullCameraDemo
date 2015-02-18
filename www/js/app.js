angular.module('starter', ['ionic', 'starter.controllers', 'ngCordova'])
.run(function($ionicPlatform) {
  $ionicPlatform.ready(function() {
    if (window.cordova && window.cordova.plugins.Keyboard) {
      cordova.plugins.Keyboard.hideKeyboardAccessoryBar(true);
    }
    if (window.StatusBar) {
      StatusBar.styleDefault();
    }
  });
})
/*.config(function(fullCameraProvider) {
      var options = fullCameraProvider.getGlobalOptions();
      options.stringAppFolder = "cordovaApp";
      fullCameraProvider.setGlobalOptions(options);
})*/
.config(function($stateProvider, $urlRouterProvider) {
  $stateProvider
  .state('home', {
    url: '/home',
    templateUrl: 'templates/home.html',
    controller: 'homeCtrl'
  })
  $urlRouterProvider.otherwise('home');

});
