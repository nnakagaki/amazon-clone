angular.module('amazon-clone', [
  'ngAnimate',
  'ui.router',
  'templates'
]);

angular.module('amazon-clone').config(function ($stateProvider, $urlRouterProvider, $locationProvider) {
	$stateProvider.state('home', {
    url: '/',
    templateUrl: 'home.html',
    controller: 'HomeCtrl'
  });

  // default fall back route
  $urlRouterProvider.otherwise('/');

  // enable HTML5 Mode for SEO
  $locationProvider.html5Mode(true);
});